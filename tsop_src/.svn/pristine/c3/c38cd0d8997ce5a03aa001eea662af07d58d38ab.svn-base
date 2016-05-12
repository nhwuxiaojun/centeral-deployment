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

class pacrudThemesView {
	public $pacrudPath;
	public $pacrudWebPath;
	public $action;
	
	function __construct() {
		$this->pacrudPath = substr($_SERVER['SCRIPT_FILENAME'],0,strlen($_SERVER['SCRIPT_FILENAME'])-18);
		$this->pacrudWebPath = substr($_SERVER['REQUEST_URI'],0,strlen($_SERVER['REQUEST_URI'])-18);

		if (isset($_POST['action'])) {
			$this->action = $_POST['action'];
		}
		else {
			$this->action = '';
		}
	}
	
	function themes() {
		// le o directory
		$pointer  = opendir($this->pacrudPath.'/themes');
		// monta os vetores com os itens encontrados na pasta
		while ($thisFile = readdir($pointer)) {
			if ($thisFile != '.' and $thisFile != '..' and $thisFile != '.svn') {
				$files[] = substr($thisFile,0,strlen($thisFile));
			}
		}
		sort($files);
		return $files;
	}
	
}

