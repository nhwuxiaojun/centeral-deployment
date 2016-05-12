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

require_once('pacrud.php');
pProtect('pacrud_groups');

require_once($pacrudConfig['pacrudPath'].'/controller/groups.php');
require_once($pacrudConfig['pacrudPath'].'/controller/groups_syslogin.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_users.php');
?>

<fieldset>
<legend><?php echo _('Grupos de Usuários'); ?></legend>

<div id="crudGroups_form">
	<br />
	<table class="pacrudFormTable">
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Nome do grupo'); ?>:</td>
			<td class="pacrudFormFields"><input id="groupname" type="text" size="45" autofocus="autofocus" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"></td>
			<td class="pacrudFormFields"><input id="enabled" type="checkbox" checked="checked" /> <?php echo _('Ativo'); ?></td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"></td>
			<td class="pacrudFormFields"><?php $crudGroups->drawControls(); ?></td>
		</tr>
	</table>
	
	<fieldset id="crudGroupsSyslogin_conteiner" style="display:none">
	<legend><?php echo _('Usuários que participam deste grupo'); ?></legend>
		<div id="crudGroupsSyslogin_form" style="display:none">
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Usuário'); ?>:</td>
					<td class="pacrudFormFields"><input id="username" type="text" size="45" /><?php $searchUsers->makeButton(); ?>*</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"></td>
					<td class="pacrudFormFields"><?php $crudGroupsSyslogin->drawControls(); ?></td>
				</tr>
			</table>
		</div>
		<?php $crudGroupsSyslogin->drawCrudList(); ?>
	</fieldset>
	<br />
	* <?php echo _('campos de preenchimento obrigatório'); ?>
</div>

<?php 
$crudGroups->drawCrudList(); 
$searchUsers->addFieldReturn('username','username');
$searchUsers->crudState('crudGroupsSyslogin');

?>

</fieldset>
