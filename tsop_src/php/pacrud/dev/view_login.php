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

include($pacrudConfig['pacrudPath'].'/view/header.php');

require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_md5.php');
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_ajax.php');
require_once($pacrudConfig['pacrudPath'].'/view/loading.php');
?>

<script type="text/javascript" src="view_login.js"></script>

<div class="pacrudLoginBackground">
	<br />
	<div><a href="../app/index.php"><?php echo _('Voltar para a tela inicial do Sistema'); ?></a></div>

	<br /><br /><br /><br />

	<span class="pacrudHeaderCenter">
		DEVTOOLS - <?php echo _('Ferramentas de desenvolvimento paCRUD'); ?><br />
		<?php echo $pacrudConfig['appIdent'].' - '.$pacrudConfig['appName']; ?></span>

	<div style="height:20px">&nbsp;</div>


	<fieldset class="pacrudLogin">
	<legend class="pacrudLoginLegend"><?php echo _('Autenticação'); ?></legend>
		<br />
		<table align="center">
			<tr>
				<td style="text-align:right"><?php echo _('Usuário'); ?></td>
				<td><input id="txtUsername" name="txtUsername" onkeydown="loginKeyDown(event)" type="text" size="25" autofocus="autofocus" /></td>
			</tr>
			<tr>
				<td style="text-align:right"><?php echo _('Senha'); ?></td>
				<td><input id="txtPassword" name="txtPassword" onkeydown="loginKeyDown(event)" type="password" size="25" /></td>
			</tr>
			<tr>
				<td><br /></td>
				<td style="text-align:left"><button onclick="goLogin()">Acessar</button></td>
			</tr>
		</table>
		<br />
	</fieldset>

	<div style="height:50px">&nbsp;</div>
	
	<div>
	<a href="http://www.pacrud.com.br"><img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo_small.png" alt="paCRUD" /></a>

	</div>

</div>

<?php
include($pacrudConfig['pacrudPath'].'/view/footer.php');

