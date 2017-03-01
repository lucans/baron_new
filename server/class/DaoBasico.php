<?php
	class Dao{

		private $link;

		public function __construct(){	
			if ($_SERVER['DOCUMENT_ROOT'] == 'C:/Users/Lucas/Documents/GitHub') {	
			    $this->link = mysqli_connect("192.168.10.20","root","proxy","db_baron");
			} else{
			    $this->link = mysqli_connect("localhost","root","","db_baron");	
			}
		}


		public function getData($sTable, $sWhere, $sFields){
			
			$sWhere = utf8_decode($sWhere);
			$sFields = utf8_decode($sFields);

			$sFields = empty($sFields) ? '*' : $sFields;			

			$sQuery = "SELECT $sFields FROM $sTable $sWhere";		


			// if ($opt == 'morre') {
				// die($sQuery);
			// }

			$oStmt = mysqli_query($this->link, $sQuery); 

			$aResult = array();				

			while($oResult = mysqli_fetch_assoc($oStmt)){
				array_push($aResult, ArrayEncode($oResult));
			}
			
			$aResult = $aResult;
			
			unset($sWhere);
			
			return $aResult;

		}		


		public function insertData($sTable, $sSet){

			$sQuery = "INSERT INTO $sTable $sSet";
			
			// die($sQuery);

			mysqli_query($this->link, $sQuery); 
			unset($sWhere);
			
		}		


		public function updateData($sTable, $sWhere, $sSet){

			$sQuery = "UPDATE $sTable $sSet $sWhere";

			// die($sQuery);

			mysqli_query($this->link, $sQuery); 
			unset($sWhere);
			
		}		

		public function deleteData($sTable, $sWhere){

			// $sQuery = "UPDATE $sTable SET ativo = IF(ativo = 'S', 'N', 'S') $sWhere";
			$sQuery = "DELETE FROM $sTable $sWhere";

			mysqli_query($this->link, $sQuery); 

			unset($sWhere);
			
		}

		public function switchTarefa($sTable, $sWhere){

			$sQuery = "UPDATE $sTable SET valor = IF(valor = '1', '0', '1') $sWhere";			
			mysqli_query($this->link, $sQuery); 
			unset($sWhere);
			
		}

	}