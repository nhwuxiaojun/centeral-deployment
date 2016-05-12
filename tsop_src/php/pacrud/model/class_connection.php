<?php

/* *********************************************************************
 *
 *	paCRUD - PHP Ajax CRUD Framework é um framework para
 *	desenvolvimento rápido de sistemas de informação web.
 *	Copyright (C) 2010 Emerson Casas Salvador <salvaemerson@gmail.com>
 *	e Odair Rubleski <orubleski@gmail.com>
 *
 *	This file is part of paCRUD.
 *
 *	paCRUD is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 3, or (at your option)
 *	any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 * ******************************************************************* */

class pacrudConnection {
	private $connection;
	public $param;
	public $encoding;
	
	private $name;
	
	public $logType;

	function __construct($params,$logType=array()) {
		$this->param = pParameters($params);
		$this->err = '';
		$this->logType = $logType;
		
		switch ($this->param['sgdb']) {
			case 'pgsql':
				$this->connection = new pacrudPgConnection($params);
				break;
			case 'mariadb':
				$this->connection = new pacrudMariadbConnection($params);
				break;
			case 'sqlite3':
				$this->connection = new pacrudSqlite3Connection($params);
				break;
		}
		
		if (isset($this->param['encoding']) and $this->param['encoding'] != 'default') {
			$this->encoding = $this->param['encoding'];
		}
		else {
			$this->encoding = 'UTF-8';
		}
	}
	
	/**
	 * $type like 'insert', 'select', 'update', 'delete'
	 */
	public function setLogType($type) {
		$this->logType[] = strtolower($type);
	}
	
	public function getObjName() {
		if (!isset($this->name) or $this->name == '') {
			$className = get_class($this);
			$instance = array();
			foreach ($GLOBALS as $key => $value) {
				if (is_object($value) and get_class($value) == $className) {
					$instance[] = $key;
				}
			}
			$this->name = $instance[count($instance)-1];
		}
		return $this->name;
	}
	
	private function logSql($sql,$method) {
		global $pacrudConfig;
		global $pacrudGlobal;
		global $pConnectionPacrud;
		
		if (count($this->logType) > 0) {
			
			$this->getObjName();
			
			require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');
			
			$logInsert = false;
			$logRetrieve = false;
			$logUpdate = false;
			$logDelete = false;
			
			for ($i=0; $i < count($this->logType); $i++) {
				
				switch ($this->logType[$i]) {
					
					case 'insert':
						$logInsert = true;
						break;
						
					case 'select':
						$logRetrieve = true;
						break;
						
					case 'update':
						$logUpdate = true;
						break;
						
					case 'delete':
						$logDelete = true;
						break;
				}
				
			}
			
			if (
				($logInsert and stristr($sql,'insert')) or 
				($logRetrieve and stristr($sql,'select')) or
				($logUpdate and stristr($sql,'update')) or
				($logDelete and stristr($sql,'delete'))
			) {
				$schema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pacrudConfig['sgdb_pacrud']);
				
				$sqlLog  = 'INSERT INTO '.$schema.'log_sql ('."\n";
				$sqlLog .= '	log_timestamp,'."\n";
				$sqlLog .= '	log_obj_name,'."\n";
				$sqlLog .= '	usr_login,'."\n";
				$sqlLog .= '	log_pacrud_method,'."\n";
				$sqlLog .= '	log_statement'."\n";
				$sqlLog .= ')'."\n";
				$sqlLog .= 'VALUES('."\n";
				$sqlLog .= '	now(),'."\n";
				$sqlLog .= '	'.pFormatSql($this->getObjName(),'string').','."\n";
				$sqlLog .= '	'.pFormatSql($pacrudGlobal['currentUser'],'string').','."\n";
				$sqlLog .= '	'.pFormatSql($method,'string').','."\n";
				$sqlLog .= '	'.pFormatSql($sql,'string')."\n";
				$sqlLog .= ');'."\n";
				$sqlLog = str_replace("\'","''",$sqlLog);
				
				$pConnectionPacrud->sqlQuery($sqlLog,true);
			}
		}
	}
	
	function getErr() {
		return $this->connection->getErr();
	}
	
	function getConnection() {
		return $this->connection->getConnection();
	}
	
	function connected($reconnect=false) {
		$this->getObjName();
		return $this->connection->connected($reconnect);
	}
	
	function sqlQuery($sql,$ignoreLog=false) {
		$this->getObjName();
		
		$ret = $this->connection->sqlQuery($sql);
		if ($ignoreLog == false) {
			$this->logSql($sql,'sqlQuery');
		}
		return $ret;
	}
	
	function fetchAssoc($sql) {
		$this->getObjName();
		
		$ret = $this->connection->fetchAssoc($sql);
		$this->logSql($sql,'fetchAssoc');
		return $ret;

	}
	
	function fetch_assoc($sql) {
		return $this->fetchAssoc($sql);
	}
	
	function sql2Array($sql) {
		$this->getObjName();
		
		$ret = $this->connection->sql2Array($sql);
		$this->logSql($sql,'sql2Array');
		return $ret;
	}
	
	function sqlXml($sql,$tableName) {
		$this->getObjName();
		
		$ret = $this->connection->sqlXml($sql,$tableName);
		$this->logSql($sql,'sqlXml');
		return $ret;
	}
	
	function getSqlOperator($operator) {
		return $this->connection->sqlOperator[$operator];
	}
	
	function disconnect() {
		$this->connection->disconnect();
	}
	
	function sgdb() {
		return $this->param['sgdb'];
	}
	
	function dbType($type) {
		return $this->connection->dbType($type);
	}
	
	/*
	 * Substitui as variáveis globais em um comando sql (exemplo: substitui :pacrudUser: pelo usuário logado)
	 */
	function replacePacrudGlobals($sqlIn) {
		global $pacrudConfig;
		$sqlOut = $sqlIn;
		
		$sessionName = $pacrudConfig['appIdent'].'_pacrudUserName';
		if (!isset($_SESSION[$sessionName])) {
			session_start();
		}
		
		if (isset($_SESSION[$sessionName])) {
			$pacrudUser = $_SESSION[$sessionName];
			
			if ($pacrudUser != '') {
				$pacrudUser = pFormatSql($pacrudUser,'string');
				$sqlOut = str_replace(':pacrudUser:',$pacrudUser,$sqlOut);
				$sqlOut = str_replace(':new_pacrudUser:',$pacrudUser,$sqlOut);
				$sqlOut = str_replace(':old_pacrudUser:',$pacrudUser,$sqlOut);
			}
		}
		
		return $sqlOut;
	}
}

