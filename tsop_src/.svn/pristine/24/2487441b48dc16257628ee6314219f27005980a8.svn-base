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

pProtect('pacrud_update');

if ($pacrudConfig['commandAppUpdate'] != '') {
	require_once('../controller/inc_js_ajax.php');
	require_once('../controller/inc_js_loading.php');
	?>

	<script type="text/javascript">
		var ajaxAppUpdate = new pacrudAjax('../controller/update_app.php');
		ajaxAppUpdate.ajaxFormat = 'text';
		ajaxAppUpdate.process = function() {
			document.getElementById('div_appUpdate').innerHTML = '<pre>'+this.responseText+'</pre>';
			document.getElementById('btAppUpdate').removeAttribute('disabled');
			document.getElementById('imgAppUpdate').style.display = 'none';
		}
	
		function btAppUpdateClick() {
			document.getElementById('div_appUpdate').innerHTML = '';
			document.getElementById('btAppUpdate').setAttribute('disabled','disabled');
			document.getElementById('imgAppUpdate').style.display = 'block';
			ajaxAppUpdate.goAjax('');
		}
	</script>

	<?php
	echo '<p><b>'._('Atualização da Aplicação').'</b></p>';
	echo '<p>';
	echo $pacrudConfig['commandAppUpdate'].' ';
	echo '<button id="btAppUpdate" onclick="btAppUpdateClick()">'._('Executar').'</button>';
	echo '</p>';
	?>
	<img id="imgAppUpdate" src="<?php echo $pacrudConfig['pacrudWebPath'] ?>/view/images/loading.gif" style="display:none" alt="" />
	<div id="div_appUpdate" class="resultaUpdate">
	</div>

	<hr />

<?php
}
