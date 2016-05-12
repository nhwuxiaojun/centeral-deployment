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

$pTabRoutines = new pacrudTab('pTabRoutines');
$pTabRoutines->visible = false;
$pTabRoutines->addTab('groups',_('Permissões por grupo de usuário'));
$pTabRoutines->addTab('menus',_('Entradas no menu'));
$pTabRoutines->htmlOpen(true);

$pTabRoutines->htmlOpenTab(true,_('Permissões por grupo de usuário'));
?>
	<div id="crudRoutinesGroups_form" style="display:none">
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Grupo'); ?>:</td>
				<td class="pacrudFormFields"><input id="groupname" type="text" size="45" /><?php $searchGroups->makeButton(); ?>*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><input id="c" type="checkbox" checked="checked" /> <?php echo _('Inserir'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><input id="r" type="checkbox" checked="checked" /> <?php echo _('Visualizar'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><input id="u" type="checkbox" checked="checked" /> <?php echo _('Alterar'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><input id="d" type="checkbox" checked="checked" /> <?php echo _('Apagar'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><?php $crudRoutinesGroups->drawControls(); ?></td>
			</tr>
		</table>
	</div>
	<?php 
	$crudRoutinesGroups->drawCrudList();
	
	$pTabRoutines->htmlCloseTab(true);

	$pTabRoutines->htmlOpenTab(true,_('Entradas no menu'));
	
	?>
	<div id="crudRoutinesMenus_form">
		<input id="cod" type="hidden" />
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Menu Pai'); ?>:</td>
				<td class="pacrudFormFields" colspan="2"><input id="parent" type="text" size="5" /> <input id="parent_name" type="text" size="32" /> <?php $searchMenus->makeButton(); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Rótulo'); ?>:</td>
				<td class="pacrudFormFields" colspan="2"><input id="caption" type="text" size="45" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel">Ícone:</td>
				<td class="pacrudFormFields" colspan="2">
					<input id="icon" list="list_icon" type="text" size="45" onChange="iconChange()" />
					<?php echo $datalistIcons; ?>
				</td>
				<td style="text-align:left" width="30%"><img id="icon_example" src="" alt="_" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields" colspan="2"><input id="opened" type="checkbox" checked="checked" /> <?php echo _('Aberto'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields" colspan="2"><input id="menuEnabled" type="checkbox" checked="checked" /> <?php echo _('Ativo'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields" colspan="2"><?php $crudRoutinesMenus->drawControls(); ?></td>
			</tr>
		</table>
	</div>
<?php
$crudRoutinesMenus->drawCrudList();

$pTabRoutines->htmlCloseTab(true);

$pTabRoutines->htmlClose(true);
