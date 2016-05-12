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
		$result = mysql_query("SELECT * FROM ts_member;");
		
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
		$result = mysql_query("INSERT INTO ts_member(NAME,CNAME,ACCOUNT,MOBILE1,EXT,gender) VALUES('" . $_POST["NAME"] . "', '" . $_POST["CNAME"] ."','". $_POST["ACCOUNT"] ."','". $_POST["MOBILE1"] ."','". $_POST["EXT"] . "','".$_POST["gender"]."');");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM ts_member WHERE NO = LAST_INSERT_ID();");
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
		$result = mysql_query("UPDATE ts_member SET ACCOUNT = '" . $_POST["ACCOUNT"] . "', CNAME = '" . $_POST["CNAME"] . " WHERE NO = " . $_POST["NO"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM ts_member WHERE NO = " . $_POST["NO"] . ";");

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
