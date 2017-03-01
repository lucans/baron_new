var SERVER_PATH = 'server/';

var app = angular.module('baron', ['ui.router','ngMask','720kb.datepicker','ngSanitize'])


.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("app/Pedidos");
    $stateProvider        
        .state('menu', {
          url: "/app",
          templateUrl: "partials/menu.html",
          controller: "pedidosCtrl"
        })
        .state('menu.pedidos', {
          url: "/Pedidos",
          templateUrl: "views/pedidos.html",
          controller: "pedidosCtrl"
        })         
        .state('menu.estoque', {
          url: "/Estoque",
          templateUrl: "views/estoque.html",
          controller: "estoqueCtrl"
        })          
        .state('menu.relatorio_fechamento', {
          url: "/RelatorioFechamento",
          templateUrl: "views/relatorio_fechamento.html",
          controller: "relatorioCtrl"
        })          
        .state('menu.precos', {
          url: "/Precos",
          templateUrl: "views/precos.html",
          controller: "precosCtrl"
        })            
        .state('login', {
          url: "/Login",
          templateUrl: "partials/login.html",
          controller: "userCtrl"
        })
}) 

.service('DateProvider', function () {

    this.date = new Date();
    this.payment = new Date();
    
    this.getHoje = function () {
        var today = this.date.getDate();
        var today = today + "/" + (this.date.getMonth()+1 < 10 ? '0' + (this.date.getMonth()+1) : (this.date.getMonth()+1) );
        var today = today + "/" + this.date.getFullYear();

        return today;
    }

    this.getAno = function () {
        return this.date.getFullYear();
    }

 // this.getMes = function () {
    //     var month = this.date.getMonth()+1;
    //     // console.log(month);
      
    //     switch(month){
    //         case 1:
    //             return "Janeiro";
    //             break;         
    //         case 2:
    //             return "Fevereiro";
    //             break;         
    //         default:         
    //             return 'Hoje';
    //     }
    // }
   
    this.dayOfWeek = function () {
        var weekDay = this.date.getDay();   

        switch(weekDay){
            case 1:
                return 'Segunda-Feira';
                break;         
            case 2:
                return 'Terça-Feira';
                break;         
            case 3:
                return 'Quarta-Feira';
                break;         
            case 4:
                return 'Quinta-Feira';
                break;         
            case 5:
                return 'Sexta-Feira';
                break;         
            case 6:
                return 'Sábado';
                break;         
            case 7:
                return 'Domingo';
                break;
            default:         
                return 'Hoje';
        }
    }
})


app.controller("userCtrl", ['$scope', '$http', '$rootScope','$location', function ($s, $http, $rs, $location) {            
    

    $(document).ready(function() {
        $('select').material_select();
    });

    var classe = 'Usuario';

    $s.paciencia = 2;
    $s.showToast = function(message){  
        if ($s.paciencia <= 0) { message = message + ', seu Animal!'; }
        Materialize.toast(message, 3000);
        $s.paciencia--;
        console.log($s.paciencia);
    };

    $s.goRota = function(rota){ 
        if (rota) {
            $location.path(rota);
        }
    };

    $s.userAuth = function(oUser){          
        $s.func = 'userAuth';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oUser: oUser
        }).success(function(result){
            $rs.user = result;

            if ($rs.user) { 
                $s.goRota('/Pedidos');
            } else {
                $s.showToast('Usuário ou senha inválidos');
            }
        });
    }

    $s.verificaUserSession = function(){
        $s.p = 'verificaUserSession';
        $http.get("server/dao/redirect.php?p=" + $s.p).then(function (result) {  
            if (result.data != 'false') {                    
                $rs.user = result[0];
            } else {                
                $s.goRota('/Login');    
            }
        });
    };

    $s.userLogout = function(){
        $s.p = 'userLogout';
        $http.post("server/dao/redirect.php?p=" + $s.p).success($s.goRota('/Login')); 
    }


}]);


app.controller("pedidosCtrl", ['$scope', '$http', '$rootScope','DateProvider', function ($s, $http, $rs, Date) {


    $(document).ready(function(){
        $('.collapsible').collapsible({
          accordion : false
        });
    });

    $(document).ready(function() {
        $('select').material_select();
     });

    $rs.dia_semana = Date.dayOfWeek();

    var hoje = Date.getHoje();
    console.log(hoje);

    var classe = 'Pedido';

    $s.paciencia = 2; 
    $s.showToast = function(message){  
        if ($s.paciencia <= 0) { message = message + ', mermão!!!!'; }
        Materialize.toast(message, 3000);
        $s.paciencia = $s.paciencia--;
        console.log($s.paciencia);
    };

   $s.goRota = function(rota){ 
        if (rota) {
            $location.path(rota);
        }
    };


    $s.getPedidos = function(){
        $s.func = 'getPedidos';

        $http.get(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe).success(function(result){
            $s.pedidos = result;               
        });
    };   

  
    $s.sendPedido = function(oPedido){
        console.log(oPedido);
        if (!oPedido.dia || !oPedido.nome || !oPedido.endereco) { 
            $s.showToast('Preencha todos os campos');
            return; 
        }

        $s.func = 'insertPedido';
        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPedido: oPedido
        }).success(function(result){
            $s.getPedidos();
            $s.showToast("Pedido salvo!");
            // $s.oPedido.descricao = '';
        });
    }     


    $s.updatePedido = function(oPedido){

        $s.func = 'updatePedido';
        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPedido: oPedido
        }).success(function(result){        

        });
    }   

    $s.deletePedido = function(oPedido){

        $s.func = 'deletePedido';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPedido: oPedido
        }).success(function(result){
            $s.getPedidos();           
        });

    }         


    $s.changeEntrega = function(oPedido){

       $s.func = 'changeEntrega';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPedido: oPedido
        }).success(function(result){
            $s.getPedidos();           
        });

    }   

    $s.changePagamento = function(oPedido){

       $s.func = 'changePagamento';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPedido: oPedido
        }).success(function(result){
            $s.getPedidos();           
        });

    }

    $s.getClientes = function(oPedido){
        console.log(oPedido);

        var classe = 'Cliente';

        if (oPedido.nome.length >= 3) {        
            $s.showClientes = true;    
            $s.func = 'getClientes';
            $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
                oPedido: oPedido
            }).success(function(result){
                $s.clientes = result;               
            });
        } else {
            $s.clientes = [];
        }

        
    } 

}]);

app.controller("estoqueCtrl", ['$scope', '$http', '$rootScope','DateProvider', function ($s, $http, $rs, Date) {

    
    $(document).ready(function(){
        $('.collapsible').collapsible({
          accordion : false
        });
    });

    $(document).ready(function() {
        $('select').material_select();
    });
    
   
    var classe = 'Generic';

    $s.tipos = [{'codtipo':'1','tipo':'P13'},
                {'codtipo':'2','tipo':'P20'},
                {'codtipo':'3','tipo':'P45'}];            

          
    $rs.dia_semana = Date.dayOfWeek();

    $s.goRota = function(rota){ 
        if (rota) {
            $location.path(rota);
        }
    };

    $s.teste = function(){
        console.log("cheguei")
    }

    $s.getEstoques = function(){
        $s.func = 'getEstoques';

        $http.get(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe).success(function(result){
            $s.estoques = result;               
        });
    };   

  
    $s.sendEstoque = function(oEstoque){

        if (!oEstoque.dia || !oEstoque.qtd) { 
            $s.showToast('Preencha dia e quantidade!');
            return; 
        }

        $s.func = 'insertEstoque';
        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oEstoque: oEstoque
        }).success(function(result){
            $s.getEstoques();     
            $s.getEstoquesByTipo();
            $s.showToast("Entrada salva!"); 
        });
    }     


    $s.deleteEstoque = function(oEstoque){

        $s.func = 'deleteEstoque';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oEstoque: oEstoque
        }).success(function(result){
            $s.getEstoques();       
            $s.getEstoquesByTipo();    
        });

    }       

    
    $s.getEstoquesByTipo = function(){
        $s.func = 'getEstoquesByTipo';

        $http.get(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe).success(function(result){
            $s.estoques_tipos = result;               
        });
    };     


}]);

app.controller("relatorioCtrl", ['$scope', '$http', '$rootScope','DateProvider', function ($s, $http, $rs, Date) {

    
    $(document).ready(function(){
        $('.collapsible').collapsible({
          accordion : false
        });
    });


    $(document).ready(function() {
        $('select').material_select();
    });
                

    $s.meses = [{'codmes':'01','mes':'Janeiro'},
                {'codmes':'02','mes':'Fevereiro'},
                {'codmes':'03','mes':'Março'},
                {'codmes':'04','mes':'Abril'},
                {'codmes':'05','mes':'Maio'},
                {'codmes':'06','mes':'Junho'},
                {'codmes':'07','mes':'Julho'},
                {'codmes':'08','mes':'Agosto'},
                {'codmes':'09','mes':'Setembro'},
                {'codmes':'10','mes':'Outubro'},
                {'codmes':'11','mes':'Novembro'},
                {'codmes':'12','mes':'Dezembro'}];


    $s.ano = Date.getAno();

    $s.anos = [{'codano':$s.ano-3,'ano':$s.ano-3},
                {'codano':$s.ano-2,'ano':$s.ano-2},
                {'codano':$s.ano-1,'ano':$s.ano-1},
                {'codano':$s.ano,'ano':$s.ano}];
 

    $rs.dia_semana = Date.dayOfWeek();


    var classe = 'Pedido';

    $s.getPedidosByMesAno = function(oRelatorio){

        if (!oRelatorio.mes || !oRelatorio.ano) { 
            $s.showToast('Selecione mês e ano');
            return; 
        }


        $s.func = 'getPedidosByMesAno';

        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oRelatorio: oRelatorio
        }).success(function(result){
            $s.relatorios = result;          
        });

    };     

}]);


app.controller("precosCtrl", ['$scope', '$http', '$rootScope','DateProvider', function ($s, $http, $rs, Date) {

    $(document).ready(function(){
        $('.collapsible').collapsible({
          accordion : false
        });
    });


    $(document).ready(function() {
        $('select').material_select();
    });                


    var classe = 'Generic';


    $s.getPrecos = function(){
        $s.func = 'getPrecos';

        $http.get(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe).success(function(result){
            $s.precos = result;               
        });
    };   


    $s.updatePreco = function(oPreco){
        console.log(oPreco);
        if (!oPreco.preco_custo || !oPreco.preco_venda) { 
            $s.showToast('Preencha os preços');
            return; 
        }

        $s.func = 'updatePreco';
        $http.post(SERVER_PATH + "redirect.php?func=" + $s.func + "&c=" + classe, {
            oPreco: oPreco
        }).success(function(result){
            $s.getPrecos();
            $s.showToast("Preço salvo!");
            // $s.oPedido.descricao = '';
        });
    }     


}]);