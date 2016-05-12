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

require_once('pacrud.php');

$pLogin = new pacrudLogin($pacrudConfig['appIdent'],null,'','');

if (isset($_GET['action']) and $_GET['action'] == 'logoff') {
	$pLogin->logoff();
	if ($pacrudConfig['appWebPath'] == '') $pacrudConfig['appWebPath'] = '/dev';
	pRedirect(str_replace('/app','/dev',$pacrudConfig['appWebPath']));
}
else {
	if ($pLogin->isSession()) {
		include('view_index.php');
	}
	else {
		include($pacrudConfig['pacrudPath'].'/dev/view_login.php');
	}
}
