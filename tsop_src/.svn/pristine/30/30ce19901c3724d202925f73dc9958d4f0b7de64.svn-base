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
require_once('../controller/connection.php');

pProtect('pacrud_update');

if ($pacrudConfig['commandAppUpdate'] == '') {
	echo _('É necessário configurar o comando de atualização da aplicação no painel de controle');
}
else {
	$return = shell_exec($pacrudConfig['commandAppUpdate']);
	
	sleep(1);
	
	// prepara a lista de arquivos na pasta de atualização da aplicação
	$scriptUpdateDir = $pacrudConfig['appPath'].'/updatedb/';
	$scriptUpdateAll = scandir($scriptUpdateDir);
	$scriptUpdateNew = array();
	for ($i=0; $i < count($scriptUpdateAll); $i++) {
		$pathParts = pathinfo($scriptUpdateDir.$scriptUpdateAll[$i]);
		if (strtolower($pathParts['extension']) == 'php' and upToDate($scriptUpdateAll[$i],$pConnection,'app') == false) {
			$scriptUpdateNew[] = $scriptUpdateAll[$i];
		}
	}
	sort($scriptUpdateNew);
	
	// Executa os scripts sql novos
	for ($i=0; $i < count($scriptUpdateNew); $i++) {
		$inclusionFile = $scriptUpdateDir.$scriptUpdateNew[$i];
		$sql = '';
		include($inclusionFile);
		
		$pConnection->sqlQuery($sql);
		
		//marca o script como atualizado
		writeAppUpdate($scriptUpdateNew[$i]);
	}
}

echo $return;
