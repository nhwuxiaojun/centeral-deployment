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

Header('Content-type: application/xml; charset=UTF-8');

if (isset($_GET['language'])) {
	$language = $_GET['language'];
}
else {
	$language = 'pt_br';
}
$languageCount = strlen($language);

$pacrudWebPath = substr($_SERVER['REQUEST_URI'],0,strlen($_SERVER['REQUEST_URI'])-28-$languageCount);
$pacrudPath    = substr($_SERVER['SCRIPT_FILENAME'],0,strlen($_SERVER['SCRIPT_FILENAME'])-18);
$iconPath      = $pacrudWebPath.'/view/images/icons';

?>
<pacrudMenu>
	<menu id="system" label="<?php echo _('SISTEMA'); ?>" opened="1">
		<level1 id="changePassword" label="<?php echo _('Alterar Senha'); ?>">
			<link>index.php?page=pacrud_changePassword</link>
			<icon><?php echo $iconPath; ?>/key.png</icon>
		</level1>
		<level1 id="controlPanel" label="<?php echo _('Configuração do menu'); ?>">
			<link>index.php?page=pacrud_controlPanel</link>
			<icon><?php echo $iconPath; ?>/key.png</icon>
		</level1>
		<level1 id="groups" label="<?php echo _('Grupos de Usuários'); ?>">
			<link>index.php?page=pacrud_groups</link>
			<icon><?php echo $iconPath; ?>/users.png</icon>
		</level1>		
		<level1 id="submission" label="<?php echo _('Instruções iniciais'); ?>">
			<link>index.php?page=pacrud_submission</link>
			<icon><?php echo $iconPath; ?>/exclamation.png</icon>
		</level1>
		<level1 id="reconfigure" label="<?php echo _('Painel de Controle'); ?>">
			<link>index.php?page=pacrud_controlPanel</link>
			<icon><?php echo $iconPath; ?>/system.png</icon>
		</level1>
		<level1 id="routines" label="<?php echo _('Rotinas'); ?>">
			<link>index.php?page=pacrud_routines</link>
			<icon><?php echo $iconPath; ?>/system.png</icon>
		</level1>
		<level1 id="about" label="<?php echo _('Sobre o paCRUD'); ?>">
			<link>index.php?page=pacrud_about</link>
			<icon><?php echo $iconPath; ?>/exclamation.png</icon>
		</level1>
		<level1 id="users" label="<?php echo _('Usuários'); ?>">
			<link>index.php?page=pacrud_users</link>
			<icon><?php echo $iconPath; ?>/users.png</icon>
		</level1>
		<icon><?php echo $iconPath; ?>/example.png</icon>
	</menu>
	<menu id="register" label="<?php echo _('CADASTROS'); ?>" opened="1">
		<level1 id="peoples" label="<?php echo _('Pessoas'); ?>">
			<level2 id="juridic_people" label="<?php echo _('Pessoa Jurídica'); ?>">
				<link>index.php?page=pacrud_submission</link>
				<icon><?php echo $iconPath; ?>/users.png</icon>
			</level2>
			<level2 id="fisic_people" label="<?php echo _('Pessoa Física'); ?>">
				<link>index.php?page=pacrud_submission</link>
				<icon><?php echo $iconPath; ?>/users.png</icon>
			</level2>
			<icon><?php echo $iconPath; ?>/users.png</icon>
		</level1>
		<level1 id="places" label="<?php echo _('Lugares'); ?>">
			<link>index.php?page=pacrud_submission</link>
			<icon><?php echo $iconPath; ?>/example.png</icon>
		</level1>
		<level1 id="things" label="<?php echo _('Coisas'); ?>">
			<link>index.php?page=pacrud_submission</link>
			<icon><?php echo $iconPath; ?>/example.png</icon>
		</level1>
		<icon><?php echo $iconPath; ?>/example.png</icon>
	</menu>
	<menu id="direct" label="<?php echo _('DIRETO'); ?>">
		<link>index.php?page=pacrud_submission</link>
		<icon><?php echo $iconPath; ?>/example.png</icon>
	</menu>
	<menu id="iconless" label="<?php echo _('MENU SEM ICONE'); ?>">
		<level1 id="iconless_menu_level1" label="<?php echo _('Exemplo de nível'); ?> 1">
			<link>index.php</link>
		</level1>
	</menu>
	<menu id="exampla_menu" label="<?php echo _('MENU DE EXEMPLO'); ?>">
		<level1 id="example_menu_level1" label="<?php echo _('Exemplo de nível'); ?> 1">
			<level2 id="example_menu_level2" label="<?php echo _('Exemplo de nível'); ?> 2">
				<level3 id="example_menu_level3" label="<?php echo _('Exemplo de nível'); ?> 3">
					<level4 id="example_menu_level4" label="<?php echo _('Exemplo de nível'); ?> 4">
						<level5 id="example_menu_level5" label="<?php echo _('Exemplo de nível'); ?> 5">
							<link>index.php?page=pacrud_submission</link>
							<icon><?php echo $iconPath; ?>/example.png</icon>
						</level5>
						<icon><?php echo $iconPath; ?>/example.png</icon>
					</level4>
					<icon><?php echo $iconPath; ?>/example.png</icon>
				</level3>
				<icon><?php echo $iconPath; ?>/example.png</icon>
			</level2>
			<icon><?php echo $iconPath; ?>/example.png</icon>
		</level1>
		<icon><?php echo $iconPath; ?>/example.png</icon>
	</menu>
</pacrudMenu>
