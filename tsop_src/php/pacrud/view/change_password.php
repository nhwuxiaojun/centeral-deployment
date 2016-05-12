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

pProtect('pacrud_changePassword');

require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_ajax.php');
?>

<script>

	pAjaxChangePassword = new pacrudAjax('<?php echo $pacrudConfig['pacrudWebPath']; ?>/controller/change_password.php');
	pAjaxChangePassword.ajaxFormat = 'xml';
	pAjaxChangePassword.ajaxXmlOk = function() {
		alert(gettext('Senha alterada com sucesso!'));
		document.getElementById('password').value = '';
		document.getElementById('new_password').value = '';
		document.getElementById('new_password_confirm').value = '';
	}

	function goChangePassword() {
		var password = document.getElementById('password').value;
		var new_password = document.getElementById('new_password').value;
		var new_password_confirm = document.getElementById('new_password_confirm').value;
		
		if (new_password != new_password_confirm) {
			alert(gettext('As senhas não conferem.'));
		}
		else if (new_password == '') {
			alert(gettext('A nova senha não pode ficar em branco.'));
		}
		else {
			params = 'password='+password+'&new_password='+new_password;
			pAjaxChangePassword.goAjax(params);
		}
	}

</script>

<fieldset>
<legend><?php echo _('Alterar Senha'); ?></legend>
	<br />
	<table class="pacrudFormTable">
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Usuário'); ?>:</td>
			<td class="pacrudFormFields"><input id="username" type="text" size="30" value="<?php echo $pacrudGlobal['currentUser'] ?>" disabled="disabled" /></td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Senha Atual'); ?>:</td>
			<td class="pacrudFormFields"><input id="password" type="password" size="30" autofocus="autofocus" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Nova Senha'); ?>:</td>
			<td class="pacrudFormFields"><input id="new_password" type="password" size="30" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Repita a nova senha'); ?>:</td>
			<td class="pacrudFormFields"><input id="new_password_confirm" type="password" size="30" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"></td>
			<td class="pacrudFormFields"><button onclick="goChangePassword()"><?php echo _('Alterar Senha'); ?></button></td>
		</tr>
	</table>
	<br />
	* <?php echo _('campos de preenchimento obrigatório'); ?>
</fieldset>

