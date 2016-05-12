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
?>

<fieldset> 
<legend><?php echo _('Atualização de banco de dados'); ?></legend>

<div style="padding:5px">
	<?php echo _('Cole na caixa de texto o código DDL de atualização do banco de dados:'); ?>
	<div style="text-align:center">
		<textarea id="ddl_code" autofocus wrap="off" style="font: 12px Courier New; height: 350px; width: 99%;" onchange="txPacrudCode_change()"></textarea>
	</div>
	<input type="checkbox" id="uptodate" checked="checked" /> <?php echo _('Considerar que este script já foi executado na base de dados atual'); ?><br /><br />
	<button onclick="btWriteScript_click()"><?php echo _('Gravar script'); ?></button><br />
</div>

</fieldset>

<script type="text/javascript">
	pAjaxDdl = new pacrudAjax('ctrl_db_update.php');
	pAjaxDdl.process = function() {
		if (this.responseText == 'OK') {
			alert(gettext('Atualização de banco de dados gravada com sucesso!'));
			document.getElementById('ddl_code').value = '';
		}
		else {
			alert(this.responseText);
		}
	}
	
	function btWriteScript_click() {
		if (document.getElementById('uptodate').checked) {
			var upToDate = 't';
		}
		else {
			var upToDate = 'f';
		}
		pAjaxDdl.goAjax('ddl='+document.getElementById('ddl_code').value+'&uptodate='+upToDate);
	}
</script>

