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

require_once('config_default.php');

if (file_exists('app/pacrud.php')) {
	require_once('app/pacrud.php');
}
else {
	require_once('controller/ambient.php');
}

require_once('view/header.php');

$error = 0;

if (!extension_loaded('gettext')) {
	echo '<br /><br />'."\n";
	echo '	<p><img src=\'view/images/logo_small.png\' alt=\'logo\' /></p>'."\n";
	echo '	<p>É necessário ativar a extensão gettext no PHP</p>'."\n";
	$error++;
}
else if (!file_exists('app/pacrud.php')) {	
	echo '<br /><br />'."\n";
	echo '	<p><img src=\'view/images/logo_small.png\' alt=\'logo\' /></p>'."\n";
	echo '	<h1>'._('Você instalou com sucesso o paCRUD Framework!<br />Siga instruções para a configuração inicial').'.</h1>'."\n";
	echo '	<p>'._('Crie uma pasta "app" na raiz do framework, e copie os arquivos index.php e pacrud.php da pasta app.example, em seguida pressione F5 para recarregar esta página').'.</p>'."\n";
	echo '	<p>'._('A tela de login será exibida, o usuário padrão é "admin" e a senha padrão também é "admin"').'.</p>'."\n";
	echo '	<p>'._('Use a pasta "app" para colocar os aquivos da sua aplicação, e o arquivo "app/pacrud.php" para configurar o acesso ao banco de dados do paCRUD Framework, as demais configurações você encontrará no painel de controle após fazer o login.').'.</p>'."\n";
	$error++;
}
else {
	$title = $pacrudConfig['appIdent'] . ' - ' . $pacrudConfig['appName'];
	
	$requirePgsql = false;
	$requireMariadb = false;
	$requireSqlite3 = false;
	
	switch ($pacrudConfig['sgdb_pacrud']) {
		case 'pgsql':
			$requirePgsql = true;
			break;
		case 'mariadb':
			$requireMariadb = true;
			break;
		case 'sqlite3':
			$requireSqlite3 = true;
			break;
	}
	
	$msg = _('É necessário ativar a extensão %extension% no PHP');
	
	if ($requirePgsql and !extension_loaded('pgsql')) {
		echo '	<p>'.str_replace('%extension%','php_pgsql',$msg).'.</p>'."\n";
		$error++;
	}
	
	if ($requireMariadb and !extension_loaded('mysql')) {
		echo '	<p>'.str_replace('%extension%','php_mysql',$msg).'.</p>'."\n";
		$error++;
	}
	
	if ($requireSqlite3 and !extension_loaded('sqlite3')) {
		echo '	<p>'.str_replace('%extension%','php_sqlite3',$msg).', ';
		echo _('ou utilizar outro servidor de banco de dados (MariaDB ou PostgreSQL) para a base de dados do paCRUD').'.</p>';
		echo '	<p>'._('Mais detalhes você encontra nos comentários do arquivo app/pacrud.php').'</p>'."\n";
		$error++;
	}
}

if ($error == 0) {
	echo '	<script type="text/javascript">window.location = \'app\'</script>'."\n";
}

echo '</body>'."\n";
echo '</html>';
