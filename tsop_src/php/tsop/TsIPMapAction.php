<?php

try
{
	//Open database connection
	$con = mysql_connect("localhost","root","mysql1,");
	mysql_select_db("tsop", $con);

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get records from database
		$result = mysql_query("SELECT * FROM ts_ip_map_matrix;");
		
		//Add all records to an array
		$rows = array();
		while($row = mysql_fetch_array($result))
		{
		    $rows[] = $row;
		}

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['Records'] = $rows;
		print json_encode($jTableResult);
	}
	//Creating a new record (createAction)
	else if($_GET["action"] == "create")
	{
		//Insert record into database
		$result = mysql_query("INSERT INTO ts_ip_map_matrix(INTERNAL_IP,INTERNAL_PORT,EXTERNAL_IP,EXTERNAL_PORT,PROJ_CODE,PROJ_NAME,APPLY_DATE) VALUES('" . $_POST["INTERNAL_IP"] . "'," . $_POST["INTERNAL_PORT"] .",'". $_POST["EXTERNAL_IP"] ."',". $_POST["EXTERNAL_PORT"] .",'".$_POST["PROJ_CODE"]."','".$_POST["PROJ_NAME"]."',now());");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM ts_ip_map_matrix WHERE NO = LAST_INSERT_ID();");
		$row = mysql_fetch_array($result);

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['Record'] = $row;
		print json_encode($jTableResult);
	}
	//Updating a record (updateAction)
	else if($_GET["action"] == "update")
	{
		//Update record in database
		$result = mysql_query("UPDATE ts_ip_map_matrix SET INTERNAL_IP = '" . $_POST["INTERNAL_IP"] . "', INTERNAL_PORT = " . $_POST["INTERNAL_PORT"] . ", EXTERNAL_IP = '" .$_POST["EXTERNAL_IP"] . "', EXTERNAL_PORT = " . $_POST["EXTERNAL_PORT"] .", PROJ_NAME = '" . $_POST["PROJ_NAME"] ."', PROJ_CODE = '" . $_POST["PROJ_CODE"] ."' WHERE NO = " . $_POST["NO"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM ts_ip_map_matrix WHERE NO = " . $_POST["NO"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}

	//Close database connection
	mysql_close($con);

}
catch(Exception $ex)
{
    //Return error message
	$jTableResult = array();
	$jTableResult['Result'] = "ERROR";
	$jTableResult['Message'] = $ex->getMessage();
	print json_encode($jTableResult);
}
	
?>
