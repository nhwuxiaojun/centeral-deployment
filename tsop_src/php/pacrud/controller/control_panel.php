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

require_once('../app/pacrud.php');
require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');

pProtect('pacrud_controlPanel');

$configToWrite[] = 'appIdent';
$configToWrite[] = 'appName';
$configToWrite[] = 'sgdb';
$configToWrite[] = 'dbHost';
$configToWrite[] = 'dbPort';
$configToWrite[] = 'dbName';
$configToWrite[] = 'dbUserName';
$configToWrite[] = 'dbPassword';
$configToWrite[] = 'dbEncoding';
$configToWrite[] = 'appSchema';
$configToWrite[] = 'language';
$configToWrite[] = 'locale';
$configToWrite[] = 'theme';
$configToWrite[] = 'searchLines';
$configToWrite[] = 'showPacrudLogo';
$configToWrite[] = 'logInsert';
$configToWrite[] = 'logSelect';
$configToWrite[] = 'logUpdate';
$configToWrite[] = 'logDelete';
$configToWrite[] = 'logInsert_pacrud';
$configToWrite[] = 'logSelect_pacrud';
$configToWrite[] = 'logUpdate_pacrud';
$configToWrite[] = 'logDelete_pacrud';
$configToWrite[] = 'commandPacrudUpdate';
$configToWrite[] = 'commandAppUpdate';

function writeConfig($configName,$configValue) {
	global $pacrudConfig;
	global $pConnectionPacrud;
	
	$schema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	$sqlRetrieve = 'SELECT count(*) FROM '.$schema.'config WHERE config_name=\''.$configName.'\';';
	if ($pConnectionPacrud->sqlQuery($sqlRetrieve) == '0') {
		$sqlWrite = 'INSERT INTO '.$schema.'config (config_name,config_value) VALUES (\''.$configName.'\',\''.$configValue.'\');';
	}
	else {
		$sqlWrite = 'UPDATE '.$schema.'config SET config_value=\''.$configValue.'\' WHERE config_name=\''.$configName.'\';';
	}
	
	$pConnectionPacrud->sqlQuery($sqlWrite);
}

// Grava as configurações no banco de dados do framework
for ($i = 0; $i < count($configToWrite); $i++) {
	$config = $configToWrite[$i];
	if (isset($_POST[$configToWrite[$i]])) {
		$value = $_POST[$configToWrite[$i]];
	}
	else {
		$value = '0';
	}
	writeConfig($config,$value);
}
echo 'OK';

