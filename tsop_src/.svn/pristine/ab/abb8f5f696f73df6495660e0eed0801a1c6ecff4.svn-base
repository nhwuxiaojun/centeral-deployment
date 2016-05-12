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

require_once('pacrud.php');
pProtect('pacrud_devtools');

require_once('../controller/inc_js_ajax.php');

$fileList = scandir($pacrudConfig['pacrudPath'].'/app/');
sort($fileList);
$dataList = '<datalist id="list_file">'."\n";
for ($i=0; $i < count($fileList); $i++) {
	if (substr($fileList[$i],0,5) == 'ctrl_') {
		$dataList .= '			<option value="'.$fileList[$i].'"></option>'."\n";
	}
}
$dataList .= '		</datalist>';
?>

<div id="div_debug" style="display:none">
	<table>
		<tr>
			<td>
				state:
				<br /><input type="text" id="state" value="" />
			</td>
			<td>
				lineIndex:
				<br /><input type="text" id="lineIndex" value="3" />
			</td>
			<td>
				session:
				<br /><input type="text" id="session" />
			</td>
			<td>
				objName:
				<br /><input type="text" id="objName" />
			</td>
			<td>
				lastKeyCode:
				<br /><input type="text" id="lastKeyCode" />
			</td>
		</tr>
	</table>
</div>

<fieldset>
<legend><?php echo _('Gerador de Código paCRUD Framework'); ?></legend>
<div style="padding:5px">
	
	<div style="float:left">
		Arquivo controller: <input id="file_name" type="text" size="30" list="list_file" onchange="txFileName_change()" />
		<?php echo $dataList; ?>
		<button id="bt_open" onclick="btOpen_click()">Abrir</button> 
		<button id="bt_save" onclick="btSalve_click()">Salvar</button>
	</div>
	
	<div style="text-align:right">
		<button onclick="code.btPacrud_click()" id="btPacrud">+paCRUD</button> 
		<button onclick="code.btPacrudSearch_click()" id="btPacrudSearch">+pacrudSearch</button> 
		<button onclick="code.btPacrudList_click()" id="btPacrudList" style="display:none">+pacrudList</button>
	</div>
	
	<div style="text-align:center">
		<textarea id="pacrud_code" wrap="off" style="font: 12px Courier New; height: 200px; width: 99%;" onchange="txPacrudCode_change()"></textarea>
	</div>
	
	<div id="div_pacrud" style="display:none">
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome do Objeto paCRUD');?>:</td>
				<td class="pacrudFormFields"><input id="pacrud_obj_name" type="text" size="40" onchange="code.writePacrud()" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Título da Janela');?> (title):</td>
				<td class="pacrudFormFields"><input id="pacrud_title" type="text" size="40" onchange="code.writePacrud()" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Schema da Tabela');?> (schema):</td>
				<td class="pacrudFormFields"><input id="pacrud_schema" type="text" size="40" onchange="code.writePacrud()" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome da Tabela');?> (tableName):</td>
				<td class="pacrudFormFields"><input id="pacrud_tablename" type="text" size="40" onchange="code.writePacrud()" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Rotina');?> (routine):</td>
				<td class="pacrudFormFields"><input id="pacrud_routine" type="text" size="40" onchange="code.writePacrud()" /><?php /*$searchRoutines->makeButton(); */ ?></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class=""><input id="pacrud_capslock" type="checkbox" onchange="code.writePacrud()" /><?php echo _('Tudo maiúsculo para todos os campos');?> (capsLock)</td>
			</tr>
		</table>
		
		<div id="div_pacrud_mais_opcoes" style="display:none">
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Tipo de Relacionamento'); ?></td>
					<td class="pacrudFormFields">
						<select id="pacrud_parent_type" onchange="code.writePacrud()">
							<option value=""></option>
							<option value="1x1">1x1</option>
							<option value="1xN">1xN</option>
						</select>
					</td>
				</tr>
			</table>
	
			<div id="crudObjCrud1x1_form" style="display:none;">
				<table class="pacrudFormTable">
					<tr>
						<td class="pacrudFormLabel"><?php echo _('Objeto pai Relacionamento 1x1');?>:</td>
						<td class="pacrudFormFields"><input id="pacrud_name_parent1x1" type="text" size="40" onchange="code.writePacrud()" /><?php /*$searchObjCrud1x1->makeButton();*/ ?> *</td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><?php echo _('Campo Condicional no Objeto Pai');?>:</td>
						<td class="pacrudFormFields"><input id="pacrud_parent_field_condition" type="text" size="40" onchange="code.writePacrud()" /></td>
					</tr>
					<tr>
						<td class="pacrudFormLabel"><?php echo _('Valor da Condição');?>:</td>
						<td class="pacrudFormFields"><input id="pacrud_condition_value" type="text" size="40" onchange="code.writePacrud()" /></td>
					</tr>
				</table>
			</div>
		
			<div id="crudObjCrud1xn_form" style="display:none;">
				<table class="pacrudFormTable">
					<tr>
						<td class="pacrudFormLabel"><?php echo _('Objeto pai Relacionamento 1xN');?>:</td>
						<td class="pacrudFormFields"><input id="pacrud_name_parent1xn" type="text" size="40" onchange="code.writePacrud()" /><?php /*$searchObjCrud1xn->makeButton();*/ ?> *</td>
					</tr>
				</table>
			</div>
	
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Qtd Linhas da Tabela');?> (pageLines):</td>
					<td class="pacrudFormFields"><input id="pacrud_pagelines" type="text" size="9" onchange="code.writePacrud()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Permissao Fixa');?> (permission):</td>
					<td class="pacrudFormFields"><input id="pacrud_permission" type="text" size="40" onchange="code.writePacrud()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Incluir arquivo de cabeçalho');?> (includeHead):</td>
					<td class="pacrudFormFields"><input id="pacrud_include_head" type="text" size="40" onchange="code.writePacrud()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Incluir arquivo de Rodapé');?> (includeFooter):</td>
					<td class="pacrudFormFields"><input id="pacrud_include_footer" type="text" size="40" onchange="code.writePacrud()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Ação ao duplicar registro');?> (onDuplicate):</td>
					<td class="pacrudFormFields">
						<select id="pacrud_onduplicate" onchange="code.writePacrud()">
							<option value=""></option>
							<option value="update">update</option>
						<option value="error">error</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_list" type="checkbox" checked="checked" onchange="code.writePacrud()" /><?php echo _('Possui Listagem');?> (list) </td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_drawform" type="checkbox" onchange="code.writePacrud()" /><?php echo _('Desenhar Formulário');?> (drawForm) </td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_autoclick" type="checkbox" onchange="code.writePacrud()" /><?php echo _('Auto Click');?> (autoclick) </td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_debug" type="checkbox" onchange="code.writePacrud()" /><?php echo _('Modo Depuração');?> (debug) </td>
				</tr>
			</table>
		</div>
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields">
					<button onclick="code.btPacrudOk_click()">OK</button> 
					<button onclick="code.btPacrudMaisOpcoes_click()" id="bt_pacrud_mais_opcoes">Mais Opções</button> 
				</td>
			</tr>
		</table>
	</div>
	
	<div id="div_pacrud_field" style="display:none">
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_field_pk" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Chave Primária');?> (pk) *</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome do campo');?> (name):</td>
				<td class="pacrudFormFields"><input id="pacrud_field_name" type="text" size="40" onchange="code.writePacrudField()" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Rótulo');?> (label):</td>
				<td class="pacrudFormFields"><input id="pacrud_field_label" type="text" size="40" onchange="code.writePacrudField()" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Tipo de dado');?> (type):</td>
				<td class="pacrudFormFields">
					<select id="pacrud_field_type" onchange="code.writePacrudField()">
						<option value="string"><?php echo _('texto'); ?></option>
						<option value="text"><?php echo _('texto longo'); ?></option>
						<option value="integer"><?php echo _('inteiro'); ?></option>
						<option value="serial"><?php echo _('inteiro auto incrementado'); ?></option>
						<option value="numeric"><?php echo _('numérico'); ?></option>
						<option value="date"><?php echo _('data'); ?></option>
						<option value="time"><?php echo _('hora'); ?></option>
						<option value="timestamp"><?php echo _('data e hora'); ?></option>
						<option value="boolean"><?php echo _('boleano'); ?></option>
					</select>*
				</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Tamanho');?> (size):</td>
				<td class="pacrudFormFields"><input id="pacrud_field_size" type="text" size="10" onchange="code.writePacrudField()" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_field_notnull" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Não pode ser nulo');?> (notNull)</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_field_visible" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Visível na listagem');?> (visible)</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_field_readonly" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Somente leitura');?> (readonly)</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_field_capslock" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Tudo maiúsculo para este campo');?> (capsLock)</td>
			</tr>
		</table>
		
		<div id="div_pacrud_field_mais_opcoes" style="display:none">
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('id html');?> (fieldId):</td>
					<td class="pacrudFormFields"><input id="pacrud_field_fieldid" type="text" size="40" onchange="code.writePacrudField()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Relação com pacrudSearch');?> (search):</td>
					<td class="pacrudFormFields"><input id="pacrud_field_search" type="text" size="40" onchange="code.writePacrudField()" /><?php /*$searchObjSearch->makeButton();*/ ?></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Ordenação');?> :</td>
					<td class="pacrudFormFields"><input id="pacrud_field_order" type="text" size="10" onchange="code.writePacrudField()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Valor padrão');?> (default):</td>
					<td class="pacrudFormFields"><input id="pacrud_field_default" type="text" size="40" onchange="code.writePacrudField()" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_field_virtual" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Campo Virtual (pertence a outra tabela)');?> (virtual)</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_field_nocreate" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Não participa do Create');?> (nocreate)</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_field_nohtml" type="checkbox" onchange="code.writePacrudField()" /><?php echo _('Não desenhar o campo na tela');?> (nohtml)</td>
				</tr>
			</table>
		</div>
		
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields">
					<button onclick="code.btPacrudFieldOk_click()">OK</button>
					<button onclick="code.btPacrudFieldMaisOpcoes_click()" id="bt_pacrud_field_mais_opcoes">Mais Opções</button> 
				</td>
			</tr>
		</table>
	</div>
	
	<div id="div_pacrud_search" style="display:none">
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome do Objeto'); ?>:</td>
				<td class="pacrudFormFields"><input id="pacrud_search_obj_name" type="text" onchange="code.writePacrudSearch()" size="30" autofocus="autofocus" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Título da Janela'); ?> (title):</td>
				<td class="pacrudFormFields"><input id="pacrud_search_obj_title" type="text" onchange="code.writePacrudSearch()" size="30" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Schema da Tabela'); ?> (schema):</td>
				<td class="pacrudFormFields"><input id="pacrud_search_obj_schema" type="text" onchange="code.writePacrudSearch()" size="30" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome da Tabela'); ?> (tableName):</td>
				<td class="pacrudFormFields"><input id="pacrud_search_obj_tablename" type="text" onchange="code.writePacrudSearch()" size="30" />*</td>
			</tr>
		</table>
		<div id="div_pacrud_search_mais_opcoes" style="display:none">
			<table class="pacrudFormTable">
				<tr>
					<td class="pacrudFormLabel"><?php echo _('Qtd Linhas da Tabela'); ?> (pageLines):</td>
					<td class="pacrudFormFields"><input id="pacrud_search_obj_pagelines" type="text" onchange="code.writePacrudSearch()" size="9" /></td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_search_obj_modal" type="checkbox" onchange="code.writePacrudSearch()" checked="checked" /><?php echo _('Modal'); ?> (modal)</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_search_obj_autofilter" type="checkbox" onchange="code.writePacrudSearch()" checked="checked" /><?php echo _('Auto Filtro'); ?> (autoFilter)</td>
				</tr>
				<tr>
					<td class="pacrudFormLabel"><br /></td>
					<td class="pacrudFormFields"><input id="pacrud_search_obj_debug" type="checkbox" onchange="code.writePacrudSearch()" /><?php echo _('Modo Depuração'); ?> (debug)</td>
				</tr>
			</table>
		</div>
		
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields">
					<button onclick="code.btPacrudSearchOk_click()">OK</button> 
					<button onclick="code.btPacrudSearchMaisOpcoes_click()" id="bt_pacrud_search_mais_opcoes">Mais Opções</button> 
				</td>
			</tr>
		</table>
	</div>
	
	<div id="div_pacrud_search_field" style="display:none">
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_search_field_pk" onchange="code.writePacrudSearchField()" type="checkbox" /><?php echo _('Chave Primária');?> (pk) *</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Nome do campo');?> (name):</td>
				<td class="pacrudFormFields"><input id="pacrud_search_field_name" onchange="code.writePacrudSearchField()" type="text" size="30" />*</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Rótulo');?> (label):</td>
				<td class="pacrudFormFields"><input id="pacrud_search_field_label" onchange="code.writePacrudSearchField()" type="text" size="30" /></td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><?php echo _('Tipo de dado');?> (type):</td>
				<td class="pacrudFormFields">
					<select id="pacrud_search_field_type" onchange="code.writePacrudSearchField()">
						<option value="string"><?php echo _('texto'); ?></option>
						<option value="text"><?php echo _('texto longo'); ?></option>
						<option value="integer"><?php echo _('inteiro'); ?></option>
						<option value="serial"><?php echo _('inteiro auto incrementado'); ?></option>
						<option value="numeric"><?php echo _('numérico'); ?></option>
						<option value="date"><?php echo _('data'); ?></option>
						<option value="time"><?php echo _('hora'); ?></option>
						<option value="timestamp"><?php echo _('data e hora'); ?></option>
						<option value="boolean"><?php echo _('boleano'); ?></option>
					</select>*
				</td>
			</tr>
			<tr>
				<td class="pacrudFormLabel"><br /></td>
				<td class="pacrudFormFields"><input id="pacrud_search_field_visible" onchange="code.writePacrudSearchField()" type="checkbox" /><?php echo _('Visível');?> (visible)</td>
			</tr>
		</table>
		<table class="pacrudFormTable">
			<tr>
				<td class="pacrudFormLabel"></td>
				<td class="pacrudFormFields">
					<button onclick="code.btPacrudSearchFieldOk_click()">OK</button> 
				</td>
			</tr>
		</table>
	</div>
		
</div>

<?php
require_once('../model/class_tab.php');

$tabOtherCode = new pacrudTab();
$tabOtherCode->addTab('view',_('Código da VIEW'));
$tabOtherCode->addTab('ddl',_('Código DDL'));
$tabOtherCode->init();
$tabOtherCode->showTab(true,'view');
?>
<script type="text/javascript">
	tabOtherCode.hide();
</script>

</fieldset>

<br />

<script type="text/javascript" src="view_code_generator.js"></script>
