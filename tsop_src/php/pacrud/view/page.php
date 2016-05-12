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

$pHtmlPreLayout = file_get_contents(pGetTheme('layout.php',false));

// barra de cabeçalho
$pHtmlHeaderShortcuts = '<a href="index.php"><img src="'.pGetTheme('icons/home.png',true).'" alt="home" /> '._('Início').'</a>';
$pHtmlPreLayout = str_replace(':shortcuts:',$pHtmlHeaderShortcuts,$pHtmlPreLayout);

$pHtmlHeaderLogoff = '<a href="index.php?action=logoff">'._('sair').'</a>';
$pHtmlPreLayout = str_replace(':logoff:',$pHtmlHeaderLogoff,$pHtmlPreLayout);

$pHtmlPreLayout = str_replace(':appIdent:',$pacrudConfig['appIdent'],$pHtmlPreLayout);
$pHtmlPreLayout = str_replace(':appName:',$pacrudConfig['appName'],$pHtmlPreLayout);
$pHtmlPreLayout = str_replace(':fullName:',$pacrudGlobal['currentFullName'],$pHtmlPreLayout);


// menu
require_once('../controller/connection_admin.php');
$pMenu = new pacrudMenu('pMenu','');
$pMenu->indentation = '			';
$pHtmlMenu  = $pMenu->draw(false);
$pacrudLogo  = '		<div class="pacrudLogo">'."\n";
$pacrudLogo .= '			<a href="http://www.pacrud.com.br">';
$pacrudLogo .= '<img src="'.$pacrudConfig['pacrudWebPath'].'/view/images/logo_small.png" alt="paCRUD" />';
$pacrudLogo .= '</a>'."\n";
$pacrudLogo .= '		</div>'."\n";
if ($pacrudConfig['showPacrudLogo'] == 't') {
	$pHtmlMenu .= $pacrudLogo;
}
$pHtmlPreLayout = str_replace(':menu:',$pHtmlMenu,$pHtmlPreLayout);

//rodape
$pHtmlFooter  = '	<a href="index.php">'._('Início').'</a>';
$pHtmlFooter .= ' : : <a href="index.php?page=pacrud_changePassword">'._('Alterar Senha').'</a>'."\n";
$pHtmlFooter .= ' : : <a href="index.php?action=logoff">'._('Sair').'</a>'."\n";
$pHtmlPreLayout = str_replace(':footer:',$pHtmlFooter,$pHtmlPreLayout);

//inicia a mostrar o conteudo
$pArrHtmlLayout = explode(':desktop:',$pHtmlPreLayout);
echo $pArrHtmlLayout[0];

//inclusao do desktop
if (isset($_GET['page']) && $pacrudPages[$_GET['page']]) {
	$pPage = $pacrudPages[$_GET['page']];
}
else {
	if (file_exists($pacrudConfig['appPath'].'/desktop.php')) {
		$pPage = $pacrudConfig['appPath'].'/desktop.php';
	}
	else {
		$pPage = $pacrudConfig['pacrudPath'].'/view/submission.php';
	}
}
include($pPage);

//conteúdo após a inclusao
echo $pArrHtmlLayout[1];
