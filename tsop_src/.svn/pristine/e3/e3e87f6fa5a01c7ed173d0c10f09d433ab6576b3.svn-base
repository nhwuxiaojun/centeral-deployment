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


class pacrudQueue extends pacrudSearch {
	private $orderby;
	
	protected function addWindow($pSearch) {
		$pQueue  = '<div id="div_'.$this->name.'">';
		$pQueue .= $pSearch;
		$pQueue .= '</div>';
		
		return $pQueue;
	}
	
	public function draw($verbose) {
		global $pacrudConfig;
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_queue.php');

		// junta os objetos
		$pSearchInit = $this->initClientObject();
		$pSearchChids = parent::makeFilters();
		$pSearchChids .= parent::makeGrid();
		$pSearchChids .= parent::makeGridNavigation();		
		$pSearchChids = $this->addWindow($pSearchChids);
		
		// muda o evento click
		$pQueue = "\n";
		$pQueue .= '<script type="text/javascript">'."\n";
		$pQueue .= '	pGrid_'.$this->name.'.lineEventOnData = \''.$this->name.'.lineClick(%)\';'."\n";
		$pQueue .= '</script>'."\n";

		$pSearch = $pSearchInit . $pSearchChids . $pQueue;
		if ($verbose) {
			echo $pSearch;
		}
		return $pSearch;
	}
	
	public function goSearch() {
		echo '<script type="text/javascript">'.$this->name.'.goSearch(1);</script>'."\n";
	}
	
	public function addFilter($field,$operator,$value,$visible) {
		if ($visible == false) {
			$booVisible = 'false';
		}
		else {
			$booVisible = 'true';
		}
		echo '<script type="text/javascript">'."\n";
		echo '	'.$this->name.'.pFilter.addFilter(null,\''.$field.'\',\''.$operator.'\',\''.$value.'\',\'\','.$booVisible.');'."\n";
		echo '	'.$this->name.'.pFilter.draw();'."\n";
		echo '</script>'."\n";
	}
	
	protected function initClientObject() {
		// trata o caminho do xmlFile (relativo e absoluto)
		if (substr($this->param['xmlfile'],0,1) == '/') {
			$ajaxFile = $this->param['xmlfile'];
		}
		else {
			$ajaxFile = $this->pacrudConfig['appWebPath'].'/'.$this->param['xmlfile'];
		}
		
		// instancia o objeto pacrudSearch no cliente
		$clientObject = $this->indentation. '<script type="text/javascript">'."\n";
		$clientObject .= $this->indentation. '	'.$this->name.' = new pacrudQueue(\''.$this->name.'\',\''.$ajaxFile.'\');'."\n";
		// repassa condicionalmente o pog debug para o objeto ajax
		if (isset($this->param['debug']) && $this->param['debug']) {
			$clientObject .= $this->indentation. '	'.$this->name.'.pAjax.debug = true;'."\n";
		}
		$clientObject .= $this->indentation. '</script>'."\n";
		return $clientObject;
	}
	
	public function addField($params) {
		parent::addField($params);
		
		$param = pParameters($params);
		if (!isset($this->param['priorityfield']) or $this->param['priorityfield'] == '') {
			$this->param['priorityfield'] = $param['name'];
		}
	}

	
	public function setOrderby($orderby) {
		$this->orderby = $orderby;
	}
	
	public function sqlOrderby() {
		$orderbyOut = '';
		if ($this->orderby == '') {
			$orderbyOut = ' ORDER BY ' .$this->param['priorityfield'];
		}
		else {
			$orderbyOut = ' ORDER BY ' .$this->param['priorityfield'] . ',' . $this->orderby;
		}
		return $orderbyOut;
	}
	
}
