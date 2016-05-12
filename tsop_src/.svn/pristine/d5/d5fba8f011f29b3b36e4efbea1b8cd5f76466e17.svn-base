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
pProtect('pacrud_users');

require_once($pacrudConfig['pacrudPath'].'/controller/users.php');
require_once($pacrudConfig['pacrudPath'].'/controller/syslogin_groups.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_groups.php');
?>

<fieldset>
<legend><?php echo _('Usuários'); ?></legend>
<div id="crudUsers_form">
	<br />
	<table class="pacrudFormTable">
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Usuário'); ?>:</td>
			<td class="pacrudFormFields"><input id="username" type="text" size="45" autofocus="autofocus" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Nome completo'); ?>:</td>
			<td class="pacrudFormFields"><input id="fullname" type="text" size="45" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"></td>
			<td class="pacrudFormFields"><input id="enabled" type="checkbox" checked="checked" /> <?php echo _('Ativo'); ?></td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"></td>
			<td class="pacrudFormFields"><?php $crudUsers->drawControls(); ?></td>
		</tr>
	</table>
	
	<fieldset id="crudSysloginGroups_conteiner" style="display:none">
	<legend><?php echo _('Grupos que este usuário participa'); ?></legend>
		<div id="crudSysloginGroups_form" style="display:none">
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Grupo'); ?>:</td>
					<td class="pacrudFormFields"><input id="groupname" type="text" size="45" /><?php $searchGroups->makeButton(); ?>*</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"></td>
					<td class="pacrudFormFields"><?php $crudSysloginGroups->drawControls(); ?></td>
				</tr>
			</table>
		</div>
		<?php $crudSysloginGroups->drawCrudList(); ?>
	</fieldset>
	<br />
	* <?php echo _('campos de preenchimento obrigatório'); ?>
</div>

<?php
$crudUsers->drawCrudList();
$searchGroups->addFieldReturn('groupname','groupname');
$searchGroups->crudState('crudSysloginGroups');
?>

</fieldset>
