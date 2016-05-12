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

function pParameters($params) {
	$arrParams = array();
	$theArg = explode(',',$params);
	for ($i = 0; $i < count($theArg); ++$i) {
		$theRow = explode('=',$theArg[$i]);
		// bolean true
		if (count($theRow) == 1) {
			$arrParams[strtolower($theRow[0])] = true;
		}
		// normal parameter
		else if (count($theRow) == 2) {
			$arrParams[strtolower($theRow[0])] = $theRow[1];
		}
		// send by GET method
		else {
			$arrParams[strtolower($theRow[0])] = '';
			for ($j=1; $j < count($theRow);$j++) {
				if ($j == 1) {
					$arrParams[strtolower($theRow[0])] .= $theRow[$j];
				}
				else {
					$arrParams[strtolower($theRow[0])] .= '='.$theRow[$j];
				}
			}
		}
	}
	return $arrParams;
}

/**
 * Função especial para tratamento de Sql Injection, todo tratamento deverá ser feito aqui
 * @param $value string: o valor a ser tratado
 * @param $type string: o tipo de dado [string,text,longtext,integer,numeric,serial,date,time,timestamp,boolean]
 * @returns string
 */
function pSqlNoInjection($value,$type,$formatSqlNull=false) {
	
	$valueNoInjection = $value;
	
	switch ($type) {
		case "string":
			$valueNoInjection = str_replace('\\','\\\\',$valueNoInjection);
			$valueNoInjection = str_replace('\'','\\\'',$valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "text":
			$valueNoInjection = str_replace('\\','\\\\',$valueNoInjection);
			$valueNoInjection = str_replace('\'','\\\'',$valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "longtext":
			$valueNoInjection = str_replace('\\','\\\\',$valueNoInjection);
			$valueNoInjection = str_replace('\'','\\\'',$valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "integer":
			$valueNoInjection = preg_replace("/[^0-9\-]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "numeric":
			$valueNoInjection = preg_replace("/[^0-9.\,\-]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "serial":
			$valueNoInjection = preg_replace("/[^0-9\-]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "date":
			$valueNoInjection = preg_replace("/[^0-9\/]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "time":
			$valueNoInjection = preg_replace("/[^0-9:]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "timestamp":
			$valueNoInjection = preg_replace("/[^0-9\:\/\ ]/", "", $valueNoInjection);
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
		
		case "boolean":
			if ($formatSqlNull) {
		  		return pFormatSqlNull($valueNoInjection,$type);
		  	}
		  	else {
		  		return $valueNoInjection;
		  	}
		break;
	}
}

/**
 * Traduz '' para NULL usado em instuções SQL
 */
function pFormatSqlNull($value,$type) {
	if ($type != 'boolean' and $value == '') {
		return 'NULL';
	}
	else {
		return $value;
	}
}

/**
 * Parser para adicionar valores a comandos SQL
 * @param $value string: o valor a ser tratado
 * @param $type string: o tipo de dado [string,text,longtext,integer,numeric,serial,date,time,timestamp,boolean]
 * @param $capsLock boolean: quando true, adiciona um strtoupper em $value
 * @returns string
 */
function pFormatSql($value,$type,$capsLock=false) {
	
	$valueNoInjection = pSqlNoInjection($value,$type);
	
	if ($capsLock) {
		$valueNoInjection = strtoupper($valueNoInjection);
	}
	
	switch ($type) {
		case "string":
			if ($valueNoInjection == '') {
				return "NULL";
		 	}
		 	else {
		  		return "'$valueNoInjection'";
			}
		break;
		
		case "text":
			if ($valueNoInjection == '') {
				return "NULL";
		 	}
		 	else {
		  		return "'$valueNoInjection'";
			}
		break;
		
		case "longtext":
			if ($valueNoInjection == '') {
				return "NULL";
		 	}
		 	else {
		  		return "'$valueNoInjection'";
			}
		break;
		
		case "integer":
			if ($valueNoInjection == '') {
				return "NULL";
			}
			else {
				return "$valueNoInjection";
			}
		break;

		case "numeric":
			if ($valueNoInjection == '') {
				return "NULL";
			}
			else {
				$valueNoInjection = str_replace('.','',$valueNoInjection);
				$valueNoInjection = str_replace(',','.',$valueNoInjection);
				return "$valueNoInjection";
			}
		break;

		case "serial":
			if ($valueNoInjection == '') {
				return "NULL";
			}
			else {
				return "$valueNoInjection";
			}
		break;

		case "date":
			if ($valueNoInjection == '') {
				return "NULL";
			}
			else {
				list ($dia, $mes, $ano) = split ('[/.-]', $valueNoInjection);
				return "'$ano-$mes-$dia'";
			}
		break;

		case "time":
			if ($valueNoInjection == '') {
				return "NULL";
		 	}
		 	else {
		  		return "'$valueNoInjection'";
			}
		break;

		case "timestamp":
			if ($valueNoInjection == '') {
				return "NULL";
			}
			else {
				$ano    = substr($valueNoInjection,6,4);
				$mes    = substr($valueNoInjection,3,2);
				$dia    = substr($valueNoInjection,0,2);
				$hora   = substr($valueNoInjection,11,2);
				$minuto = substr($valueNoInjection,14,2);
				return "'$ano-$mes-$dia $hora:$minuto:00'";
			}
		break;

		case "boolean":
			if ($valueNoInjection == 't') {
				return "'t'";
			}
			else {
				return "'f'";
			}
		break;
	}
}

function pRedirect($url) {
	echo '<script type="text/javascript">parent.location = \''.$url.'\'</script>'."\n";
}

function pError($text,$stderr) {
	if ($stderr == 'html') {
		echo $text."\n";
	}
	else if ($stderr == 'js') {
		$tratedText = str_replace('\'','\\\'',$text);
		echo '<script type="text/javascript">' . "\n";
		echo '	alert(\''.$tratedText.'\')' . "\n";
		echo '</script>' . "\n";	
	}
	else {
		echo '"stderr" unknow for pacrudError';
	}
}

function pGetSchema($schema,$sgdb) {
	global $pacrudConfig;
	
	if ($sgdb != '') {
		$lsgdb = $sgdb;
	}
	else {
		$lsgdb = $pacrudConfig['sgdb'];
	}

	if ($schema == '') {
		return '';
	}
	else {
		switch ($lsgdb) {
			case 'pgsql':
				return $schema.'.';
				break;
			case 'mariadb':
				return $schema.'_';
				break;
			case 'sqlite3':
				return $schema.'_';
				break;
			default:
				return $schema;
				break;
		}
	}
}

function pXmlAddParent($xml,$parent) {
	$arrXml = explode("\n",$xml);
	
	$newXml = '<'.$parent.'>'."\n";
	for ($i=0; $i < count($arrXml); $i++) {
		$newXml .= '	'.$arrXml[$i]."\n";
	}
	$newXml .= '</'.$parent.'>'."\n";
	
	return $newXml;
}

function pGetTheme($fileName,$webPath) {
	global $pacrudConfig;
	
	if ($webPath) {
		$path = $pacrudConfig['pacrudWebPath'];
	}
	else {
		$path = $pacrudConfig['pacrudPath'];
	}
	
	$file = $pacrudConfig['pacrudPath'].'/themes/'.$pacrudConfig['theme'].'/'.$fileName;
	if (file_exists($file)) {
		return $path.'/themes/'.$pacrudConfig['theme'].'/'.$fileName;
	}
	else {
		return $path.'/themes/default/'.$fileName;
	}
}

function xmlError($err,$msg,$verbose=false) {
	global $pacrudConfig;
	$xml  = '<err>'.$err.'</err>'."\n";
	$xml .= '<msg>'.$msg.'</msg>';
	$xml = pXmlAddParent($xml,$pacrudConfig['appIdent']);
	
	if ($verbose) {
		Header('Content-type: application/xml; charset=UTF-8');
		echo $xml;
	}
	
	return $xml;
}

function pGetConfigDb() {
	global $pacrudConfig;
	global $pConnectionPacrud;
	
	require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');
	if ($pConnectionPacrud->connected(true) == false) {
		echo $pConnectionPacrud->getErr().' ('.$pConnectionPacrud->param['dbname'].' - '.$pConnectionPacrud->sgdb().')';
		exit;
	}
	
	$pacrudSchema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	$sql = 'SELECT * FROM '.$pacrudSchema.'config;';
	$sqlArray = $pConnectionPacrud->sql2Array($sql);
	
	$pacrudConfigDb = array();
	for ($i = 0; $i < count($sqlArray); $i++) {
		$pacrudConfigDb[$sqlArray[$i]['config_name']] = $sqlArray[$i]['config_value'];
	}
	if (count($pacrudConfigDb) > 0) {
		$pacrudConfigNew = array_replace($pacrudConfig, $pacrudConfigDb);
		$pacrudConfig = $pacrudConfigNew;
	}
}

/**
 * Formata dados de acordo com o tipo, para mostrar ao usuário
 */
function format($type,$value) {
	if ($type == 'timestamp' and $value != '') {
		$year = substr($value,0,4);
		$month = substr($value,5,2);
		$day = substr($value,8,2);
		$hour = substr($value,11,2);
		$minute = substr($value,14,2);
		$second = substr($value,17,2);
		$timestamp = substr($value,17,2);
		$formatedValue = $day . '/' . $month . '/' . $year . ' ' . $hour . ':' . $minute . ':' . $second;
	}
	else if ($type == 'date') {
		$year = substr($value,0,4);
		$month = substr($value,5,2);
		$day = substr($value,8,2);
		
		$formatedValue = $day . '/' . $month . '/' . $year;
	}
	else if ($type == 'boolean' and $value != '') {
		if ($value == 't') {
			$formatedValue = '<input type="checkbox" readonly="readonly" checked="checked" />';
		}
		else {
			$formatedValue = '<input type="checkbox" readonly="readonly" />';
		}
	}
	else {
		$formatedValue = str_replace($value,'\\n','<br />');
	}
	
	if ($formatedValue == '//' or $formatedValue == '//::') {
		$formatedValue = '';
	}
	return $formatedValue;
}

/**
 * Carrega um array com as permissões de todas as rotinas
 */
function loadPermission() {
	global $pConnectionPacrud;
	global $pacrudConfig;
	global $pacrudPermission;
	global $pacrudGlobal;
	
	if (!isset($pConnectionPacrud)) {
		require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');
	}
	
	$schema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	
	$sql  = 'SELECT '."\n";
	$sql .= '	r.routine,'."\n";
	$sql .= '	sum(CASE WHEN c=\'t\' THEN 1 ELSE 0 END) as c,'."\n";
	$sql .= '	sum(CASE WHEN r=\'t\' THEN 1 ELSE 0 END) as r,'."\n";
	$sql .= '	sum(CASE WHEN u=\'t\' THEN 1 ELSE 0 END) as u,'."\n";
	$sql .= '	sum(CASE WHEN d=\'t\' THEN 1 ELSE 0 END) as d'."\n";
	$sql .= 'FROM '.$schema.'routines r'."\n";
	$sql .= 'JOIN '.$schema.'routines_groups rg ON rg.routine=r.routine'."\n";
	$sql .= 'JOIN '.$schema.'groups_syslogin gs ON gs.groupname=rg.groupname'."\n";
	$sql .= 'JOIN '.$schema.'groups g ON g.groupname=rg.groupname'."\n";
	$sql .= 'JOIN '.$schema.'syslogin s ON s.username=gs.username'."\n";
	$sql .= 'WHERE r.enabled=\'t\''."\n";
	$sql .= 'AND g.enabled=\'t\''."\n";
	$sql .= 'AND s.enabled=\'t\''."\n";
	$sql .= 'AND gs.username=\''.$pacrudGlobal['currentUser'].'\''."\n";
	$sql .= 'GROUP BY r.routine;'."\n";
	
	$pacrudPermission = $pConnectionPacrud->sql2Array($sql);
}

/**
 * Carrega as permissões para uma rotina específica
 */
function getPermission($routine) {
	global $pacrudPermission;
	
	if (!isset($pacrudPermission)) {
		loadPermission();
	}
	
	$permission = array('routine'=>$routine,'c'=>false,'r'=>false,'u'=>false,'d'=>false);
	
	for ($i=0; $i < count($pacrudPermission); $i++) {
		if ($routine == $pacrudPermission[$i]['routine']) {
			$permission = $pacrudPermission[$i];
			
			if ($permission['c'] > 0) {
				$permission['c'] = true;
			}
			else {
				$permission['c'] = false;
			}
			
			if ($permission['r'] > 0) {
				$permission['r'] = true;
			}
			else {
				$permission['r'] = false;
			}
			
			if ($permission['u'] > 0) {
				$permission['u'] = true;
			}
			else {
				$permission['u'] = false;
			}
			
			if ($permission['d'] > 0) {
				$permission['d'] = true;
			}
			else {
				$permission['d'] = false;
			}
		}
	}
	
	return $permission;
}

/**
 * Retorna true ou false informado a rotina e a permissão desejada
 */
function pPermitted($routine,$permission='any') {
	$arrPermission = getPermission($routine);
	
	if ($permission == 'any') {
		if ($arrPermission['c'] or $arrPermission['r'] or $arrPermission['u'] or $arrPermission['d']) {
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return $arrPermission[$permission];
	}
}

/**
 * Protege o script de acordo com as permissões de determinada rotina
 */
function pProtect($routine,$permission='any') {
	global $pacrudGlobal;

	if ($pacrudGlobal['currentUser'] == '') {
		echo _('Sua sessão expirou, faça login novamente!');
		exit;
	}
	
	if (!pPermitted($routine,$permission)) {
		echo _('Acesso Negado');
		exit;
	}
}

function pListFiles($directory,$include='',$exclude='',$recursive=true) {
	$list = scandir($directory,0);
	$fileList = array();
	
	for ($i=0; $i < count($list); $i++) {
		if ($list[$i] != '.' and $list[$i] != '..') {
			$current = $directory . DIRECTORY_SEPARATOR . $list[$i];
			
			if (is_file($current) and ($include == '' or preg_match($include,strtolower($current))) and ($exclude == '' or !preg_match($exclude,strtolower($current)))) {	
				$fileList[] = $current;
			}
			
			if (is_dir($current) and $recursive) {
				$fileList = array_merge($fileList,pListFiles($current,$include,$exclude));
			}
		}
	}
	
	return $fileList;
}

/**
 * Converte um endereço do disco local em endereço web
 */
function pFileLocal2Web($location) {
	if (is_array($location)) {
		$locationWeb = array();
		for ($i=0; $i < count($location); $i++) {
			$locationWeb[] = pFileLocal2Web($location[$i]);
		}
	}
	else {
		if (dirname($_SERVER["SCRIPT_FILENAME"]) == dirname($location)) {
			$locationWeb = basename($location);
		}
		else {
			$fileLocation = substr($_SERVER["SCRIPT_FILENAME"],0,strlen($_SERVER["SCRIPT_NAME"])-1);
			$locationWeb = substr($location,strlen($fileLocation));
		}
	}
	return $locationWeb;
}

/**
 * Verifica se determinado arquivo de atualização sql já foi executado
 * @param $fileName string: nome do arquivo que contém os comandos SQL de atualizaçãp do banco no formato do paCRUD
 * @param $connection pacrudConnection: a conexão com o banco de dados a ser usada
 * @param $db string: 'framework' para banco de dados do framework e 'app' para o banco de dados da aplicação
 * @returns boolean
 */
function upToDate($fileName,$connection,$db='framework') {
	global $pacrudConfig;
	global $pConnectionPacrud;
	
	if ($db == 'framework') {
		$table = 'update_framework';
	}
	else {
		$table = 'update_db_app';
		writeAppUpdate('');
	}	
	
	$pacrudSchema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	$sql = 'SELECT count(*) FROM '.$pacrudSchema.$table.' WHERE file_name='.pFormatSql($fileName,'string').';';
	
	return $connection->sqlQuery($sql);
}

/**
 * Grava no banco de dados da aplicação os scripts de atualização que já foram executados
 * @param $fileName string: nome do script, se informado '', apenas irá verificar e criar a tabela de atualização no
 * banco da app
 */
function writeAppUpdate($fileName) {
	global $pConnection;
	global $pConnectionPacrud;
	global $pacrudConfig;
	global $pacrudGlobal;
	
	//verifica se a tabela existe na base de dados, caso não existe, cria
	$sql  = 'SELECT'."\n";
	$sql .= '	count(*)'."\n";
	$sql .= 'FROM information_schema.tables'."\n";
	$sql .= 'WHERE table_schema='.pFormatSql($pacrudConfig['loginSchema_pacrud'],'string')."\n";
	$sql .= 'AND table_name=\'update_db_app\';';
	$table = $pConnection->sqlQuery($sql);
	
	$pacrudSchema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	if (!$table) {
		$sql  = 'CREATE TABLE '.$pacrudSchema.'update_db_app'."\n";
		$sql .= '('."\n";
		$sql .= '  file_name character varying(100) NOT NULL,'."\n";
		$sql .= '  usr_login character varying(40),'."\n";
		$sql .= '  date_time timestamp without time zone NOT NULL DEFAULT now(),'."\n";
		$sql .= '  CONSTRAINT update_db_app_pkey PRIMARY KEY (file_name)'."\n";
		$sql .= ')'."\n";
		$sql .= 'WITH ('."\n";
		$sql .= '  OIDS=FALSE'."\n";
		$sql .= ');';
		
		$pConnection->sqlQuery($sql);
	}
	
	if ($fileName != '') {
		$sql  = 'INSERT INTO '.$pacrudSchema.'update_db_app ('."\n";
		$sql .= '	file_name,'."\n";
		$sql .= '	usr_login,'."\n";
		$sql .= '	date_time'."\n";
		$sql .= ')'."\n";
		$sql .= 'VALUES ('."\n";
		$sql .= '	'.pFormatSql($fileName,'string').','."\n";
		$sql .= '	'.pFormatSql($pacrudGlobal['currentUser'],'string').','."\n";
		$sql .= '	now()'."\n";
		$sql .= ');'."\n";
		
		$pConnection->sqlQuery($sql);
	}
}

