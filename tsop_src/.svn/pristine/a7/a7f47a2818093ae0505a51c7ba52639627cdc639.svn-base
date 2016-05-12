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
require_once($pacrudConfig['pacrudPath'].'/controller/connection_admin.php');

$schema = $pacrudConfig['loginSchema_pacrud'];
$xmlFile = $pacrudConfig['pacrudWebPath'].'/controller/reg_menu.php';

$crudRegMenu = new paCRUD('objName=crudRegMenu,xmlFile='.$xmlFile.',schema='.$schema.',tableName=menu,title='._('Configuração de Menu').',routine=pacrud_reg_menu');
$crudRegMenu->setConnection($pConnectionPacrud);
$crudRegMenu->addField('name=cod,type=serial,label='._('Código').',pk');
$crudRegMenu->addField('name=parent,type=integer,label='._('Cod Pai').',search=searchMenus');
$crudRegMenu->addField('name=tree,fieldId=parent_name,label='._('Menu Pai').',virtual');
$crudRegMenu->addField('name=caption,label='._('Rótulo').',notNull');
$crudRegMenu->addField('name=routine,label='._('Rotina').',notNull,search=searchRoutines');
$crudRegMenu->addField('name=icon,label='._('Ícone'));
$crudRegMenu->addField('name=opened,type=boolean,label='._('Aberto').',notNull,default=t');
$crudRegMenu->addField('name=enabled,type=boolean,label='._('Ativado').',notNull,default=t');

$crudRegMenu->autoInit();
