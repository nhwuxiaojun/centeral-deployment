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

if (isset($_GET['phpinfo'])) {
	require_once('../app/pacrud.php');
	pProtect('pacrud_controlPanel');
	phpinfo();
	exit;
}
if (isset($_GET['pacrudInfo'])) {
	require_once('../app/pacrud.php');
	pProtect('pacrud_controlPanel');
	pacrudInfo();
	exit;
}

require_once($pacrudConfig['pacrudPath'].'/view/header.php');
require_once('../controller/inc_js_loading.php');
require_once($pacrudConfig['pacrudPath'].'/view/loading.php');

?>

<div class="pacrudContainer">
	<div class="pacrudHeader">
		<div class="pacrudHeaderLeft"><a href="index.php"><img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/themes/default/icons/home.png" alt="home" /> <?php echo _('Início'); ?></a></div>
		<div class="pacrudHeaderRight"><a href="index.php?action=logoff"><?php echo _('sair'); ?></a></div>
		<div class="pacrudHeaderCenter"><?php echo $pacrudConfig['appIdent'].' - '.$pacrudConfig['appName'].' - DEVTOOLS'; ?></div>
	</div>
	<div class="pacrudBody">
	
		<div id="menu">
			<center>
			<a href="index.php?page=pacrud_code_generator"><?php echo _('Gerador de código');?></a> : : 
			<a href="index.php?page=pacrud_db_update"><?php echo _('Atualização de banco de dados');?></a> : : 
			<a href="index.php?page=pacrud_routines"><?php echo _('Rotinas, permissões e menus'); ?></a> : : 
			<a href="index.php?page=pacrud_controlPanel"><?php echo _('Painel de controle'); ?></a> : : 
			<a href="index.php?pacrudInfo">pacrudInfo()</a> : : 
			<a href="index.php?phpinfo">phpinfo()</a> : : 
			<a href="../app"><?php echo _('Ir para o Sistema'); ?></a>
			<br /><br />
			</center>
		</div>
	
		<div>
			<?php
			if (isset($_GET['page']) and $_GET['page'] == 'pacrud_routines') {
				include($pacrudPages['pacrud_routines']);
			}
			else if (isset($_GET['page']) and $_GET['page'] == 'pacrud_code_generator') {
				include('view_code_generator.php');
			}
			else if (isset($_GET['page']) and $_GET['page'] == 'pacrud_db_update') {
				include('view_db_update.php');
			}
			else if (isset($_GET['page']) and $_GET['page'] == 'pacrud_controlPanel') {
				include($pacrudPages['pacrud_controlPanel']);
			}
			else if (isset($_GET['page']) and $_GET['page'] == 'pacrud_about') {
				include($pacrudPages['pacrud_about']);
			}
			else {
			?>
				<fieldset>
				<legend>Ambiente de desenvolvimento paCRUD</legend>
					
					<p><?php echo _('Bem vindo! Você está no ambiente de desenvolvimento paCRUD, um espaço onde estão agrupadas algumas ferramentas específicas para o desenvolvedor da aplicação.'); ?></p>
					<p><?php echo _('Todos os grupos de usuário que tiverem permissão de acesso a a rotina "pacrud_devtools" poderão acessar este ambiente de desenvolvimento.'); ?></p>
					
					<h2><a href="index.php?page=pacrud_code_generator"><?php echo _('Gerador de código'); ?></a></h2>
					<p><?php echo _('O Gerador de código é uma ferramenta prática para construir controllers para objetos paCRUD, pacrudSearch e pacrudList.'); ?></p>
					
					<h2><a href="index.php?page=pacrud_db_update"><?php echo _('Atualização de Banco de dados'); ?></a></h2>
					<p><?php echo _('Ferramenta para empacotar comandos DDL SQL em arquivos php, dessa forma os comandos poderão fazer parte de um commit na sua ferramenta de controle de versão, e serão executados automaticamente na rotina de atualização após o seu script de atualização definido no painel de controle.'); ?></p>
					
					<h2><a href="index.php?page=pacrud_routines"><?php echo _('Rotinas, Permissões e Menus'); ?></a></h2>
					<p><?php echo _('Rotina é um tipo de entidade que suporta o cadastro de credenciais de acesso por grupo de usuário. Objetos como menus, formulários, arquivos view e controller podem ser vinculados a rotinas e assim serem protegidos de acordo com as credenciais de acesso.'); ?></p>
					
					<h2><a href="index.php?page=pacrud_controlPanel"><?php echo _('Painel de Controle'); ?></a></h2>
					<p><?php echo _('No painel de controle você encontra alguns parâmetros e configurações para a sua aplicação. Você pode acessar o painel de controle através do menu sistema ou clicando <a href="index.php?page=pacrud_controlPanel">aqui</a>.'); ?></p>
					
					<h2><a href="index.php?phpinfo"><?php echo _('phpinfo()'); ?></a></h2>
					<p><?php echo _('Um atalho para a função phpinfo() do PHP, que só pode ser acessado se você estiver logado no paCRUD como desenvolvedor.'); ?></p>
					
					<h2><a href="index.php?pacrudInfo"><?php echo _('pacrudInfo()'); ?></a></h2>
					<p><?php echo _('Semelhante ao phpinfo, o pacrud oferece algumas informações e variáveis de ambiente fornecidas pelo framework.'); ?></p>
					
					<h2><?php echo _('Área de trabalho'); ?></h2>
					<p><?php echo _('A Área de trabalho é a primeira tela que é apresentada ao usuário após o login, ela pode facilmente ser personalizada. Basta criar um arquivo desktop.php na raiz da sua aplicação com o conteúdo que você desejar.'); ?></p>

				</fieldset>
				<br />
			<?php
			}
			?>
		</div>
	</div>
	<div class="clear"></div>
	<br />
	<div class="pacrudFooter">	<a href="index.php"><?php echo _('Início'); ?></a> : : <a href="index.php?page=pacrud_changePassword"><?php echo _('Alterar Senha'); ?></a>
	 : : <a href="index.php?action=logoff"><?php echo _('Sair'); ?></a>
	</div>
</div>

<?php
include($pacrudConfig['pacrudPath'].'/view/footer.php');

