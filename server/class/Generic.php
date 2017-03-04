<?php

	class Generic extends Dao {

		public $sTable = 'estoques';
		public $sFields = '';


		public function getEstoques(){

			$sFields = " dia, CASE DAYNAME(dia)
							WHEN 'Sunday' THEN 'Domingo'
							WHEN 'Monday' THEN 'Segunda-Feira'
							WHEN 'Tuesday' THEN 'Terça-Feira'
							WHEN 'Wednesday' THEN 'Quarta-Feira'
							WHEN 'Thursday ' THEN 'Quinta-Feira'
							WHEN 'Friday' THEN 'Sexta-Feira'
							WHEN 'Saturday' THEN 'Sábado' 
						END AS dia_semana ";			
		
			$sWhere = " GROUP BY dia ORDER BY dia DESC";

			$Dias = $this->getData($this->sTable, $sWhere, $sFields);

			$aEstoques = array();

			foreach ($Dias as $key => $Dia) {		

				$Dia['estoques'] = self::getEstoquesByDia($Dia['dia']);

				array_push($aEstoques, $Dia);

			}

			echo json_encode($aEstoques);

		}

		public function getEstoquesByDia($dia){

			$sWhere = " WHERE dia = '$dia' ";

			$aEstoques = $this->getData($this->sTable, $sWhere, $this->sFields);

			return $aEstoques;

		}


		public function getEstoquesByTipo(){


			$sTable = " estoques e ";
			$sFields = " e.tipo, SUM(e.qtd) AS total ";			
		
			$sWhere = " GROUP BY e.tipo ORDER BY e.tipo";

			$aTotalEstoques = $this->getData($sTable, $sWhere, $sFields);
		

			$sTable = " pedidos p ";
			$sFields = " p.tipo, SUM(p.qtd) AS total ";			
		
			$sWhere = " GROUP BY p.tipo ORDER BY p.tipo";

			$aTotalPedidos = $this->getData($sTable, $sWhere, $sFields);
		

			$aEstoques = array();

			$aEstoques[0]["tipo"] = "P13";
			$aEstoques[0]["total"] = $aTotalEstoques[0]["total"] - $aTotalPedidos[0]["total"];


			$aEstoques[1]["tipo"] = "P20";
			$aEstoques[1]["total"] = $aTotalEstoques[1]["total"] - $aTotalPedidos[1]["total"];


			$aEstoques[2]["tipo"] = "P45";
			$aEstoques[2]["total"] = $aTotalEstoques[2]["total"] - $aTotalPedidos[2]["total"];



			echo json_encode($aEstoques);

		}


		public function getPreco($tipo, $tipo_preco){
									
			$sTable = "precos";
			$sWhere = " WHERE tipo = '$tipo'";		

			$aTipo = $this->getData($sTable, $sWhere, $this->sFields);			

			return $aTipo[0][$tipo_preco];
		}


		public function getPrecos(){
									
			$sWhere = "";
			$sTable = "precos";

			$aTipos = $this->getData($sTable, $sWhere, $this->sFields);
		
			echo json_encode($aTipos);
		}


		public function updatePreco($user, $q, $aDados){
		
			$sTable = "precos";

			$sSet = buildSet($aDados);

			$sWhere = "WHERE codpreco = '" . $aDados->oPreco->codpreco . "'";
			
			$this->updateData($sTable, $sWhere, $sSet);

		}


		public function insertEstoque($user, $q, $aDados){

			$aDados->oEstoque->dia = implode('-', array_reverse(explode('/', $aDados->oEstoque->dia)));

			$aDados->oEstoque->preco = self::getPreco($aDados->oEstoque->tipo, "preco_custo");

			$sSet = buildSet($aDados);		
			
			$this->insertData($this->sTable, $sSet);

		}	

		public function deleteEstoque($user, $q, $aDados){

			$sWhere = "WHERE codestoque = '" . $aDados->oEstoque->codestoque . "' ";

			$sWhere = "WHERE codestoque = '" . $aDados->oEstoque->codestoque . "'";
			$this->deleteData($this->sTable, $sWhere);			
			echo json_encode(array('msg' => 'true'));
		
		}




	}

?>