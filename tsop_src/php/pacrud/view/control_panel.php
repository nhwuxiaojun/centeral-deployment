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
require_once('../controller/inc_js_ajax.php');
pProtect('pacrud_controlPanel');

function listThemes() {
	global $pacrudConfig;
	
	$pacrudThemes = scandir($pacrudConfig['pacrudPath'].'/themes');
	
	$themes = array();
	for ($i=0; $i<count($pacrudThemes); $i++) {
		$themePath = $pacrudConfig['pacrudPath'].'/themes/'.$pacrudThemes[$i];
		if (is_dir($themePath)) {
			if ($pacrudThemes[$i] != '.' and $pacrudThemes[$i] != '..' and $pacrudThemes[$i] != '.svn') {
				$themes[] = $pacrudThemes[$i];
			}
		}
	}
	return $themes;
}

$pacrudThemes = listThemes();

$inputTheme  = '<select id="theme">'."\n";

for ($i=0; $i < count($pacrudThemes); $i++) {

	if ($pacrudConfig['theme'] == $pacrudThemes[$i]) {
		$inputTheme .= '						<option value="'.$pacrudThemes[$i].'" selected>'.$pacrudThemes[$i].'</option>'."\n";
	}
	else {
		$inputTheme .= '						<option value="'.$pacrudThemes[$i].'">'.$pacrudThemes[$i].'</option>'."\n";
	}

}
$inputTheme .= '					</select>'."\n";

?>

<fieldset>
<legend><?php echo _('Painel de Controle'); ?></legend>
	<br />
	<div style="display:table; width:100%">
		<div style="display:table-row">
			<div style="display:table-cell; width:50%">
				<table class="pacrudFormTable">
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields"><b><?php echo _('CONFIGURAÇÕES DA APLICAÇÃO'); ?></b></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">appIdent:</td>
						<td class="pacrudFormFields"><input id="appIdent" type="text" value="<?php echo $pacrudConfig['appIdent'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">appName:</td>
						<td class="pacrudFormFields"><input id="appName" type="text" value="<?php echo $pacrudConfig['appName'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields"><br /><b><?php echo _('CONFIGURAÇÕES DO FRAMEWORK'); ?></b></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">language:</td>
						<td class="pacrudFormFields"><input id="language" type="text" value="<?php echo $pacrudConfig['language'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">locale:</td>
						<td class="pacrudFormFields"><input id="locale" type="text" value="<?php echo $pacrudConfig['locale'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">theme:</td>
						<td class="pacrudFormFields">
							<?php echo $inputTheme; echo ' <a href="https://sourceforge.net/projects/pacrud/files/temas/" target="_blank">'._('Mais temas').'...</a>' ?> 
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">searchLines:</td>
						<td class="pacrudFormFields"><input id="searchLines" type="number" value="<?php echo $pacrudConfig['searchLines'] ?>" size="5" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['showPacrudLogo'] == 't') {
								echo '		<input id="showPacrudLogo" type="checkbox" checked="checked" /> showPacrudLogo'."\n";
							}
							else {
								echo '		<input id="showPacrudLogo" type="checkbox" /> showPacrudLogo'."\n";
							}
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logInsert_pacrud'] == 't') {
								echo '		<input id="logInsert_pacrud" type="checkbox" checked="checked" /> logInsert_pacrud'."\n";
							}
							else {
								echo '		<input id="logInsert_pacrud" type="checkbox" /> logInsert_pacrud'."\n";
							}
							echo '('._('BD do Framework').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logSelect_pacrud'] == 't') {
								echo '		<input id="logSelect_pacrud" type="checkbox" checked="checked" /> logSelect_pacrud'."\n";
							}
							else {
								echo '		<input id="logSelect_pacrud" type="checkbox" /> logSelect_pacrud'."\n";
							}
							echo '('._('BD do Framework').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logUpdate_pacrud'] == 't') {
								echo '		<input id="logUpdate_pacrud" type="checkbox" checked="checked" /> logUpdate_pacrud'."\n";
							}
							else {
								echo '		<input id="logUpdate_pacrud" type="checkbox" /> logUpdate_pacrud'."\n";
							}
							echo '('._('BD do Framework').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logDelete_pacrud'] == 't') {
								echo '		<input id="logDelete_pacrud" type="checkbox" checked="checked" /> logDelete_pacrud'."\n";
							}
							else {
								echo '		<input id="logDelete_pacrud" type="checkbox" /> logDelete_pacrud'."\n";
							}
							echo '('._('BD do Framework').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">commandPacrudUpdate:</td>
						<td class="pacrudFormFields"><input id="commandPacrudUpdate" type="text" value="<?php echo $pacrudConfig['commandPacrudUpdate'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">commandAppUpdate:</td>
						<td class="pacrudFormFields"><input id="commandAppUpdate" type="text" value="<?php echo $pacrudConfig['commandAppUpdate'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormLabel"><br /></td>
					</tr>
				</table>
	
			</div>
			<div style="display:table-cell">
				<!-- lado direito -->
				<table class="pacrudFormTable">
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields"><b><?php echo _('BANCO DE DADOS DA APLICAÇÃO'); ?></b></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">sgdb:</td>
						<td class="pacrudFormFields">
							<select name="sgdb" id="sgdb">
								<option <?php if ($pacrudConfig['sgdb'] == 'pgsql') echo 'selected '; ?>value="pgsql">pgsql</option>
								<!-- <option <?php if ($pacrudConfig['sgdb'] == 'mariadb') echo 'selected '; ?>value="mariadb">mariadb</option> -->
							</select>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbHost:</td>
						<td class="pacrudFormFields"><input id="dbHost" type="text" value="<?php echo $pacrudConfig['dbHost'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbPort:</td>
						<td class="pacrudFormFields"><input id="dbPort" id="dbPort" type="text" value="<?php echo $pacrudConfig['dbPort'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbName:</td>
						<td class="pacrudFormFields"><input id="dbName" type="text" value="<?php echo $pacrudConfig['dbName'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbUserName:</td>
						<td class="pacrudFormFields"><input id="dbUserName" type="text" value="<?php echo $pacrudConfig['dbUserName'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbPassword:</td>
						<td class="pacrudFormFields"><input id="dbPassword" type="password" value="<?php echo $pacrudConfig['dbPassword'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">dbEncoding:</td>
						<td class="pacrudFormFields"><input id="dbEncoding" type="text" value="<?php echo $pacrudConfig['dbEncoding'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel">appSchema:</td>
						<td class="pacrudFormFields"><input id="appSchema" type="text" value="<?php echo $pacrudConfig['appSchema'] ?>" size="30" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logInsert'] == 't') {
								echo '		<input id="logInsert" type="checkbox" checked="checked" /> logInsert'."\n";
							}
							else {
								echo '		<input id="logInsert" type="checkbox" /> logInsert'."\n";
							}
							echo '('._('BD da Aplicação').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logSelect'] == 't') {
								echo '		<input id="logSelect" type="checkbox" checked="checked" /> logSelect'."\n";
							}
							else {
								echo '		<input id="logSelect" type="checkbox" /> logSelect'."\n";
							}
							echo '('._('BD da Aplicação').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logUpdate'] == 't') {
								echo '		<input id="logUpdate" type="checkbox" checked="checked" /> logUpdate'."\n";
							}
							else {
								echo '		<input id="logUpdate" type="checkbox" /> logUpdate'."\n";
							}
							echo '('._('BD da Aplicação').')';
							?>
						</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><br /></td>
						<td class="pacrudFormFields">
							<?php
							if ($pacrudConfig['logDelete'] == 't') {
								echo '		<input id="logDelete" type="checkbox" checked="checked" /> logDelete'."\n";
							}
							else {
								echo '		<input id="logDelete" type="checkbox" /> logDelete'."\n";
							}
							echo '('._('BD da Aplicação').')';
							?>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div style="text-align:center; width:100%; margin: auto;"><button onclick="writeConfig()">Gravar Configurações</button></div>
	<br />
</fieldset>

<script type="text/javascript" src="<?php echo $pacrudConfig['pacrudWebPath'] ?>/view/control_panel.js"></script>

