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

class pacrudSqlite3Connection {
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
		$this->sqlOperator['not begins with']       = 'NOT :field: like \':value:%\'';
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
		$dbName     = $this->param['dbname'];
		
		if (!extension_loaded('sqlite3')) {
			$msg = _('É necessário ativar a extensão %extension% no PHP');
			$this->err = str_replace('%extension%','sqlite3',$msg);
			$this->connected = false;
			return false;
		}
		
		if ($this->connected()) {
			$this->disconnect();
		}
		
		$exists = file_exists($dbName);
		if ($exists) {
			if (is_writable($dbName)) {
				$this->connection = new SQLite3($dbName);
			}
			else {
				$msg = _('O arquivo "%fileName%" não possui permissão de escrita');
				$this->err = str_replace('%fileName%',$dbName,$msg);
				return false;
			}
		}
		else {
			$msg = _('O arquivo "%fileName%" nao existe');
			$this->err = str_replace('%fileName%',$dbName,$msg);
			return false;
		}
		
		if ($exists and $this->connection) {
			$this->connected = true;
			$this->err = '';
			return true;
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
			if ($this->connect()) {
				return $this->connection;
			}
			else {
				return false;
			}
		}
	}

    function sqlQuery($sql) {
        if ($this->getConnection()) {
			$result = $this->connection->querySingle($sql);
            return $result;
        }
        else {
            return false;
        }
    }
    
    function fetchAssoc($sql) {
        if ($this->getConnection()) {
            $res = $this->connection->query($sql);
            $row = $res->fetchArray(SQLITE3_ASSOC);
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
    	
		$res = $this->connection->query($sql);
		$ncols = $res->numColumns();

		$arrayRerurn = array();
		$i = 0;
		while ($row = $res->fetchArray(SQLITE3_ASSOC)) {
			$thisRow = array();
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = $res->columnName($j);
				$fieldValue = $row[$fieldName];
				
				$thisRow[$fieldName] = $fieldValue;						
			}
			$arrayRerurn[$i] = $thisRow;
			$i++;
		}
		return $arrayRerurn;
	}
    
    function sqlXml($sql,$tableName) {
    	$connection = $this->getConnection();
		$res = $this->connection->query($sql);
		
		if ($tableName == '') {
			$xmlTableName = 'name_less_table';
		}
		else {
			$xmlTableName = $tableName;
		}
		
		$ncols = $res->numColumns();
		$xml = '';
		
		$i = 0;
		
		while ($row = $res->fetchArray(SQLITE3_ASSOC)) {
			$xml .= "<$xmlTableName>\n";
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = $res->columnName($j);
				$fieldValue = htmlspecialchars($row[$fieldName]);
				
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
		             'string'    => 'text',
		             'text'      => 'text',
		             'integer'   => 'integer',
		             'serial'    => 'integer',
		             'numeric'   => 'numeric',
		             'date'      => 'date',
		             'time'      => 'time',
		             'timestamp' => 'timestamp',
		             'boolean'   => 'boolean'
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
			$this->connection->close();
		}
		$this->connected = false;
	}
}
