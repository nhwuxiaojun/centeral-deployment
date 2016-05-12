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
 
/**
 * Este arquivo contém o objeto de conexão com o banco de dados.
 */

if ($pacrudConfig['dbEncoding_pacrud'] != 'default') {
	$encParam = ',encoding='.$pacrudConfig['dbEncoding_pacrud'];
}
else {
	$encParam = '';
}
                                       
$pConnectionPacrud = new pacrudConnection('sgdb='.$pacrudConfig['sgdb_pacrud'].',dbHost='.$pacrudConfig['dbHost_pacrud']
                                        .',dbPort='.$pacrudConfig['dbPort_pacrud'].',dbName='.$pacrudConfig['dbName_pacrud']
                                        .',dbUserName='.$pacrudConfig['dbUserName_pacrud'].',dbPassword='
                                        .$pacrudConfig['dbPassword_pacrud'].$encParam
                                       );
