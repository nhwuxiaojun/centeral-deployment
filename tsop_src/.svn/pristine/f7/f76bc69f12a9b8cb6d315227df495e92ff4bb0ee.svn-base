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
$xmlFile = $pacrudConfig['pacrudWebPath'].'/controller/routines_menus.php';

$crudRoutinesMenus = new paCRUD('objName=crudRoutinesMenus,xmlFile='.$xmlFile.',parent1xN=crudRoutines,schema='.$schema.',tableName=menu,routine=pacrud_routines');
$crudRoutinesMenus->setConnection($pConnectionPacrud);
$crudRoutinesMenus->addField('name=cod,type=serial,label='._('Código').',pk,visible=false');
$crudRoutinesMenus->addField('name=routine,label='._('Rotina').',pk,readonly,visible=false');
$crudRoutinesMenus->addField('name=parent,type=integer,label='._('cod').',visible=false');
$crudRoutinesMenus->addField('name=tree,fieldId=parent_name,label='._('Menu Pai').',virtual');
$crudRoutinesMenus->addField('name=caption,label='._('Rótulo').',notNull');
$crudRoutinesMenus->addField('name=icon,label='._('Ícone'));
$crudRoutinesMenus->addField('name=opened,type=boolean,label='._('Aberto').',default=t');
$crudRoutinesMenus->addField('name=enabled,fieldId=menuEnabled,type=boolean,label='._('Ativado').',notNull,default=t');

$crudRoutinesMenus->autoInit();
