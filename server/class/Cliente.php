<?php

	class Cliente extends Dao {

		public $sTable = 'clientes';
		public $sFields = '';
		public $sAtivo = "AND ativo = 'S'";


		public function getClientes($user, $q, $aDados){
		
			$sWhere = " WHERE CONCAT(nome, endereco, telefone) LIKE '%" . $aDados->oPedido->nome . "%' LIMIT 3";

			$aClientes = $this->getData($this->sTable, $sWhere, $this->sFields);
		
			echo json_encode($aClientes);

		}


		public function getOnePedido($user, $codpedido){

			$sWhere = "WHERE codpedido = '$codpedido' AND coduser = '$user' " . $this->sAtivo;
			$aPedido = $this->getData($this->sTable, $sWhere, $this->sFields);
			echo json_encode($aPedido);

		}
		
		public function updatePedido($user, $q, $aDados){

			$aDados->oPedido->previsao = implode('-', array_reverse(explode('/', $aDados->oPedido->previsao)));			

			if (isset($aDados->oPedido->previsao)) {
				$aDados->oPedido->dtpagamento = '0000-00-00';
			}

			$sSet = buildSet($aDados);

			$sWhere = "WHERE codpedido = '" . $aDados->oPedido->codpedido . "' AND coduser = '$user' ";
			
			$this->updateData($this->sTable, $sWhere, $sSet);

		}	

		public function insertPedido($user, $q, $aDados){

			$aDados->oPedido->preco = Generic::getPreco($aDados->oPedido->tipo, "preco_venda");

			$aDados->oPedido->dia = implode('-', array_reverse(explode('/', $aDados->oPedido->dia)));

			$aDados->oPedido->dtcadastro = date("Y-m-d");

			$aDados->oPedido->coduser = $user;

			$sSet = buildSet($aDados);		
			
			$this->insertData($this->sTable, $sSet);

		}	

		public function deletePedido($user, $q, $aDados){

			$sWhere = "WHERE codpedido = '" . $aDados->oPedido->codpedido . "'";

			$sWhere = "WHERE codpedido = '" . $aDados->oPedido->codpedido . "'";
			$this->deleteData($this->sTable, $sWhere);			
			echo json_encode(array('msg' => 'true'));
		
		}

		public function changePagamento($user, $q, $aDados){

			$sDataPagamento = $aDados->oPedido->pagamento == 'fiado' ? 'CURDATE()' : "'0000-00-00'";


			$sSet = " SET pagamento = IF(pagamento = 'fiado','pago','fiado'), dtpagamento = $sDataPagamento ";

			$sWhere = "WHERE codpedido = '" . $aDados->oPedido->codpedido . "' ";
			
			$this->updateData($this->sTable, $sWhere, $sSet);

		}	



	}

?>