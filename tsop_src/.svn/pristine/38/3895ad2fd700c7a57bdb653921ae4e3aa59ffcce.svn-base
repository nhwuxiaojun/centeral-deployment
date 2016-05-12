<?php

try
{
	//Open database connection
	$con = mysql_connect("localhost","root","mysql1,");
	mysql_select_db("tsop", $con);

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
                //Get record count
                $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM a_ftp_info;");
                //$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM a_ftp_info and PROJ_NAME like '%"+$_GET["SEARCHKEY"]+"%';");
                $row = mysql_fetch_array($result);
                $recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM a_ftp_info ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
		//Add all records to an array
		$rows = array();
		while($row = mysql_fetch_array($result))
		{
		    $rows[] = $row;
		}

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
                $jTableResult['TotalRecordCount'] = $recordCount;
		$jTableResult['Records'] = $rows;
		print json_encode($jTableResult);
	}
	//Creating a new record (createAction)
	else if($_GET["action"] == "create")
	{
		//Insert record into database
		$result = mysql_query("INSERT INTO a_ftp_info(PROJ_NAME,USERNAME,FTP_PASSWORD,FTP_TYPE,FTP_DIR,APPLICANT,START_TIME) VALUES('" . $_POST["PROJ_NAME"] . "','" . $_POST["USERNAME"] ."','". $_POST["FTP_PASSWORD"] ."','". $_POST["FTP_TYPE"] ."','".$_POST["FTP_DIR"]."','".$_POST["APPLICANT"]."',now());");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM a_ftp_info WHERE FTP_ID = LAST_INSERT_ID();");
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
		$result = mysql_query("UPDATE a_ftp_info SET PROJ_NAME = '" . $_POST["PROJ_NAME"] . "', USERNAME = '" . $_POST["USERNAME"] . "', FTP_PASSWORD = '" .$_POST["FTP_PASSWORD"] . "', FTP_TYPE = '" . $_POST["FTP_TYPE"] ."', APPLICANT = '" . $_POST["APPLICANT"] ."', FTP_DIR = '" . $_POST["FTP_DIR"] ."' WHERE FTP_ID = " . $_POST["FTP_ID"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM a_ftp_info WHERE FTP_ID = " . $_POST["FTP_ID"] . ";");

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
