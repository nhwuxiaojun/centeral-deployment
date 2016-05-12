

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

function pacrudQueue(objName,ajaxFile) {
    pacrudSearch.apply(this, arguments);
	
	this.pAjax.ajaxXmlOk = function() {
		this.parent.pGrid.assignResponseXML(this.responseXML);
		this.parent.pGridNavigation.assignResponseXML(this.responseXML);
		this.parent.pFilter.assignResponseXML(this.responseXML);
		document.getElementById(this.parent.objName+'_btSearch').removeAttribute('disabled');
		document.getElementById(this.parent.objName+'_btSearchAll').removeAttribute('disabled');
		this.parent.afterList();
	}
	
	this.lineClick = function(lineIndex) {
		var msg = gettext('Falta implementar o método lineClick do objeto ')+this.objName;
		alert(msg);
	}
	
	this.afterList = function() {
		//disponivel para implementação
	}
	
}
