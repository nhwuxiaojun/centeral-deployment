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

class pacrudQueueSet {
	private $name;
	
	private $pQueueName;
	private $pQueueLabel;
	private $pQueueFilename;
	private $pQueueType;
	
	public $indent;
	public $classBt;
	public $classBtFocus;
	
	function __construct($objName='') {
		$this->name = $objName;
		$this->pQueueName = array();
		$this->pQueueLabel = array();
		$this->pQueueFilename = array();
		$this->pQueueType = array();
		$this->indent = '';
		$this->classBt = 'pQueueSetBt';
		$this->classBtFocus = 'pQueueSetBtFocus';
	}
	
	private function getObjName() {
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
	
	private function getLastQueue() {
		$className = 'pacrudQueue';
		$instance = array();
		foreach ($GLOBALS as $key => $value) {
			if (is_object($value) and get_class($value) == $className) {
				$instance[] = $key;
			}
		}		
		$lastQueue = $instance[count($instance)-1];
		return $lastQueue;
	}
	
	public function addQueue($pQueueName,$pQueueLabel,$pQueueFilename='') {
		$this->pQueueName[] = $pQueueName;
		$this->pQueueLabel[] = $pQueueLabel;
		$this->pQueueFilename[] = $pQueueFilename;
		$this->pQueueType[] = 'pacrudQueue';
	}
	
	public function addTab($pQueueName,$pQueueLabel,$pQueueFilename='') {
		$this->pQueueName[] = $pQueueName;
		$this->pQueueLabel[] = $pQueueLabel;
		$this->pQueueFilename[] = $pQueueFilename;
		$this->pQueueType[] = 'tab';
	}
	
	public function makeHtml() {
		$indent = $this->indent;
		echo $indent.'<fieldset class="pQueueSet">'."\n";
		
		// adiciona os botões
		echo $indent.'<legend>';
		for ($i=0; $i < count($this->pQueueLabel); $i++) {
			echo "\n";
			$onclick = $this->pQueueName[$i].'.lineClick(0)';
			if ($this->pQueueType[$i] == 'pacrudQueue') {
				echo '<button class="pQueueSetBt" id="'.$this->getObjName().'_bt_'.$this->pQueueName[$i].'" onclick="'.$onclick.'" onmouseover="'.$this->getObjName().'BtMouseover'.$i.'()">'.$this->pQueueLabel[$i].'</button>';
			}
			if ($this->pQueueType[$i] == 'tab') {
				echo '<button class="pQueueSetBt" id="'.$this->getObjName().'_bt_'.$this->pQueueName[$i].'" onmouseover="'.$this->getObjName().'BtMouseover'.$i.'()">'.$this->pQueueLabel[$i].'</button>';
			}
			if ($i < count($this->pQueueLabel)-1) {
				echo ' ';
			}
		}
		echo '</legend>'."\n";
		
		// inicializa os objetos queue
		for ($i=0; $i < count($this->pQueueFilename); $i++) {
			if ($this->pQueueType[$i] == 'pacrudQueue') {
				$pQueue = $this->pQueueName[$i];
				global $$pQueue;
				require($this->pQueueFilename[$i]);
			
				if ($i > 0) {
					echo $indent.'<script type="text/javascript">'."\n";		
					echo $indent.'	document.getElementById(\'div_'.$this->pQueueName[$i].'\').style.display = \'none\';'."\n";
					echo $indent.'</script>'."\n";
				}
			}
			if ($this->pQueueType[$i] == 'tab') {
				echo '<div id="div_'.$this->pQueueName[$i].'"></div>'."\n";
			}
		}
		
		echo $indent.'</fieldset>'."\n";
		
		// adiciona javascript que coloca a quantidade de itens da fila no label
		echo $indent.'<script type="text/javascript">'."\n";
		for ($i=0; $i < count($this->pQueueName); $i++) {
			if ($this->pQueueType[$i] == 'pacrudQueue') {
				echo $indent.'	'.$this->pQueueName[$i].'.afterList = function() {'."\n";
				echo $indent.'		if (this.pGridNavigation.count == 0) {'."\n";
				echo $indent.'			document.getElementById(\''.$this->getObjName().'_bt_'.$this->pQueueName[$i].'\').innerHTML = \''.$this->pQueueLabel[$i].'\';'."\n";
				echo $indent.'		}'."\n";
				echo $indent.'		else {'."\n";
				echo $indent.'			document.getElementById(\''.$this->getObjName().'_bt_'.$this->pQueueName[$i].'\').innerHTML = \''.$this->pQueueLabel[$i].' (\'+this.pGridNavigation.count+\')\';'."\n";
				echo $indent.'		}'."\n";
				echo $indent.'	}'."\n";
				echo $indent."\n";
			}
			
			echo $indent.'	function '.$this->getObjName().'BtMouseover'.$i.'() {'."\n";
			for ($j=0; $j < count($this->pQueueName); $j++) {
				if ($j == $i) {
					echo $indent.'		document.getElementById(\''.$this->getObjName().'_bt_'.$this->pQueueName[$j].'\').style.fontWeight = \'bold\';'."\n";
					echo $indent.'		document.getElementById(\'div_'.$this->pQueueName[$j].'\').style.display = \'block\';'."\n";
				}
				else {
					echo $indent.'		document.getElementById(\''.$this->getObjName().'_bt_'.$this->pQueueName[$j].'\').style.fontWeight = \'normal\';'."\n";
					echo $indent.'		document.getElementById(\'div_'.$this->pQueueName[$j].'\').style.display = \'none\';'."\n";
				}
			}
			if ($this->pQueueType[$i] == 'pacrudQueue') {
				echo $indent.'		'.$this->pQueueName[$i].'.pFilter.focus();'."\n";
			}
			echo $indent.'	}'."\n";
			echo $indent."\n";
		}
		echo $indent.'</script>'."\n";
	}
	
	public function goSearchAll() {
		$indent = $this->indent;
		echo $indent.'<script type="text/javascript">'."\n";
		for ($i=0; $i < count($this->pQueueName); $i++) {
			if ($this->pQueueType[$i] == 'pacrudQueue') {
				echo $indent.$this->pQueueName[$i].'.goSearch();	'."\n";
			}
		}
		echo $indent.'</script>'."\n";
	}
}
