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

// dependencias
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_ajax.php');
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_window.php');
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_grid.php');
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_filter.php');
require_once($pacrudConfig['pacrudPath'].'/controller/inc_js_grid_navigation.php');

echo '<script type="text/javascript" src="'.$pacrudConfig['pacrudWebPath'].'/model/class_search.js"></script>'."\n";
