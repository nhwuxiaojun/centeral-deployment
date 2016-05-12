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

function pacrudinfo() {
	global $pacrudConfig;
	global $pacrudPages;
	global $pacrudVersion;
	global $pacrudGlobal;
	
	echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'."\n";
	echo '<html xmlns="http://www.w3.org/1999/xhtml" lang="pt_br" xml:lang="pt_br">'."\n";
	echo '<head>'."\n";
	echo '	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'."\n";
	echo '	<title>pacrudinfo()</title><meta name="ROBOTS" content="NOINDEX,NOFOLLOW,NOARCHIVE" />'."\n";
	echo '	<link type="text/css" rel="stylesheet" media="screen" href="'.$pacrudConfig['pacrudWebPath'].'/view/pacrud_info.css" />'."\n";
	echo '</head>'."\n";
	echo '<body>'."\n";
	echo '<div class="center">'."\n";
	echo '<table border="0" width="600">'."\n";
	echo '	<tr class="h">'."\n";
	echo '		<td>'."\n";
	echo '			<a href="http://www.pacrud.com.br/">'."\n";
	echo '				<img border="0" src="'.$pacrudConfig['pacrudWebPath'].'/view/images/logo_small.png" alt="paCRUD Logo" />'."\n";
	echo '			</a>'."\n";
	echo '		<h1 class="p">paCRUD Version: '.$pacrudVersion.'</h1></td>'."\n";
	echo '	</tr>'."\n";
	echo '</table>'."\n";
	echo '<br />'."\n";

	// pacrudConfig
	echo '<table border="0" cellpadding="3" width="600">'."\n";
	foreach($pacrudConfig as $param => $value) {
		if ($param == 'dbPassword' or $param == 'dbPassword_pacrud') {
			echo '<tr><td class="e">$pacrudConfig[\''.$param.'\']</td><td class="v">******</td></tr>'."\n";
		}
		else {
			echo '<tr><td class="e">$pacrudConfig[\''.$param.'\']</td><td class="v">'.$value.'</td></tr>'."\n";
		}
	}
	echo '</table>'."\n";

	echo '<br />'."\n";
	echo '<h2>pacrudPages</h2>'."\n";

	// pacrudPages
	echo '<table border="0" cellpadding="3" width="600">'."\n";
	echo '<tr class="h"><th>Page</th><th>File to include</th></tr>'."\n";
	foreach($pacrudPages as $param => $value) {
		echo '<tr><td class="e">$pacrudPage[\''.$param.'\']</td><td class="v">'.$value.'</td></tr>'."\n";
	}
	echo '</table>'."\n";
	
	echo '<br />'."\n";
	echo '<h2>pacrudGlobal</h2>'."\n";
	
	// pacrudGlobal
	echo '<table border="0" cellpadding="3" width="600">'."\n";
	foreach($pacrudGlobal as $param => $value) {
		echo '<tr><td class="e">$pacrudGlobal[\''.$param.'\']</td><td class="v">'.$value.'</td></tr>'."\n";
	}
	echo '</table>'."\n";
}
