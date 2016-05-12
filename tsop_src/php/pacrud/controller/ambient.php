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

//carrega todas as classes
require_once($pacrudConfig['pacrudPath'].'/controller/all_models.php');

session_start();

if (!extension_loaded('gettext')) {
	echo '<p>É necessário ativar a extensão gettext no PHP</p>'."\n";
	exit;
}

//verifica se as configurações estão salvas no banco e busca as informações
if ($pacrudConfig['sgdb_pacrud'] == 'pgsql' or $pacrudConfig['sgdb_pacrud'] == 'mariadb' or $pacrudConfig['sgdb_pacrud'] == 'sqlite3') {
	pGetConfigDb();
}

if (isset($_SESSION[$pacrudConfig['appIdent'].'_pacrudUserName'])) {
	$pacrudGlobal['currentUser'] = $_SESSION[$pacrudConfig['appIdent'].'_pacrudUserName'];
	$pacrudGlobal['currentFullName'] = $_SESSION[$pacrudConfig['appIdent'].'_pacrudFullName'];
}
else {
	$pacrudGlobal['currentUser'] = '';
	$pacrudGlobal['currentFullName'] = '';
}

$pacrudGlobal['computerId'] = $_SERVER["REMOTE_ADDR"];


// seta as configuraçãoes de log da conexão com o banco do framework $pConnectionPacrud
if ($pacrudConfig['logInsert_pacrud'] == 't') {
	$pConnectionPacrud->setLogType('insert');
}

if ($pacrudConfig['logSelect_pacrud'] == 't') {
	$pConnectionPacrud->setLogType('select');
}

if ($pacrudConfig['logUpdate_pacrud'] == 't') {
	$pConnectionPacrud->setLogType('update');
}

if ($pacrudConfig['logDelete_pacrud'] == 't') {
	$pConnectionPacrud->setLogType('delete');
}



//seta o idioma do usuário
setlocale(LC_ALL,$pacrudConfig['locale']);

//pasta das tabelas de tradução para gettext
bindtextdomain('paCRUD', $pacrudConfig['pacrudPath'].'/locale');

//seta o dominio paCRUD
textdomain('paCRUD');

//codificação
//bind_textdomain_codeset('paCRUD', 'UTF-8');

//configura o pacrudPages, buscando no banco de dados a tabela "routines"
require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');

$sqlPacrudRoutines = 'SELECT routine,link FROM '.pGetSchema($pacrudConfig['loginSchema_pacrud'],$pacrudConfig['sgdb_pacrud']).'routines;';
$pacrudRoutines = $pConnectionPacrud->sql2Array($sqlPacrudRoutines);
for ($i=0; $i<count($pacrudRoutines); $i++) {
	if ($pacrudRoutines[$i]['link'] != '') {
		$pacrudPages[$pacrudRoutines[$i]['routine']] = $pacrudRoutines[$i]['link'];
	}
}
