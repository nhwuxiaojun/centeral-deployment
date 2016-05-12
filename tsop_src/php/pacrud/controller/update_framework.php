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

include('../app/pacrud.php');

pProtect('pacrud_update');

if ($pacrudConfig['commandPacrudUpdate'] == '') {
	echo _('É necessário configurar o comando de atualização no painel de controle');
}
else {
	$return = shell_exec($pacrudConfig['commandPacrudUpdate']);
	
	sleep(1);
	
	// prepara a lista de arquivos na pasta de atualização
	$scriptUpdateDir = $pacrudConfig['pacrudPath'].'/updatedb/'.$pacrudConfig['sgdb_pacrud'].'/';
	$scriptUpdateAll = scandir($scriptUpdateDir);
	$scriptUpdateNew = array();
	for ($i=0; $i < count($scriptUpdateAll); $i++) {
		$pathParts = pathinfo($scriptUpdateDir.$scriptUpdateAll[$i]);
		if (strtolower($pathParts['extension']) == 'php' and upToDate($scriptUpdateAll[$i],$pConnectionPacrud) == false) {
			$scriptUpdateNew[] = $scriptUpdateAll[$i];
		}
	}
	sort($scriptUpdateNew);
	
	// Executa os scripts sql novos
	for ($i=0; $i < count($scriptUpdateNew); $i++) {
		$inclusionFile = $scriptUpdateDir.$scriptUpdateNew[$i];
		$sql = '';
		include($inclusionFile);
		
		$pConnectionPacrud->sqlQuery($sql);
		
		//marca o script como atualizado
		$pacrudSchema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
		$sql  = 'INSERT INTO '.$pacrudSchema.'update_framework ('."\n";
		$sql .= '	file_name,'."\n";
		$sql .= '	usr_login,'."\n";
		$sql .= '	date_time'."\n";
		$sql .= ')'."\n";
		$sql .= 'VALUES ('."\n";
		$sql .= '	'.pFormatSql($scriptUpdateNew[$i],'string').','."\n";
		$sql .= '	'.pFormatSql($pacrudGlobal['currentUser'],'string').','."\n";
		if ($pConnectionPacrud->sgdb() == 'pgsql') {
			$sql .= '	now()'."\n";
		}
		if ($pConnectionPacrud->sgdb() == 'sqlite3') {
			$sql .= '	CURRENT_TIMESTAMP'."\n";
		}
		$sql .= ');'."\n";
		$pConnectionPacrud->sqlQuery($sql);
	}
}

echo $return;
