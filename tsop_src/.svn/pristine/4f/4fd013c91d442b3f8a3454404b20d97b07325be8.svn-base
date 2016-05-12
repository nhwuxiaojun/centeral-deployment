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
pProtect('pacrud_routines');

require_once($pacrudConfig['pacrudPath'].'/controller/routines.php');
require_once($pacrudConfig['pacrudPath'].'/controller/routines_groups.php');
require_once($pacrudConfig['pacrudPath'].'/controller/routines_menus.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_groups.php');
require_once($pacrudConfig['pacrudPath'].'/controller/search_menus.php');

$image = pFileLocal2Web(pListFiles(dirname($_SERVER["SCRIPT_FILENAME"]),'(\.(png|jpg|jpeg|gif))','(\.(svn|git|md))'));
$datalistIcons = '<datalist id="list_icon">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/example.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/exclamation.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/key.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/system.png">'."\n";
$datalistIcons .= '				  <option value="view/images/icons/users.png">'."\n";
for ($i=0; $i < count($image); $i++) {
	$datalistIcons .= '				  <option value="app/'.$image[$i].'">'."\n";
}
$datalistIcons .= '				</datalist>'."\n";
?>

<fieldset>
<legend><?php echo _('Rotinas, permissões e menus'); ?></legend>

	<div id="crudRoutines_form">
		<br />
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Identificação'); ?>:</td>
				<td class="pacrudFormFields"><input id="routine" type="text" size="45" autofocus="autofocus" />* (<?php echo _('Não usar espaços') ?>)</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Link'); ?>:</td>
				<td class="pacrudFormFields"><input id="link" type="text" size="45" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Descrição'); ?>:</td>
				<td class="pacrudFormFields"><input id="description" type="text" size="45" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><input id="enabled" type="checkbox" checked="checked" /> <?php echo _('Ativo'); ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields"><?php $crudRoutines->drawControls(); ?></td>
			</tr>
		</table>
		<?php include($pacrudConfig['pacrudPath'].'/view/tab_routines.php'); ?>
		
		<br />
		* <?php echo _('campos de preenchimento obrigatório'); ?>
	</div>

	<?php 
	$crudRoutines->drawCrudList();
	
	$searchGroups->addFieldReturn('groupname','groupname');
	$searchGroups->crudState('crudRoutinesGroups');
	
	$searchMenus->addFieldReturn('cod','parent');
	$searchMenus->addFieldReturn('tree','parent_name');
	$searchMenus->crudState('crudRoutinesMenus');
	?>
</fieldset>

<script type="text/javascript">
	crudRoutines.onStateChange = function() {
		if (crudRoutines.state == 'view') {
			pTabRoutines.showTab('groups');
		}
		else {
			pTabRoutines.hide();
		}
	}
	
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
	
	crudRoutinesMenus.onStateChange = function() {
		if (this.state == 'view') {
			iconChange();
		}
	}
</script>
