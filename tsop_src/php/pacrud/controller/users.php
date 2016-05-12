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

require_once('../config_default.php');
require_once('../app/pacrud.php');
pProtect('pacrud_users');

require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');

class pacrudUsers extends paCRUD {
	function sqlCreate() {
		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		$password = md5($_POST['new_username']);
		$sql = 'INSERT INTO '.$schema.$tableName.' (username,fullname,password,enabled) VALUES (:new_username:,:new_fullname:,\''.$password.'\',:new_enabled:);';
		return $sql;
	}
}

$schema = $pacrudConfig['loginSchema_pacrud'];
$xmlFile = $pacrudConfig['pacrudWebPath'].'/controller/users.php?pacrud_appIdent='.$pacrudConfig['appIdent'];

$crudUsers = new pacrudUsers('objName=crudUsers,xmlFile='.$xmlFile.',schema='.$schema.',tableName=syslogin,routine=pacrud_users');
$crudUsers->setConnection($pConnectionPacrud);
$crudUsers->addField('name=username,label='._('Usuário').',pk');
$crudUsers->addField('name=fullname,label='._('Nome completo'));
$crudUsers->addField('name=enabled,label='._('Ativo').',type=boolean,notNull,default=t');

$crudUsers->autoInit();
