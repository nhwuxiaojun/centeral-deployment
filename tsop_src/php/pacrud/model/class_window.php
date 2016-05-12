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

class pacrudWindow {
	private $objName;
	public $indentation;
	
	// client property
	public $width;
	public $title;
	public $align;
	public $vAlign;
	
	public $commandClose;
	
	function __construct($objName='') {
		global $pacrudConfig;
		require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_window.php');		
		$this->objName     = $objName;
		$this->width       = 730;
		$this->title       = 'pacrudWindow';
		$this->align       = 'center';
		$this->vAlign      = 'middle';
		$this->indentation = '';
	}
	
	public function getObjName() {
		if (!isset($this->objName) or $this->objName == '') {
			$className = get_class($this);
			$instance = array();
			foreach ($GLOBALS as $key => $value) {
				if (is_object($value) and get_class($value) == $className) {
					$instance[] = $key;
				}
			}
			$this->objName = $instance[count($instance)-1];
		}
		
		if ($this->commandClose == '') {
			$this->commandClose = $this->objName.'.hide()';
		}
		
		return $this->objName;
	}
	
	public function drawTop($verbose=true) {
		global $pacrudConfig;
		
		$this->getObjName();
		
		$pWindow  = $this->indentation . '<div class="pacrudVeil" id="'.$this->objName.'_veil"></div>'."\n";
		$pWindow .= $this->indentation . '<div class="pacrudWindow" id="'.$this->objName.'">'."\n";
		$pWindow .= $this->indentation . '	<div class="pacrudWindowTitle" id="'.$this->objName.'_titleBar">'."\n";
		$pWindow .= $this->indentation . '		<div class="pacrudWindowClose">'."\n";
		$pWindow .= $this->indentation . '			<a href="javascript:'.$this->commandClose.'">'."\n";
		$pWindow .= $this->indentation . '				<img src="'.$pacrudConfig['pacrudWebPath'].'/view/images/close.png" alt="[X]" />'."\n";
		$pWindow .= $this->indentation . '			</a>'."\n";
		$pWindow .= $this->indentation . '		</div>'."\n";
		$pWindow .= $this->indentation . '		<div id="'.$this->objName.'_title" class="pacrudWindowTitle" onmousedown="'.$this->objName.'.move()" onmouseup="'.$this->objName.'.dropMove()">titulo</div>'."\n";
		$pWindow .= $this->indentation . '		<div id="'.$this->objName.'_loading" class="pacrudWindowLoading"><img src="'.$pacrudConfig['pacrudWebPath'].'/view/images/loading.gif" alt="" /></div>'."\n";
		$pWindow .= $this->indentation . '	</div>'."\n";
		$pWindow .= $this->indentation . '	<div class="pacrudWindowBody">'."\n";
		
		if ($verbose) {
			echo $pWindow;
		}
		
		return $pWindow;
	}
	
	public function drawFooter($verbose=true) {
		$this->getObjName();
		
		$pWindow  = $this->indentation . '	</div>'."\n";
		$pWindow .= $this->indentation . '</div>'."\n";
		
		$pWindow .= $this->indentation . '<script type="text/javascript">'."\n";
		$pWindow .= $this->indentation . '	'.$this->objName.' = new pacrudWindow(\''.$this->objName.'\');'."\n";
		$pWindow .= $this->indentation . '	'.$this->objName.'.width = '.$this->width.';'."\n";
		$pWindow .= $this->indentation . '	'.$this->objName.'.title = \''.$this->title.'\';'."\n";
		$pWindow .= $this->indentation . '	'.$this->objName.'.align = \''.$this->align.'\';'."\n";
		$pWindow .= $this->indentation . '	'.$this->objName.'.vAlign = \''.$this->vAlign.'\';'."\n";		
		$pWindow .= $this->indentation . '</script>'."\n";
		
		if ($verbose) {
			echo $pWindow;
		}
		
		return $pWindow;
	}
	
	public function draw($verbose,$htmlContent) {
		$this->getObjName();
		
		$pWindow  = $this->drawTop(false);
		$pWindow .= $htmlContent."\n";
		$pWindow .= $this->drawFooter(false);
		
		if ($verbose) {
			echo $pWindow;
		}
		
		return $pWindow;
	}
}

