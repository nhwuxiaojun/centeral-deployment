

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

pAjaxControlPanel = new pacrudAjax('../controller/control_panel.php');
pAjaxControlPanel.process = function() {
	if (this.responseText == 'OK') {
		window.location = 'index.php?page=pacrud_controlPanel';
	}
	else {
		alert(this.responseText);
	}
}

function writeConfig() {
	var param = '';
	param += 'appIdent='+document.getElementById('appIdent').value;
	param += '&appName='+document.getElementById('appName').value;
	param += '&sgdb='+document.getElementById('sgdb').value;
	param += '&dbHost='+document.getElementById('dbHost').value;
	param += '&dbPort='+document.getElementById('dbPort').value;
	param += '&dbName='+document.getElementById('dbName').value;
	param += '&dbUserName='+document.getElementById('dbUserName').value;
	param += '&dbPassword='+document.getElementById('dbPassword').value;
	param += '&dbEncoding='+document.getElementById('dbEncoding').value;
	param += '&appSchema='+document.getElementById('appSchema').value;
	param += '&language='+document.getElementById('language').value;
	param += '&locale='+document.getElementById('locale').value;
	param += '&theme='+document.getElementById('theme').value;
	param += '&searchLines='+document.getElementById('searchLines').value;
	if (document.getElementById('showPacrudLogo').checked == true) {
		param += '&showPacrudLogo=t';
	}
	else {
		param += '&showPacrudLogo=f';
	}
	
	if (document.getElementById('logInsert').checked == true) {
		param += '&logInsert=t';
	}
	else {
		param += '&logInsert=f';
	}
	
	if (document.getElementById('logSelect').checked == true) {
		param += '&logSelect=t';
	}
	else {
		param += '&logSelect=f';
	}
	
	if (document.getElementById('logUpdate').checked == true) {
		param += '&logUpdate=t';
	}
	else {
		param += '&logUpdate=f';
	}
	
	if (document.getElementById('logDelete').checked == true) {
		param += '&logDelete=t';
	}
	else {
		param += '&logDelete=f';
	}
	
	if (document.getElementById('logInsert_pacrud').checked == true) {
		param += '&logInsert_pacrud=t';
	}
	else {
		param += '&logInsert_pacrud=f';
	}
	
	if (document.getElementById('logSelect_pacrud').checked == true) {
		param += '&logSelect_pacrud=t';
	}
	else {
		param += '&logSelect_pacrud=f';
	}
	
	if (document.getElementById('logUpdate_pacrud').checked == true) {
		param += '&logUpdate_pacrud=t';
	}
	else {
		param += '&logUpdate_pacrud=f';
	}
	
	if (document.getElementById('logDelete_pacrud').checked == true) {
		param += '&logDelete_pacrud=t';
	}
	else {
		param += '&logDelete_pacrud=f';
	}
	
	param += '&commandPacrudUpdate='+document.getElementById('commandPacrudUpdate').value;
	param += '&commandAppUpdate='+document.getElementById('commandAppUpdate').value;
	pAjaxControlPanel.goAjax(param);
}
