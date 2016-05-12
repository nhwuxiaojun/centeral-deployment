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

class pacrudBasic {
	public $name;
	public $field;
	public $error;
	public $param;
	public $pConnection;
	
	protected $strParams;
	
	function __construct($params) {
		global $pacrudConfig;
		global $pConnection;
		if ($pacrudConfig['pacrudPath'] != '') {
			require_once($pacrudConfig['pacrudPath'].'/controller/connection.php');
		}

		$this->error = '';
		$this->field = array();

		$this->pConnection = $pConnection;

		$this->param = pParameters($params);
		if (!isset($this->param['schema'])) {
			$this->param['schema'] = $pacrudConfig['appSchema'];
		}
		
		if (isset($this->param['objname'])) {
			$this->name = $this->param['objname'];
		}
		else {
			$this->name = '';
		}
		
		$this->strParams = $params;
	}
	
	public function getObjName() {
		if (!isset($this->name) or $this->name == '') {
			$className = get_class($this);
			$instance = array();
			foreach ($GLOBALS as $key => $value) {
				if (is_object($value) and get_class($value) == $className) {
					$instance[] = $key;
				}
			}
			$this->name = $instance[count($instance)-1];
		}
		return $this->name;
	}
	
	public function fieldCount() {
		return count($this->field);
	}
	
	public function addField($params) {
		$this->getObjName();
	
		$param = pParameters($params);
		$name = $param['name'];
		if (isset($param['label']))
			$label = $param['label'];
		else
			$label = $param['name'];
			
		if (isset($param['size']))
			$size = $param['size'];
		else
			$size = null;
			
		if (isset($param['default']))
			$default = $param['default'];
		else
			$default = null;
			
		if (isset($param['type']))
			$type = $param['type'];
		else
			$type = 'string';
		
		if (!isset($param['notnull'])) {
			$notNull = false;
		}
		else {
			if ($param['notnull'] == 'true') {
				$notNull = true;
			}
			else {
				$notNull = false;
			}
		}
		
		if (!isset($param['visible'])) {
			$visible = true;
		}
		else {
			if ($param['visible'] == 'false') {
				$visible = false;
			}
			else {
				$visible = true;
			}
		}
		
		$field = array(
		            'name' => $name,
		            'label' => $label,
		            'size' => $size,
		            'default' => $default,
		            'type' => $type,
		            'notnull' => $notNull,
		            'visible' => $visible,
		            'strParams' => $params
		         );
		
		if (isset($param['search'])) {
			$field['search'] = $param['search'];
		}
		
		$this->field[] = $field;
		
		return $field;
	}
	
	function fieldByName($name) {
		for ($i=0; $i < $this->fieldCount(); $i++) {
			if ($this->field[$i]['name'] == $name) {
				return $this->field[$i];
			}
		}
		return null;
	}
}
