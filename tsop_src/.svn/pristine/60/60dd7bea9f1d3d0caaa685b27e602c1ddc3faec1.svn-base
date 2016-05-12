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

class pacrudPgConnection {
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
		$this->sqlOperator['like']                  = ':field: ilike \'%:value:%\'';
		$this->sqlOperator['not like']              = 'NOT :field: ilike \'%:value:%\'';
		$this->sqlOperator['begins with']           = ':field: ilike \':value:%\'';
		$this->sqlOperator['ends with']             = ':field: ilike \'%:value:\'';
		$this->sqlOperator['not begins with']       = 'NOT :field: ilike \':value:%\'';
		$this->sqlOperator['not ends with']         = 'NOT :field: ilike \'%:value:\'';
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
		$dbHost     = $this->param['dbhost'];
		$dbPort     = $this->param['dbport'];
		$dbName     = $this->param['dbname'];
		$dbUserName = $this->param['dbusername'];
		$dbPassword = $this->param['dbpassword'];
		
		if (!extension_loaded('pgsql')) {
			$msg = _('É necessário ativar a extensão %extension% no PHP');
			$this->err = str_replace('%extension%','pgsql',$msg);
			$this->connected = false;
			return false;
		}
		
		if ($this->connected()) {
			$this->disconnect();
		}
		
		$pgString = "host=$dbHost port=$dbPort dbname=$dbName user=$dbUserName password=$dbPassword";
		$this->connection = @pg_connect($pgString) ;
		if ($this->connection) {
			if (isset($this->param['encoding'])) {
				$enc = $this->sqlQuery('SET CLIENT_ENCODING TO \''.$this->param['encoding'].'\';');
			}
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
			$this->connect();
			return $this->connection;
		}
	}

    function sqlQuery($sql) {
        if ($this->getConnection()) {
            $res = pg_query($this->getConnection(),$sql);
            $row = pg_fetch_row($res);
            return $row[0];
        }
        else {
            return false;
        }
    }
    
    function fetchAssoc($sql) {
        if ($this->getConnection()) {
            $res = pg_query($this->getConnection(),$sql);
            $row = pg_fetch_assoc($res);
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
	    
		$res = pg_query($connection,$sql);
		$ncols = pg_num_fields($res);

		$arrayRerurn = array();
		$i = 0;
		while ($row = pg_fetch_assoc($res)) {
			$thisRow = array();
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = pg_field_name($res, $j);
				$fieldValue = pg_fetch_result($res, $i, $fieldName);
				
				$thisRow[$fieldName] = $fieldValue;						
			}
			$arrayRerurn[$i] = $thisRow;
			$i++;
		}
		return $arrayRerurn;
	}

	function sqlXml($sql,$tableName) {
		$res = pg_query($this->getConnection(),$sql);
	
		if ($tableName == '') {
			$xmlTableName = pg_field_table($res, 0);
		}
		else {
			$xmlTableName = $tableName;
		}

		$ncols = pg_num_fields($res);
		$xml = '';

		$i = 0;
		while ($row = pg_fetch_assoc($res)) {
			$xml .= "<$xmlTableName>\n";
			for ($j = 0; $j < $ncols; ++$j) {
				$fieldName = pg_field_name($res, $j);
				$fieldValue = htmlspecialchars(pg_fetch_result($res, $i, $fieldName));
				
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
		             'string'    => 'character varying',
		             'text'      => 'text',
		             'integer'   => 'integer',
		             'serial'    => 'serial',
		             'numeric'   => 'numeric',
		             'date'      => 'date',
		             'time'      => 'time',
		             'timestamp' => 'timestamp without timezone',
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
			pg_close($this->connection);
		}
		$this->connected = false;
	}
}
