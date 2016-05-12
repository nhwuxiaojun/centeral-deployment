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
$xmlFile = $pacrudConfig['pacrudWebPath'].'/controller/routines.php';

$crudRoutines = new paCRUD('objName=crudRoutines,xmlFile='.$xmlFile.',schema='.$schema.',tableName=routines,routine=pacrud_routines');
$crudRoutines->setConnection($pConnectionPacrud);
$crudRoutines->addField('name=routine,label='._('Identificação').',pk,notNull');
$crudRoutines->addField('name=link,label='._('Link'));
$crudRoutines->addField('name=description,label='._('Descrição'));
$crudRoutines->addField('name=enabled,label='._('Ativo').',type=boolean,notNull,default=t');

class pacrudCrudListRoutine extends pacrudCrudList {
	public function sqlSearch() {
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		
		$offsetNum = ($this->page - 1) * $this->pageLines();
		
		$sql  = 'SELECT'."\n";
		$sql .= '	r.routine,'."\n";
		$sql .= '	v.tree,'."\n";
		$sql .= '	r.link,'."\n";
		$sql .= '	r.description,'."\n";
		$sql .= '	r.enabled'."\n";
		$sql .= 'FROM '.$schema.'routines r'."\n";
		$sql .= 'LEFT OUTER JOIN '.$schema.'v_menu v ON v.routine=r.routine'."\n";
		
		$offset = ' OFFSET '.$offsetNum;
		$limit = ' LIMIT '.$this->pageLines();
		$orderby = $this->sqlOrderby();
		$condition = $this->sqlCondition();
		$sqlSearch = $sql.$condition.$orderby.$limit.$offset.';';
		
		return $sqlSearch;
	}
	
	public function sqlCount() {
		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		
		$sql  = 'SELECT'."\n";
		$sql .= '	count(*)'."\n";
		$sql .= 'FROM '.$schema.'routines r'."\n";
		$sql .= 'LEFT OUTER JOIN '.$schema.'v_menu v ON v.routine=r.routine'."\n";
		
		$condition = $this->sqlCondition();
		$sqlCount = $sql.$condition.';';
		return $sqlCount;
	}
}

$crudRoutines->pCrudList = new pacrudCrudListRoutine('objName=pCrudList_crudRoutines,xmlFile='.$xmlFile.',crudName=crudRoutines,schema='.$schema.',tableName=routines');
$crudRoutines->pCrudList->setConnection($pConnectionPacrud);
$crudRoutines->pCrudList->addField('name=routine,sqlName=r.routine,label='._('Identificação').',pk,notNull');
$crudRoutines->pCrudList->addField('name=tree,sqlName=v.tree,label='._('Menu'));
$crudRoutines->pCrudList->addField('name=link,sqName=r.link,label='._('Link'));
$crudRoutines->pCrudList->addField('name=description,sqlName=r.description,label='._('Descrição'));
$crudRoutines->pCrudList->addField('name=enabled,sqlName=r.enabled,label='._('Ativo').',type=boolean,notNull,default=t');

$crudRoutines->autoInit();
