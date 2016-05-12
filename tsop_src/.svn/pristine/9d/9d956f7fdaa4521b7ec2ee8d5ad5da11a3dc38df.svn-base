<?php

/* *********************************************************************
 *
 *  paCRUD - PHP Ajax CRUD Framework é um framework para
 *  desenvolvimento rápido de sistemas de informação web.
 *  Copyright (C) 2010 Emerson Casas Salvador <salvaemerson@gmail.com>
 *  e Odair Rubleski <orubleski@gmail.com>
 *
 *  This file is part of paCRUD.
 *
 *  paCRUD is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3, or (at your option)
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 * ******************************************************************* */

class pacrudMariadbConnection {
	private $connection;
	private $err;

	public $connected;
	public $param;
	public $sqlOperator;

	function __construct($params) {
		$this->param = pParameters($params);
		$this->connected = false;
		$this->err = '';
		
		$this->sqlOperator = array();
		$this->sqlOperator['like']                  = ':field: like \'%:value:%\'';
		$this->sqlOperator['not like']              = 'NOT :field: like \'%:value:%\'';
		$this->sqlOperator['begins with']           = ':field: like \':value:%\'';
		$this->sqlOperator['ends with']             = ':field: like \'%:value:\'';
		$this->sqlOperator['not begins with']	    = 'NOT :field: like \':value:%\'';
		$this->sqlOperator['not ends with']         = 'NOT :field: like \'%:value:\'';
		$this->sqlOperator['equal']                 = ':field: = \':value:\'';
		$this->sqlOperator['not equal']             = 'NOT :field: = \':value:\'';
		$this->sqlOperator['numeric equal']         = ':field: = :value:';
		$this->sqlOperator['numeric not equal']     = 'NOT :field: = :value:';
		$this->sqlOperator['less than']             = ':field: < \':value:\'';
		$this->sqlOperator['greater than']          = ':field: > \':value:\'';
		$this->sqlOperator['less than or equal']    = ':field: <= \':value:\'';
		$this->sqlOperator['greater than or equal'] = ':field: >= \':value:\'';
		$this->sqlOperator['is null']               = ':field: IS NULL';
		$this->sqlOperator['not is null']           = 'NOT :field: IS NULL';
	}

	private function connect() {
		$dbHost	 = $this->param['dbhost'];
		$dbPort	 = $this->param['dbport'];
		$dbName	 = $this->param['dbname'];
		$dbUserName = $this->param['dbusername'];
		$dbPassword = $this->param['dbpassword'];
		
		if (!extension_loaded('mariadb')) {
			$msg = _('É necessário ativar a extensão %extension% no PHP');
			$this->err = str_replace('%extension%','mariadb',$msg);
			$this->connected = false;
			return false;
		}
		
		if ($this->connected()) {
			$this->disconnect();
		}

		$this->connection = @mysql_connect("$dbHost:$dbPort",$dbUserName,$dbPassword) ;
		if ($this->connection) {
			$select_db = mysql_select_db($dbName, $this->connection);
			if(!$select_db){
				$this->err = _('Problema de conectividade com o servidor de banco de dados');
				$this->connected = false;
				return false;	
			}
			else{
				$this->connected = true;
				$this->err = '';
				return true;
			}
		}
		else {
			$this->connected = false;
			$this->err = _('Problema de conectividade com o servidor de banco de dados');
			return false;
		}
	}
	
	function getErr() {
		return $this->err;
	}

	function connected($reconnect=false) {
		if ($reconnect and $this->connected == false) {
			$this->connect();
		}
		return $this->connected;
	}

	function getConnection() {
		if ($this->connected) {
			return $this->connection;
		}
		else {
			$this->connect();
			return $this->connection;
		}
	}
	
	function sqlQuery($sql) {
		if ($this->getConnection()) {
			$res = mysql_query($sql, $this->getConnection());
			if ($res != 1) {
				$row = mysql_fetch_row($res);
				return utf8_encode($row[0]);
			}
			else {
				return '1';
			}
		}
		else {
			return false;
		}
	}
	
	function fetchAssoc($sql) {
		if ($this->getConnection()) {
			$res = mysql_query($sql, $this->getConnection());
			$row = mysql_fetch_assoc($res);
			return $row;
		}
		else {
			return false;
		}
	}
	
	function sql2Array($sql) {
		$connection = $this->getConnection();
		if (!$connection) {
	    	return false;
	    }
	    
		$res = mysql_query($sql, $connection);
		$ncols = mysql_num_fields($res);
		
		$arrayRerurn = array();
		$i = 0;
		while ($row = mysql_fetch_assoc($res)) {
			$thisRow = array();
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = mysql_field_name($res, $j);
				$fieldValue = mysql_result($res, $i, $fieldName);
				
				$thisRow[$fieldName] = utf8_encode($fieldValue);
			}
			$arrayRerurn[$i] = $thisRow;
			$i++;
		}
		return $arrayRerurn;
	}
	
	function sqlXml($sql,$tableName) {
		$res = mysql_query($sql, $this->getConnection());
	
		if ($tableName == '') {
			$xmlTableName = mysql_field_table($res, 0);
		}
		else {
			$xmlTableName = $tableName;
		}

		$ncols = mysql_num_fields($res);
		$xml = '';

		$i = 0;
		while ($row = mysql_fetch_assoc($res)) {
			$xml .= "<$xmlTableName>\n";
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = mysql_field_name($res, $j);
				$fieldValue = htmlspecialchars(utf8_encode(mysql_result($res, $i, $fieldName)));
				
				//transforma quebra de linha em marcação de quebra para ser interpretada pelo cliente
				$fieldValue = str_replace("\r",'',$fieldValue);
				$fieldValue = str_replace("\n",'\n',$fieldValue);
				
				if ($fieldValue == '') {
					$xml .= "	<$fieldName>NULL</$fieldName>\n";
				}
				else {
					$xml .= "	<$fieldName>$fieldValue</$fieldName>\n";
				}
			}
			$xml .= "</$xmlTableName>\n";
			$i++;
		}
		return $xml;
	}
	
	function dbType($type) {
		$types = array(
		             'string'    => 'varchar',
		             'text'      => 'text',
		             'integer'   => 'int',
		             'serial'    => 'int auto_increment',
		             'numeric'   => 'numeric',
		             'date'      => 'date',
		             'time'      => 'time',
		             'timestamp' => 'timestamp',
		             'boolean'   => 'char(1)'
		           );
		
		if (isset($types[$type])) {
			return $types[$type];
		}
		else {
			return $type;
		}
	}
	
	function disconnect() {
		if ($this->connection) {
			mysql_close($this->connection);
		}
		$this->connected = false;
	}
}
