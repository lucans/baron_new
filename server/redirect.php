<?php 

include('funcoes.php');

$postdata = file_get_contents("php://input");
$aDados = json_decode($postdata);


// $coduser = isset($_SESSION['user'][0]['coduser']) ?  $_SESSION['user'][0]['coduser'] : '';
$coduser = '1';



$func = $_GET['func'];
$c = $_GET['c'];

if (isset($_GET['q'])) {
	$q = $_GET['q'];
} else{
	$q = '';
}



// die(print_r($aDados));

switch ($c) {
	case 'Pedido':
		$Pedido = new Pedido();
		$Pedido->$func($coduser, $q, $aDados);
		break;		
	case 'Usuario':
		$Usuario = new Usuario();
		$Usuario->$func($coduser, $q, $aDados);
		break;		
	case 'Generic':
		$Generic = new Generic();
		$Generic->$func($coduser, $q, $aDados);
		break;		
	case 'Cliente':
		$Cliente = new Cliente();
		$Cliente->$func($coduser, $q, $aDados);
		break;	
	
	default:
		echo "Classe não indicada";
		break;
}

?>