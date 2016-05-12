

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

function pacrudSearch(objName,ajaxFile) {
	this.objName = objName;
	this.identification = objName;
	this.page;
	
	this.crudName;

	this.pAjax;
	this.pWindow;
	this.pFilter;
	this.pGrid;
	this.pGridNavigation;
	
	this.fieldName;
	this.fieldPk;

	this.fieldValueOnFocus;
	this.fieldFocusId = '';
	
	this.autoClick = true;
	
	this.fieldReturn = Array();
	
	this.selected = false;

	this.modal = true;
	this.pAjax = new pacrudAjax(ajaxFile);
	this.pAjax.ajaxFormat = 'xml';
	this.pAjax.parent = this;
	this.pAjax.identification = this.identification;
	this.pAjax.ajaxXmlOk = function() {
		if (this.cmd == 'r') {
			this.parent.pGrid.assignResponseXML(this.responseXML);
			this.parent.lineClick(0);
			this.parent.afterRetrieve();
		}
		else {
			this.parent.pGrid.assignResponseXML(this.responseXML);
			this.parent.pGridNavigation.assignResponseXML(this.responseXML);
			this.parent.pFilter.assignResponseXML(this.responseXML);
			if (this.parent.autoClick == true && this.parent.pGridNavigation.count == 1 && this.parent.pFilter.count > 0) {
				this.parent.lineClick(0);
			}
		}
		document.getElementById(this.parent.objName+'_btSearch').removeAttribute('disabled');
		document.getElementById(this.parent.objName+'_btSearchAll').removeAttribute('disabled');
		
		this.parent.afterList();
	}
	
	this.afterSearch = function() {
		//implementar conforme necessidade
	}
	
	this.afterRetrieve = function() {
		//implementar conforme necessidade
	}
	
	this.afterList = function() {
		//implementar conforme necessidade
	}
	
	this.parametersFilters = function() {
		param = '';
		for (i=0; i < this.pFilter.filter.length; i++) {
			param += '&fField[]='+this.pFilter.filter[i].fieldName;
			param += '&fOperator[]='+this.pFilter.filter[i].operator;
			param += '&fValue[]='+this.pFilter.filter[i].value;
			param += '&fValue2[]='+this.pFilter.filter[i].value2;
			param += '&fVisible[]='+this.pFilter.filter[i].visible;
		}
		return param;
	}
	
	this.parameters = function() {
		if (this.page == undefined) {
			this.page = 1;
		}
		
		if (this.crudName != undefined) {
			var param = 'objName='+this.crudName;
		}
		else {
			var param = 'objName='+this.objName;
		}
		param += '&'+this.objName+'_action=makeXml';
		param += '&page='+this.page;
		param += this.parametersFilters();
		return param;
	}
	
	this.format = function(type,value) {
		if (type == 'timestamp') {
			var year = value.substring(0,4);
			var month = value.substring(5,7);
			var day = value.substring(8,10);
			var hour = value.substring(11,13);
			var minute = value.substring(14,16);
			var second = value.substring(17,19);
			var timestamp = value.substring(17,19);
			var formatedValue = day + '/' + month + '/' + year + ' ' + hour + ':' + minute + ':' + second;
		}
		else if (type == 'date') {
			var year = value.substring(0,4);
			var month = value.substring(5,7);
			var day = value.substring(8,10);
			var formatedValue = day + '/' + month + '/' + year;
		}
		else if (type == 'numeric') {
			var formatedValue = value.replace('.',',');
		}
		else {
			var formatedValue = value;
		}
		
		if (formatedValue == '//' || formatedValue == '//::') {
			formatedValue = '';
		}
		
		return formatedValue;
	}
	
	this.lineClick = function(lineIndex) {
		for (i=0; i < this.fieldReturn.length; i++) {
			var value = this.pGrid.getValue(this.fieldReturn[i][0],lineIndex);
			var fieldReturn = document.getElementById(this.fieldReturn[i][1]);
			if (fieldReturn != undefined) {
				var type = this.fieldReturn[i][2];
				if (type == 'date') {
					fieldReturn.value = this.format(type,value);
					if (this.pAjax.cmd == 'r') {
						fieldReturn.setAttribute('title',this.format(type,value));
					}
				}
				else {
					if (fieldReturn.getAttribute('type') == 'checkbox') {
						if (value == 't') {
							fieldReturn.checked = true;
						}
						else {
							fieldReturn.checked = false;
						}
					}
					else {
						fieldReturn.value = this.format(type,value);
						if (this.pAjax.cmd == 'r') {
							fieldReturn.setAttribute('title',this.format(type,value));
						}
					}
				}
			}
			else {
				var msg = gettext('Campo "%fieldName%" não encontrado, verifique a chamada "addFieldReturn" do objeto "%objName%"');
				msg = msg.replace('%fieldName%',this.fieldReturn[i][1]);
				msg = msg.replace('%objName%',this.objName);
				alert(msg);
			}
		}
		this.hide();
		
		var lastReturn = document.getElementById(this.fieldReturn[this.fieldReturn.length -1][1]);
		lastReturn.focus();
		
		this.afterSearch();
	}
	
	this.afterGoSearch = function() {
		//implementar conforme necessidade
		return true;
	}
	
	this.goSearch = function(page) {
		if (this.pAjax.working) {
			alert(this.objName + ': ' + gettext('já está trabalhando'));
		}
		else {
			if (this.afterGoSearch()) {
				this.selected = false;
				this.page = page;
				if (page == undefined) {
					this.pFilter.clearValues();
					this.pGrid.clear();
					this.pGridNavigation.clear();
				}
				this.show();
				this.pAjax.cmd = 'search';
				document.getElementById(this.objName+'_btSearch').setAttribute('disabled','disabled');
				document.getElementById(this.objName+'_btSearchAll').setAttribute('disabled','disabled');
				this.pAjax.goAjax(this.parameters());
			}
		}
	}
	
	this.paramRetrieve = function() {
		var param = 'objName='+this.objName+'&'+this.objName+'_action=r';
		
		for (i in this.fieldPk) {
			if (this.fieldPk[i] == true) {
				var idReturn = '';
				for (j in this.fieldReturn) {
					if (this.fieldName[i] == this.fieldReturn[j][0]) {
						idReturn = this.fieldReturn[j][1];
					}
				}
				param += '&'+this.fieldName[i]+'='+document.getElementById(idReturn).value;
			}
		}
		
		return param;
	}
	
	this.goRetrieve = function() {
		
		var havePk = false;
		var pkNull = false;
		for (i in this.fieldPk) {
			if (this.fieldPk[i] == true) {
				havePk = true;
				var idReturn = '';
				for (j in this.fieldReturn) {
					if (this.fieldName[i] == this.fieldReturn[j][0]) {
						idReturn = this.fieldReturn[j][1];
						if (document.getElementById(idReturn).value == '') {
							pkNull = true;
						}
					}
				}
			}
		}
		
		if (havePk && !pkNull) {
			this.pAjax.cmd = 'r';
			this.pAjax.goAjax(this.paramRetrieve());
		}
	}
	
	this.fieldKeyDown = function(event) {
		if (event.keyCode == 113) { //F2
			this.goSearch();
		}
		if (event.keyCode == 13) { //ENTER
			this.fieldBlur(document.getElementById(this.fieldFocusId));
		}
	}
		
	this.cmdSearch = function() {
		this.goSearch(1);
	}
	
	this.cmdSearchAll = function() {
		this.pFilter.clearValues();
		this.cmdSearch();
		this.pFilter.draw();
	}
	
	this.addFieldReturn = function(fieldName,idReturn,fieldType) {
		this.fieldReturn[this.fieldReturn.length] = Array(fieldName,idReturn,fieldType);
	}
	
	this.show = function() {
		if (this.pWindow != undefined) {
			this.pWindow.show(this.modal);
		}
	}
	
	this.cancel = function() {
		if (this.fieldFocusId != '') {
			inputField = document.getElementById(this.fieldFocusId);
			// Caso o usuário tenha digitado algum valor no campo
			if (this.fieldValueOnFocus != inputField.value) {
				for (i in this.fieldReturn) {			
					document.getElementById(this.fieldReturn[i][1]).value = "";
				}
			}
			
			inputField.focus();
		}
		this.hide();
	}
	
	this.hide = function() {
		this.pWindow.hide();
	}
	
	this.upArrow = function() {
		this.selected = true;
		if (this.pGrid.selectedLine == 0) {
			this.pGrid.selectedLine = this.pGrid.lines + 1;
		}
		
		var nextLine = this.pGrid.selectedLine - 1;
		
		if (this.pGrid.selectedLine > 1) {
			this.pGrid.selectedLine = nextLine;
			this.pGrid.onmouseover(this.pGrid.selectedLine);
		}
		
		if (nextLine == 0) {
			if (this.pGridNavigation.page > 1) {
				this.goSearch(this.pGridNavigation.page * 1 - 1);
			}
		}
	}
	
	this.downArrow = function() {
		this.selected = true;
		var nextLine = this.pGrid.selectedLine + 1;
		if (this.pGrid.selectedLine < this.pGrid.lines) {
			this.pGrid.selectedLine = nextLine;
			this.pGrid.onmouseover(this.pGrid.selectedLine);
		}
		
		if (nextLine == this.pGrid.lines + 1) {
			if (this.pGridNavigation.page < this.pGridNavigation.pages) {
				this.goSearch(this.pGridNavigation.page * 1 + 1);
			}
		}
	}
	
	this.enterKey = function() {
		if (this.selected) {
			this.lineClick(this.pGrid.selectedLine-1);
		}
		else {
			this.cmdSearch();
		}
	}
	
	this.keyDown = function() {
		this.selected = false;
	}
	
	/**
	 * Grava o valor em this.fieldValueOnFocus ao receber o foco para posteriormente ser comparado no evento blur
	 */
	this.fieldFocus = function(objField) {
		this.fieldValueOnFocus = objField.value;
		this.fieldFocusId = objField.getAttribute('id');
	}
	
	/**
	 * Verifica se o usuário digitou ou alterou alguma informação no field
	 */
	this.fieldBlur = function(objField) {
		
		if (this.pAjax.working == false) {
			var objId = objField.getAttribute('id');
			
			for (iFieldReturn in this.fieldReturn) {
				
				if (this.fieldReturn[iFieldReturn][1] == objId) {
					//Compara o valor do campo ao entrar e ao sair se houve alteração, e dispara o search
					if (this.fieldValueOnFocus != objField.value) {
						
						for (iFieldSearch in this.pFilter.fieldName) {
							if (this.pFilter.fieldName[iFieldSearch] == this.fieldReturn[iFieldReturn][0]) {
								var fieldType = this.pFilter.fieldType[iFieldSearch];
							}
						}
						
						if (fieldType == 'string') {
							var operator = 'like';
						}
						else {
							var operator = 'equal';
						}
						
						this.pFilter.clearValues();
						this.pFilter.setFilter(this.fieldReturn[iFieldReturn][0],operator,objField.value);
						this.goSearch(1);
					}
				}
				
			}	
		}
		
	}
}
