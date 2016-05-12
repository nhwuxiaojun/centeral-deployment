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
pProtect('pacrud_changePassword');

require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');

Header('Content-type: application/xml; charset='.$pConnectionPacrud->encoding);

// Verifica se existe usuário logado
if ($pacrudGlobal['currentUser'] == '') {
	$xml  = '<err>err</err>'."\n";
	$xml .= '<msg>'._('Sua sessão expirou, faça login novamente').'</msg>';
}
else {
	// monta o sql
	$password = md5($_POST['password']);
	$newPassword = md5($_POST['new_password']);
	$schema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pConnectionPacrud->sgdb());
	
	$sqlConsulta = 'SELECT username FROM '.$schema.'syslogin WHERE username='.pFormatSql($pacrudGlobal['currentUser'],'string').' AND "password"='.pFormatSql($password,'string').';';
	
	$sqlUdate  = 'UPDATE '.$schema.'syslogin SET "password"='.pFormatSql($newPassword,'string').' ';
	$sqlUdate .= 'WHERE username='.pFormatSql($pacrudGlobal['currentUser'],'string').';';
	
	// corrige o comando Sql para banco mariadb
	if ($pConnectionPacrud->sgdb() == 'mariadb') {
		$sqlConsulta = str_replace('"password"','password',$sqlConsulta);
		$sqlUdate = str_replace('"password"','password',$sqlUdate);
	}
	
	// retorna a mensagem em xml
	if ($_POST['new_password'] == '') {
		$xml  = '<err>err</err>'."\n";
		$xml .= '<msg>'._('A nova senha não pode ficar em branco.').'</msg>';
	}
	elseif ($pConnectionPacrud->sqlquery($sqlConsulta) != $pacrudGlobal['currentUser']) {
		$xml  = '<err>err</err>'."\n";
		$xml .= '<msg>'._('A senha atual não confere.').'</msg>';
	}
	else {
		$pConnectionPacrud->sqlquery($sqlUdate);
		$xml = '<msg>'._('Senha alterada com sucesso!').'</msg>';
	}
}

$xml = pXmlAddParent($xml,$pacrudConfig['appIdent']);

echo $xml;
