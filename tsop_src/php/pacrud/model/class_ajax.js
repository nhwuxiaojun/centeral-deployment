

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

// Este arquivo contém a classe do objeto ajax que irá rodar no cliente

function classAjax() {
	try {
		ajax = new XMLHttpRequest();
	}
	catch(e) {
		alert(gettext('Seu browser não suporta Ajax XMLHttpRequest'));
		ajax = null;
	}
	return ajax;
}

function pacrudAjax(ajaxFile) {
	this.ajaxFile        = ajaxFile;
	this.ajaxFormat     = 'text';
	this.ajax           = new classAjax();
	this.pLoading       = pLoading;
	this.debug          = false;
	this.identification = 'paCRUD';
	this.defaultParams  = '';
	this.xmlData;
	this.responseXML;
	this.responseText;
	this.working        = false;

	this.goAjax = function(params) {
		if (this.working == false) {
			this.pLoading.show(this);
		}
		this.working = true;
	
		this.ajax.open("POST", this.ajaxFile, true);
		this.ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		this.ajax.parent = this;
		this.ajax.onreadystatechange = function() {;
			if (this.readyState == 1) {
				//state 1
			}
			if (this.readyState == 4 ) {				
				if (this.parent.debug) {
					alert(this.responseText);
				}
				this.parent.responseText = this.responseText;
				if (this.parent.ajaxFormat == 'xml') {
					this.parent.responseXML = this.responseXML;
					if (this.parent.responseXML) {
						this.parent.beforeProcess();
						this.parent.pLoading.hide(this);
					}
					else {
						alert(gettext('Formato XML inválido para "')+this.parent.ajaxFile+'"');
					}
				}
				else if (this.parent.ajaxFormat == 'text') {
					this.parent.beforeProcess();
					this.parent.pLoading.hide(this);
				}
				else {
					alert(gettext('Formato desconhecido "')+this.parent.ajaxFormat+'"');
				}
				this.parent.working = false;
			}
		}
		if (this.defaultParams != '') {
			params += '&'+this.defaultParams;
		}
		if (this.debug) {
			alert(params);
		}
		this.ajax.send(params);
	}

	this.beforeProcess = function() {
		if (this.ajaxFormat == 'xml') {
			this.xmlData = this.responseXML.getElementsByTagName(this.identification);
			this.process();			
		}
		else {
			this.process();
		}
	}

	this.ajaxXmlOk = function() {
		//para ajaxFormat xml, sobrescrever este método após o constructor
		alert('Implementar o método ajaxXmlOk');
	}
	
	this.ajaxXmlError = function(err,msg) {
		//para ajaxFormat xml, sobrescrever este método após o constructor
		alert(msg);
	}

	// para ajaxFormat texto, sobrescrever este método após o constructor
	this.process = function() {
		if (this.ajaxFormat == 'xml') {
			try {
				xmlTagErr = this.responseXML.getElementsByTagName('err')[0];
				if (xmlTagErr == undefined) {
					this.ajaxXmlOk();
				}
				else {
					err = this.responseXML.getElementsByTagName('err')[0].firstChild.nodeValue;
					msg = this.responseXML.getElementsByTagName('msg')[0].firstChild.nodeValue;
					this.ajaxXmlError(err,msg);
				}
			}
			catch(e) {
				this.ajaxXmlOk();
			}			
		}
    }
}
