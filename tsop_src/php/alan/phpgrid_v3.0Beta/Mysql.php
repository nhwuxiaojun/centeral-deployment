<?php

/**
 * pdo custom class extends pdo
 * @author cdwei
 *
 */
class MysqlPDO extends PDO
{

	public $database;			    
	public $queryId;		    	 
	public $sqlErr;                 
	public $lastSql;			    

	function MysqlPDO($type, $host, $user, $pass, $dbname,$charset = 'utf8', $port = '3306')
	{
		$dsn = sprintf("%s:host=%s;port=%s;dbname=%s", $type, $host,$port, $dbname);
		try{
			PDO::__construct($dsn, $user, $pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES '{$charset}';"));
			$this->database = $dbname ;
		} catch(PDOException $e) {
			die('Can not connect to MySQL server');
		}
	}
	//$query_type = 1 返回影响记录数量；2，返回查询数组,3,返回单条数据
	function query($sql,$query_type = 1)
	{
		if($sql == false) return false;
		try{
			$RS = PDO::query($sql);
			if (PDO::errorCode() != '00000'){
				$this->lastSql = $sql;
				$err = PDO::errorInfo();
				echo "<b>$sql</b><br>";
				print_r($err);die;
			}
			$RS->setFetchMode(PDO::FETCH_ASSOC);
			$this->last_sql = $sql;
			switch ($query_type){
				case 1:
					return $RS->rowCount();            //返回影响的记录数量
				case 2:
					return $RS->fetchall();		       //查询数据并形成数组
				case 3:
					return $RS->fetchColumn();	       //单列数据记录返回 
				case 4:
					return $RS->fetch();               //单条记录返回    
				default:
					return $RS->rowCount();
			}
		}catch(PDOException $e){
			die('数据库操作异常错误:'.$e);
		}
	}
	//返回第一条记录第一个字段
	function getOne($sql) {
		return $this->query($sql,3);
	}
	//取之返回第一条数据 组成的数组
	function getRow($sql) //注意必须为单行数据
	{
		return $this->query($sql,4);
	}
	//返回所有数据
	function getAll($sql)
	{
		return $this->query($sql,2);
	}

	//取得上一步 INSERT 操作产生的 ID
	function insertId()
	{
		return PDO::lastInsertId();
	}

}

/**
 * mysql libary for no pdo 
 * @author cdwei
 *
 */
class MysqlDB {
	public $link=null;
	function MysqlDB($type, $host, $user, $pass, $dbname,$charset = 'utf8', $port = '3306')
	{
		$link = mysql_connect($host.":".$port,$user,$pass);
		if (!$link)  die('Could not connect: ' . mysql_error());
		if(!mysql_select_db($dbname,$link)) die("Could not select db: ".mysql_error());
		mysql_query("SET NAMES '{$charset}';",$link);
		$this->link=$link;

	}
	//$query
	function query($sql)
	{
		return mysql_query($sql,$this->link);
	}
	//返回第一条记录第一个字段
	function getOne($sql) {
		$res=$this->query($sql);
		$row=mysql_fetch_array($res,MYSQL_NUM);
		return $row[0];
	}
	//取之返回第一条数据 组成的数组
	function getRow($sql) //注意必须为单行数据
	{
		$res=$this->query($sql);
		$row=mysql_fetch_array($res,MYSQL_ASSOC);
		return $row;
	}
	//返回所有数据
	function getAll($sql)
	{
		$array=array();
		$res=$this->query($sql);
		while($row=mysql_fetch_array($res,MYSQL_ASSOC)){
			$array[]=$row;
		}
		return $array;
	}

	//取得上一步 INSERT 操作产生的 ID
	function insertId()
	{
		return mysql_insert_id($this->link);
	}
}





?>