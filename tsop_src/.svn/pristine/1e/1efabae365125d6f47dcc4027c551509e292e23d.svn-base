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

header('Content-type: text/html; charset=utf-8');
?>
<!DOCTYPE HTML>
<html>

<head>
	<title><?php echo $pacrudConfig['appIdent'] . ' - ' . $pacrudConfig['appName']; ?></title>
<?php
	if (file_exists('favicon.ico')) {
		echo '	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />'."\n";
	}

	$pacrudStyle       = pGetTheme('style.css',true);
	$pacrudStyleGrid   = pGetTheme('style_grid.css',true);
	$pacrudStyleWindow = pGetTheme('style_window.css',true);
	$pacrudStyleMenu   = pGetTheme('style_menu.css',true);
	$pacrudStyleLayout = pGetTheme('style_layout.css',true);
?>
	<link type="text/css" rel="stylesheet" media="screen" href="<?php echo $pacrudStyle; ?>" />
	<link type="text/css" rel="stylesheet" media="screen" href="<?php echo $pacrudStyleGrid; ?>" />
	<link type="text/css" rel="stylesheet" media="screen" href="<?php echo $pacrudStyleWindow; ?>" />
	<link type="text/css" rel="stylesheet" media="screen" href="<?php echo $pacrudStyleMenu; ?>" />
	<link type="text/css" rel="stylesheet" media="screen" href="<?php echo $pacrudStyleLayout; ?>" />
	<?php
		if (file_exists('style.css')) {
			echo '<link type="text/css" rel="stylesheet" media="screen" href="style.css" />'."\n";
		}
	?>
	<link type="application/x-mo" rel="gettext" href="<?php echo $pacrudConfig['pacrudWebPath'].'/locale/'.$pacrudConfig['language'];?>/LC_MESSAGES/paCRUD.mo" />
</head>

<body>

<?php require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_gettext.php'); ?>
<?php require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_loading.php'); ?>
