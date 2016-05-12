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
  
/*
*** ATENÇÃO *** NÃO ALTERE ESTE ARQUIVO
*** WARNING *** DO NOT CHANGE THIS FILE

*/
  
/**
 * Trata caminhos da aplicações e do framework de acordo com o as variáveis globais do servidor
 *
 * @param pathName string: nome do caminho a ser retornado (pacrudPath, pacrudWebPath, appPathDefault ou pacrudWebPathDefault)
 * @returns string: caminho solicitado
 * @returns boolean: retorna false se nenhum pathName conhecido foi passado como parâmetro
 */
function getPacrudPath($pathName) {
	$pacrudPath = dirname($_SERVER['SCRIPT_FILENAME']);
	$pacrudWebPath = dirname($_SERVER['SCRIPT_NAME']);
	
	$tail = substr($pacrudPath,strlen($pacrudPath)-4,4);
	if (($tail == '/app' or $tail == '/dev') and !file_exists($pacrudPath.'/config_default.php') and file_exists($pacrudPath.'/../config_default.php')) {
		$pacrudPath = substr($pacrudPath,0,strlen($pacrudPath)-4);
		$pacrudWebPath = substr($pacrudWebPath,0,strlen($pacrudWebPath)-4);
	}
	
	$tail = substr($pacrudPath,strlen($pacrudPath)-11,11);
	if ($tail == '/controller' and !file_exists($pacrudPath.'/config_default.php') and file_exists($pacrudPath.'/../config_default.php')) {
		$pacrudPath = substr($pacrudPath,0,strlen($pacrudPath)-11);
		$pacrudWebPath = substr($pacrudWebPath,0,strlen($pacrudWebPath)-11);
	}
	
	switch ($pathName) {
		case 'pacrudPath':
			return $pacrudPath;
			break;
		case 'pacrudWebPath':
			return $pacrudWebPath;
			break;
		case 'appPathDefault':
			return $pacrudPath.'/app';
			break;
		case 'pacrudWebPathDefault':
			return $pacrudWebPath.'/app';
			break;
		default:
			return false;
			break;
	}
}

$pacrudVersion = '0.7 beta';

// Configurações de path e identificação
if (!isset($pacrudConfig['appIdent']))      $pacrudConfig['appIdent']      = 'paCRUD';
if (!isset($pacrudConfig['appName']))       $pacrudConfig['appName']       = 'PHP Ajax CRUD Framework';
if (!isset($pacrudConfig['pacrudPath']))    $pacrudConfig['pacrudPath']    = getPacrudPath('pacrudPath');
if (!isset($pacrudConfig['pacrudWebPath'])) $pacrudConfig['pacrudWebPath'] = getPacrudPath('pacrudWebPath');
if (!isset($pacrudConfig['appPath']))       $pacrudConfig['appPath']       = getPacrudPath('appPathDefault');	
if (!isset($pacrudConfig['appWebPath']))    $pacrudConfig['appWebPath']    = getPacrudPath('pacrudWebPathDefault');

// Conectividade com Banco de dados paCRUD
$pacrudConfig['sgdb_pacrud']            = 'sqlite3';
$pacrudConfig['dbHost_pacrud']          = '';
$pacrudConfig['dbPort_pacrud']          = '';
$pacrudConfig['dbUserName_pacrud']      = '';
$pacrudConfig['dbPassword_pacrud']      = '';
$pacrudConfig['dbEncoding_pacrud']      = 'default';
$pacrudConfig['loginSchema_pacrud']     = 'pacrud';
$pacrudConfig['dbName_pacrud']          = $pacrudConfig['pacrudPath'].'/db/db_pacrud.sqlite3';

// Conectividade com Banco de dados da aplicação
$pacrudConfig['sgdb']            = 'pgsql';
$pacrudConfig['dbHost']          = 'localhost';
$pacrudConfig['dbPort']          = '5432';
$pacrudConfig['dbName']          = 'db_pacrud';
$pacrudConfig['dbUserName']      = 'pacrud';
$pacrudConfig['dbPassword']      = 'pacrud';
$pacrudConfig['dbEncoding']      = 'default';
$pacrudConfig['appSchema']       = 'public';

$locale = explode(',',$_SERVER["HTTP_ACCEPT_LANGUAGE"]);
$locale = explode(';',$locale[0]);
$pacrudConfig['defaultLanguage'] = $locale[0];
$pacrudConfig['defaultLocale'] = $locale[0].'.utf8';

// Configurações gerais
$pacrudConfig['language']        = $pacrudConfig['defaultLanguage'];
$pacrudConfig['locale']          = $pacrudConfig['defaultLocale'];
$pacrudConfig['theme']           = 'default';
$pacrudConfig['searchLines']     = 14;
$pacrudConfig['afterLogin']      = 'index.php';
$pacrudConfig['showPacrudLogo']  = 't';
$pacrudConfig['commandPacrudUpdate']   = '';
$pacrudConfig['commandAppUpdate']      = '';

$pacrudConfig['logInsert'] = 'f';
$pacrudConfig['logSelect'] = 'f';
$pacrudConfig['logUpdate'] = 'f';
$pacrudConfig['logDelete'] = 'f';

$pacrudConfig['logInsert_pacrud'] = 'f';
$pacrudConfig['logSelect_pacrud'] = 'f';
$pacrudConfig['logUpdate_pacrud'] = 'f';
$pacrudConfig['logDelete_pacrud'] = 'f';

// Configuração das paginas de inclusão
$pacrudPages['pacrud_about']          = $pacrudConfig['pacrudPath'].'/view/about.php';
$pacrudPages['pacrud_submission']     = $pacrudConfig['pacrudPath'].'/view/submission.php';
$pacrudPages['pacrud_users']          = $pacrudConfig['pacrudPath'].'/view/users.php';
$pacrudPages['pacrud_groups']         = $pacrudConfig['pacrudPath'].'/view/groups.php';
$pacrudPages['pacrud_changePassword'] = $pacrudConfig['pacrudPath'].'/view/change_password.php';
$pacrudPages['pacrud_controlPanel']   = $pacrudConfig['pacrudPath'].'/view/control_panel.php';
$pacrudPages['pacrud_routines']       = $pacrudConfig['pacrudPath'].'/view/routines.php';
$pacrudPages['pacrud_reg_menu']       = $pacrudConfig['pacrudPath'].'/view/reg_menu.php';
$pacrudPages['pacrud_update']         = $pacrudConfig['pacrudPath'].'/view/update.php';
$pacrudPages['pacrud_devtools']       = $pacrudConfig['pacrudPath'].'/controller/devtools.php';

