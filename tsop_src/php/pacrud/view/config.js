

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

function changeCreateDatabase() {
	selectCreateDatabase = document.getElementById('createDatabase');
	selectCreatePacrudTables = document.getElementById('createPacrudTables');
}

function assChangeCreateDatabase() {
	document.getElementById('createDatabase').setAttribute('onChange','changeCreateDatabase()');
	changeCreateDatabase();
}

function changeSgdb() {
	selectSgdb = document.getElementById('sgdb');
	inputDbAdminUserName = document.getElementById('dbAdminUserName');
	inputDbAdminPassword = document.getElementById('dbAdminPassword');
	inputDbPort = document.getElementById('dbPort');
	
	if (selectSgdb.value == 'pgsql') {
		inputDbAdminUserName.value = 'postgres';
		inputDbAdminPassword.value = 'postgres';
		inputDbPort.value = '5432';
	}
	else if (selectSgdb.value == 'mariadb') {
		inputDbAdminUserName.value = 'root';
		inputDbAdminPassword.value = '';
		inputDbPort.value = '3306';
	}
}

function assSgdb() {
	document.getElementById('sgdb').setAttribute('onChange','changeSgdb()');
	changeSgdb();
}

