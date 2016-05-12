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

class pacrudGrid {
	private $name;
	private $lines;
	private $column;
	public $width;
	public $indentation;
	public $lineEventOnData;
	public $pointerCursorOnData;

	function __construct($name,$lines) {
		global $pacrudConfig;
		$this->name = $name;
		$this->lines = $lines;
		$column = array();
		$this->width = 0;
		$this->lineEventOnData = false;
		$this->pointerCursorOnData = '';
	}

	public function addColumn($params) {
		$param = pParameters($params);
		$name = $param['name'];
		if (isset($param['label']))
			$label = $param['label'];
		else
			$label = $param['name'];
			
		if (isset($param['labelalign']))
			$labelAlign = $param['labelalign'];
		else
			$labelAlign = 'center';
			
		if (isset($param['align']))
			$align = $param['align'];
		else
			$align = 'left';

		//visible - default true
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

		$this->column[] = array(
		                   	'name' => $name,
		                   	'label' => $label,
		                   	'labelalign' => $labelAlign,
		                   	'align' => $align,
							'visible' => $visible
		                   );
	}

	private function tableGridHeader() {
		return "\n".$this->indentation.'<table id="pGrid_'.$this->name.'" class="pacrudGridTable">'."\n";
	}

	private function tableClose() {
		return $this->indentation.'</table>'."\n";
	}

	private function dataHeader() {
		$header  = $this->indentation.'	<tr class="pacrudGridTh">'."\n";
		for ($i=0; $i < count($this->column); $i++) {
			if ($this->column[$i]['visible'] != false) {
				$header .= $this->indentation.'		<th class="pacrudGridTh" style="text-align:'.$this->column[$i]['labelalign']
				                                                          .'">'.$this->column[$i]['label'].'</th>'."\n";
			}
		}
		$header .= $this->indentation.'	</tr>'."\n";

		return $header;
	}

	private function line($index) {
		if (is_int($index/2)) {
			$line  = $this->indentation.'	<tr class="pacrudGridTrEven">'."\n";
		}
		else {
			$line  = $this->indentation.'	<tr class="pacrudGridTrOdd">'."\n";
		}

		for ($i=0; $i < count($this->column); $i++) {
			if ($this->column[$i]['visible'] != false) {
				$line .= $this->indentation.'		<td class="pacrudGridTd" style="text-align:'.$this->column[$i]['align']
    	                                                                                          .'"><br /></td>'."\n";
			}
		}
		$line .= $this->indentation.'	</tr>'."\n";

		return $line;
	}

	private function lines() {	
		$lines = '';
		for ($i = 0; $i < $this->lines; $i++) {
			$lines .= $this->line($i);
		}

		return $lines;
	}

	private function clientObject() {
		$client  = $this->indentation.'<script type="text/javascript">'."\n";
		$client .= $this->indentation.'	pGrid_'.$this->name.' = new pacrudGrid(\'pGrid_'.$this->name.'\');'."\n";
		$client .= $this->indentation.'	pGrid_'.$this->name.'.lines = '.$this->lines.';'."\n";
		$client .= $this->indentation.'</script>'."\n";
		return $client;
	}

	public function draw($verbose) {
		global $pacrudConfig;
		require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_grid.php');

		$pacrudSearch  = $this->tableGridHeader();
		$pacrudSearch .= $this->dataHeader();
		$pacrudSearch .= $this->lines();
		$pacrudSearch .= $this->tableClose();
		$pacrudSearch .= $this->clientObject();

		if ($verbose) {
			echo $pacrudSearch;
		}

		return $pacrudSearch;
	}
}
