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
pProtect('pacrud_reg_menu');

require_once($pacrudConfig['pacrudPath'].'/controller/reg_menu.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_menus.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_routines.php');

$image = pFileLocal2Web(pListFiles(dirname($_SERVER["SCRIPT_FILENAME"]),'(\.(png|jpg|jpeg|gif))','(\.(svn|git|md))'));
$datalistIcons = '<datalist id="list_icon">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/example.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/exclamation.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/key.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/system.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/users.png">'."\n";
for ($i=0; $i < count($image); $i++) {
	$datalistIcons .= '				  <option value="'.$image[$i].'">'."\n";
}
$datalistIcons .= '				</datalist>'."\n";
?>

<fieldset id="crudRegMenu_conteiner" style="display:block">
<legend>Configuração de Menu</legend>
<div id="crudRegMenu_form">
	<br />
	<table class="pacrudFormTable">
		<tr>
			<td class="pacrudFormLabel">Código:</td>
			<td class="pacrudFormFields" colspan="2"><input id="cod" type="text" size="5" disabled="disabled" /></td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><?php echo _('Menu Pai'); ?>:</td>
			<td class="pacrudFormFields" colspan="2"><input id="parent" type="text" size="5" /> <input id="parent_name" type="text" size="32" /> <?php $searchMenus->makeButton(); ?></td>
		</tr>
		<tr>
			<td class="pacrudFormLabel">Rótulo:</td>
			<td class="pacrudFormFields" colspan="2"><input id="caption" type="text" size="45" />*</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel">Rotina:</td>
			<td class="pacrudFormFields" colspan="2"><input id="routine" type="text" size="45" /> <?php $searchRoutines->makeButton(); ?>*</td>
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
			<td class="pacrudFormLabel"><br /></td>
			<td class="pacrudFormFields" colspan="2"><input id="opened" type="checkbox" checked="checked" />Aberto *</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><br /></td>
			<td class="pacrudFormFields" colspan="2"><input id="enabled" type="checkbox" checked="checked" />Ativado *</td>
		</tr>
		<tr>
			<td class="pacrudFormLabel"><br /></td>
			<td class="pacrudFormFields" colspan="2">
				<?php $crudRegMenu->drawControls(); ?>
			</td>
		</tr>
	</table>
	<br />
	* <?php echo _('campos de preenchimento obrigatório'); ?>
</div>

<?php $crudRegMenu->drawCrudList(); ?>

</fieldset>

<script type="text/javascript">
	function iconChange() {
		var icon = document.getElementById('icon').value;
		var iconExample = document.getElementById('icon_example');
		iconExample.src = '<?php echo $pacrudConfig['pacrudWebPath']; ?>/' + icon;
		if (icon == '') {
			iconExample.style.display = 'none';
		}
		else {
			iconExample.style.display = 'block';
		}
	}
	
	crudRegMenu.onStateChange = function() {
		if (this.state == 'view') {
			iconChange();
		}
	}
</script>

<?php
$searchMenus->addFieldReturn('cod','parent');
$searchMenus->addFieldReturn('tree','parent_name');
$searchMenus->crudState('crudRegMenu');

$searchRoutines->addFieldReturn('routine','routine');
$searchRoutines->crudState('crudRegMenu');
