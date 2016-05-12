

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
 
function pacrudGridNavigation(objName) {
	this.objName = objName;
	this.xmlIdentification = 'pGridStatus';
	this.count;
	this.pageLines;
	this.page;
	this.maxPages = 10;

	//recalc
	this.registersFrom;
	this.registersTo;
	this.pages;
	
	this.gridNavigation = document.getElementById('pGridNavigation_'+objName);
	
	this.clear = function() {
		this.gridNavigation.innerHTML = gettext('Carregando')+'...';
	}
	
	this.recalc = function() {
		this.registersFrom = (this.page - 1) * this.pageLines + 1;
		this.registersTo = this.registersFrom*1 + this.pageLines*1-1;
		if (this.registersTo > this.count) {
			this.registersTo = this.count;
		}
		this.pages = Math.ceil(this.count / this.pageLines);
	}
	
	this.redraw = function() {
		this.recalc();
		htmlOut = '';		
		
		// calculos
		var bars = Math.ceil(this.pages / this.maxPages);
		var thisBar = Math.ceil(this.page / this.maxPages);
		var pageFrom = (thisBar -1) * this.maxPages + 1;
		var pageTo = pageFrom + this.maxPages - 1;
		
		//quando nenhum registro encontrado
		if (this.registersTo == 0) {
			this.registersFrom = 0;
			this.page = 0;
		}
		
		// quando não há paginas suficientes para completar a barra
		if (pageTo > this.pages) {
			pageTo = this.pages;
		}
		
		// botão primeira página
		if (thisBar > 2) {
			htmlOut += '<button onclick="'+this.objName+'.goSearch(1)">1...</button>';
		}
		
		// botão pagina anterior
		if (thisBar > 1) {
			var lastPage = pageFrom - 1;
			htmlOut += '<button onclick="'+this.objName+'.goSearch('+lastPage+')">&lt;</button>';
		}
		
		// Laço que cria os botões da barra
		for(i = 0 ; i < pageTo - pageFrom +1 ; i++) {
			var iPage = pageFrom + i;
			if (iPage == this.page) {
				htmlOut += '<button disabled="disabled" onclick="'+this.objName+'.goSearch('+iPage+')">'+iPage+'</button>';
			}
			else {
				htmlOut += '<button onclick="'+this.objName+'.goSearch('+iPage+')">'+iPage+'</button>';
			}
		}
		
		// botão próxima pagina
		if (iPage != this.pages && this.page != 0) {
			var nextPage = iPage + 1;
			htmlOut += '<button onclick="'+this.objName+'.goSearch('+nextPage+')">&gt;</button>';
		}
		
		// botão última página
		if (bars - thisBar > 1) {
			htmlOut += '<button onclick="'+this.objName+'.goSearch('+this.pages+')">...'+this.pages+'</button>';
		}

		// monta a barra de status
		htmlOut += '<br />';
		htmlOut += gettext('Registros encontrados')+': '+this.count+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
		htmlOut += gettext('Mostrando de')+' '+this.registersFrom+' '+gettext('até')+' '+this.registersTo+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
		htmlOut += gettext('Página')+' '+this.page+' '+gettext('de')+' '+this.pages;
		htmlOut += '<br />';
	
		this.gridNavigation.innerHTML = htmlOut;
	}
	
	/**
	 * Evento disparado após o assignResponseXML para ser implementado conforme necessidade do desenvolvedor da aplicação
	 */
	this.afterAssignResponseXML = function() {
		// implementar conforme necessidade
	}
	
	this.assignResponseXML = function(responseXML) {
		var x=responseXML.getElementsByTagName(this.xmlIdentification);
		this.clear();
		this.count     = x[0].getElementsByTagName('count')[0].childNodes[0].nodeValue;
		this.pageLines = x[0].getElementsByTagName('pageLines')[0].childNodes[0].nodeValue;
		this.page      = x[0].getElementsByTagName('page')[0].childNodes[0].nodeValue;

		this.redraw();
		
		this.afterAssignResponseXML();
	}

}
