

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

/**
 * Valida a data
 */
function isDate(value) {
	var date = value;
	var arrDate = new Array();
	var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
	arrDate = date.split("/");
	
	if (date.search(ExpReg) == -1) {
		return false;
	}
	else if (((arrDate[1] == 4) || (arrDate[1] == 6) || (arrDate[1] == 9) || (arrDate[1] == 11)) && (arrDate[0] > 30)) {
		return false;
	}
	else if (arrDate[1] == 2) {
		if ((arrDate[0] > 28) && ((arrDate[2]%4) != 0)) {
			return false;
		}
		if ((arrDate[0] > 29)&&((arrDate[2]%4)==0)) {
			return false;
		}
	}
	return true;
}

function paCRUD(objName,ajaxFile) {
	this.objName = objName;
	this.modal;
	this.identification = objName;
	this.state = 'new'; //suport new,edit,view,list
	
	this.fieldName;
	this.fieldPk;
	this.fieldId;
	this.fieldLabel;
	this.fieldType;
	this.fieldNotNull;
	
	this.fieldOldValue = Array();
	this.fieldNewValue = Array();
	this.sonSearch = Array();

	this.pAjax;
	this.pCrudList = false;
	
	// permissões
	this.permC = true;
	this.permR = true;
	this.permU = true;
	this.permD = true;
	
	// para relação 1x1
	this.parent1x1 = false;
	this.parent1x1Condition = new Array();
	this.son1x1 = new Array();
	
	// para relação 1xN
	this.parent1xN = false;
	this.son1xN = new Array();
	
	this.isVisible = true;
	
	this.defaultParamCreate;
	
	this.pAjax = new pacrudAjax(ajaxFile);
	this.pAjax.ajaxFormat = 'xml';
	this.pAjax.parent = this;
	this.pAjax.identification = this.identification;
	this.pAjax.ajaxXmlOk = function() {
		// copia o cmd para os filhos 1x1
		for (ii in this.parent.son1x1) {
			this.parent.son1x1[ii].pAjax.cmd = this.cmd;
		}
		
		if (this.cmd == 'create') {
			this.parent.assignResponseXML(this.responseXML);
			this.parent.stateChange('view');
			this.parent.visibleSon1x1();
			this.parent.retrieveVirtual();
			
			var controls = document.getElementById(this.parent.objName+'_control_view');
			for (i in controls.childNodes) {
				if (controls.childNodes[i].nodeType == 1) {
					controls.childNodes[i].focus();
					break;
				}
			}
			
			this.parent.afterCreate();
		}
		else if (this.cmd == 'retrieve') {
			this.parent.assignResponseXML(this.responseXML);
			this.parent.stateChange('view');
			this.parent.visibleSon1x1();
			this.parent.retrieveVirtual();
			this.parent.afterRetrieve();
		}
		else if (this.cmd == 'update') {
			this.parent.assignResponseXML(this.responseXML);
			this.parent.stateChange('view');
			this.parent.retrieveVirtual();
			this.parent.afterUpdate();
		}
		else if (this.cmd == 'delete') {
			this.parent.afterDelete();
		}
		else if (this.cmd == 'copyFrom') {
			this.parent.assignResponseXML(this.responseXML);
			this.parent.clearSerials();
			this.parent.writeNewValues();
			this.parent.retrieveVirtual();
			this.parent.stateChange('copy');
			this.parent.visibleSon1x1();
		}
		else {
			status = this.responseXML.getElementsByTagName('status')[0].firstChild.nodeValue;
			msg = this.responseXML.getElementsByTagName('msg')[0].firstChild.nodeValue;
			alert(msg);
			this.parent.clear();
			this.parent.stateChange('new');
			this.parent.visibleSon1x1();
		}
	}
	
	/**
	 * Verifica se existe algum search ligado a algum campo "virtual"
	 */
	this.retrieveVirtual = function() {
		for (j in this.sonSearch) {
		
			var canVirtual = false;
			for (k in this.sonSearch[j].fieldReturn) {
				for (l in this.fieldId) {
					if (this.sonSearch[j].fieldReturn[k][1] == this.fieldId[l] && this.fieldVirtual[l] == true) {
						canVirtual = true;
					}
				}
			}
			
			if (canVirtual) {
				this.sonSearch[j].goRetrieve();
			}
		}
		
		// Aplica o mesmo método recursivamente aos relacionamentos 1x1
		for (ii in this.son1x1) {
			if (this.fieldNewValue[this.son1x1[ii].parent1x1Condition['fieldName']] == this.son1x1[ii].parent1x1Condition['value'] || this.son1x1[ii].parent1x1Condition['fieldName'] == '') {
				this.son1x1[ii].retrieveVirtual();
			}
		}
	}

	this.addParent1x1 = function(parent,parentFieldCondition,conditionValue) {
		this.parent1x1 = parent;
		parent.son1x1.push(this);
		var arrCondition = Array();
		arrCondition['fieldName'] = parentFieldCondition;
		arrCondition['value'] = conditionValue;
		this.parent1x1Condition = arrCondition;
	}
	
	this.addParent1xN = function(parent) {
		this.parent1xN = parent;
		parent.son1xN.push(this);
	}
	
	this.addSonSearch = function(son) {
		this.sonSearch[this.sonSearch.length] = son;
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
		return formatedValue;
	}

	this.assignResponseXML = function(responseXML) {
		this.xmlData = responseXML.getElementsByTagName(this.objName);

		//limpa o formulário
		if (this.parent1x1 == false) {
			this.clear();
		}
		
		//limpa o array de valores
		this.fieldOldValue = Array();
		this.fieldNewValue = Array();

		// laço que percorre os campos
		
		if (this.xmlData.length == 0) {
			if (this.isVisible) {
				alert(this.objName + ': ' + gettext('Falta preencher alguns campos'));
			}
		}
		else {
			for (i=0; i < this.fieldName.length; i++) {
				// quando é copia não deve preencher os campos noCreate
				if (this.pAjax.cmd == 'copyFrom' && this.fieldNoCreate[i]) {
					var value = '';
				}
				else {
					if (this.fieldVirtual[i]) {
						var value = '';
					}
					else {
						var value = this.xmlData[0].getElementsByTagName(this.fieldName[i])[0].childNodes[0].nodeValue;
					}
				}
				// trata nulos
				if (value == 'NULL') {
					value = '';
				}
				// trata quebra de linha
				value = value.replace(/\\n/g,'\n');
				if (value != '') {
					value = this.format(this.fieldType[i],value);
				}
				
				this.fieldOldValue[this.fieldName[i]] = value;
				this.fieldNewValue[this.fieldName[i]] = value;
			}
			this.writeNewValues();
		}
		
		// Aplica o mesmo método recursivamente aos relacionamentos 1x1
		for (ii in this.son1x1) {
			if (this.fieldNewValue[this.son1x1[ii].parent1x1Condition['fieldName']] == this.son1x1[ii].parent1x1Condition['value'] || this.son1x1[ii].parent1x1Condition['fieldName'] == '') {
				this.son1x1[ii].assignResponseXML(responseXML);
			}
		}
	}
	
	this.clearSerials = function() {
		for (iSerials in this.fieldType) {
			if (this.fieldType[iSerials] == 'serial') {
				this.fieldOldValue[this.fieldName[iSerials]] = '';
				this.fieldNewValue[this.fieldName[iSerials]] = '';
			}
		}
	}
	
	this.visibleSon1x1 = function() {
		this.readNewValues();
		for (i in this.son1x1) {
			if (this.fieldNewValue[this.son1x1[i].parent1x1Condition['fieldName']] == this.son1x1[i].parent1x1Condition['value'] || this.son1x1[i].parent1x1Condition['fieldName'] == '') {
				this.son1x1[i].visibleForm(true);
			}
			else {
				this.son1x1[i].visibleForm(false);
			}
			
			this.son1x1[i].visibleSon1x1();
		}
	}
	
	this.visibleForm = function(state) {
		if (state) {
			this.isVisible = true;
			document.getElementById(this.objName+'_form').style.display = 'block';
		}
		else {
			this.isVisible = false;
			document.getElementById(this.objName+'_form').style.display = 'none';
		}
	}
	
	/**
	 * Valida se não possui campos com id duplicado entre os objetos com relacionamento 1x1 (exceto chave primária)
	 */
	this.validateDuplicatedIds = function() {
		var msg = 'paCRUD: '+gettext('Campo com propriedade "fieldId" duplicado entre objetos "%crudParent%" e "%crudSon%" fieldId="%fieldId%"');
		var msgPk = 'paCRUD: '+gettext('Campo com propriedade "fieldId" difirente entre objetos "%crudParent%" e "%crudSon%" fieldId="%fieldId%", para campo chave primária do relacionamento 1x1');
		
		for (i in this.son1x1) {
			for (j in this.fieldId) {
				for (k in this.son1x1[i].fieldId) {
					if (this.fieldId[j] == this.son1x1[i].fieldId[k]) {
						// excessão para a validação quando é campo chave primária de relacionamento 1x1
						if (this.son1x1[i].parent1x1 == false || this.son1x1[i].fieldPk[k] == false) {
							var fieldId = this.son1x1[i].fieldId[k];
							var crudParent = this.objName;
							var crudSon = this.son1x1[i].objName;
							msgValidate = msg.replace('%crudParent%',crudParent);
							msgValidate = msgValidate.replace('%crudSon%',crudSon);
							msgValidate = msgValidate.replace('%fieldId%',fieldId);
							alert(msgValidate);
							return false;
						}
					}
					else {
						if (this.son1x1[i].parent1x1 == true && this.son1x1[i].fieldPk[k] == true) {
							var fieldId = this.son1x1[i].fieldId[k];
							var crudParent = this.objName;
							var crudSon = this.son1x1[i].objName;
							msgValidate = msgPk.replace('%crudParent%',crudParent);
							msgValidate = msgValidate.replace('%crudSon%',crudSon);
							msgValidate = msgValidate.replace('%fieldId%',fieldId);
							alert(msgValidate);
							return false;
						}
					}
				}
			}
		}
		return true;
	}
	
	this.readNewValues = function() {
		for (i=0; i < this.fieldName.length; i++) {
			// verifica se tem pai ou campo não é chave primaria
			inputField = document.getElementById(this.fieldId[i]);
			if (inputField == null) {
				alert(this.objName+' Error: Campo "'+this.fieldId[i]+'" não encontrado!');
			}
			if (inputField.getAttribute('type') == 'checkbox') {
				if (inputField.checked) {
					this.fieldNewValue[this.fieldName[i]] = 't';
				}
				else {
					this.fieldNewValue[this.fieldName[i]] = 'f';
				}
			}
			else {
				this.fieldNewValue[this.fieldName[i]] = inputField.value;
			}
		}
		
		for (ii in this.son1x1) {
			this.son1x1[ii].readNewValues();
		}
	}
	
	this.writeNewValues = function() {
		for (i=0; i < this.fieldName.length; i++) {
			var value = this.fieldNewValue[this.fieldName[i]];
			// verifica se tem pai ou campo não é chave primaria
			if (this.parent1x1 == false || !this.fieldPk[i]) {
				inputField = document.getElementById(this.fieldId[i]);
				if (inputField.getAttribute('type') == 'checkbox') {
					if (value == 't') {
						inputField.checked = true;
					}
					else {
						inputField.checked = false;
					}
				}
				else {
					inputField.value = value;
				}
			}
		}
	}
	
	/**
	 * Limpa os campos do formulário
	 */
	this.clear = function() {	
		for (i=0; i < this.fieldName.length; i++) {
			if (this.fieldReadonly[i] == false || this.fieldNoCreate[i] == true) {
				if (this.parent1x1 == false || !this.fieldPk[i] || this.fieldNoCreate[i] == true) {
					inputField = document.getElementById(this.fieldId[i]);
					if (inputField == undefined) {
						alert(this.objName + ': ' + gettext('campo') + ' "' + this.fieldId[i] + '" ' + gettext('não encontrado'));
					}
					if (this.fieldType[i] == 'boolean') {
						inputField.removeAttribute('checked');
						inputField.checked = false;
					}
					else {
						inputField.value = '';
						inputField.checked = true;
					}
				}
			}
		}
		for (ii in this.son1x1) {
			this.son1x1[ii].clear();
		}
		this.setDefault();
	}
	
	/**
	 * Seta o valor padrão
	 */
	this.setDefault = function() {
		for (i=0; i < this.fieldName.length; i++) {
			inputField = document.getElementById(this.fieldId[i]);
			if (inputField != undefined && this.fieldDefault[i] != '') {
				if (this.fieldType[i] == 'boolean') {
					if (this.fieldDefault[i] == 't' || this.fieldDefault[i] == 'true') {
						inputField.setAttribute('checked','checked');
						inputField.checked = true;
					}
					else {
						inputField.removeAttribute('checked');
						inputField.checked = false;
					}
				}
				else {
					inputField.value = this.fieldDefault[i];
				}
			}
		}
	}
	
	this.paramPk = function() {
		param = '';
		for (i = 0; i < this.fieldPk.length; i++) {
			if (this.fieldPk[i]) {
				var fieldValue = this.fieldNewValue[this.fieldName[i]];
				param += '&new_'+this.fieldId[i]+'='+encodeURIComponent(fieldValue);
			}
		}
		return param;
	}
	
	this.sincPkSon = function() {
		var arrRel = Array();
		
		//prepara um array com as chaves do objeto atual
		var parentPk = Array();
		for (i in this.fieldId) {
			if (this.fieldPk[i]) {
				parentPk.push(this.fieldId[i]);
			}
		}

		//laço que percorre os filhos 1x1
		for (i in this.son1x1) {
			var sonPk = Array();
			for (j in this.son1x1[i].fieldPk) {
				if (this.son1x1[i].fieldPk[j]) {
					sonPk.push(this.son1x1[i].fieldName[j]);
				}
			}
			if (parentPk.length != sonPk.length) {
				return false;
			}
			else {
				for (j in parentPk) {
					arrRel.push(Array(parentPk[j],sonPk[j]));
				}
			}
		}

		// replica o valor entre os campos chave
		for (ii in this.son1x1) {
			for (j in arrRel) {
				this.son1x1[ii].fieldNewValue[arrRel[j][1]] = document.getElementById(arrRel[j][0]).value;
			}
		}
		
		// aplica o mesmo método recursivamente
		for (iii in this.son1x1) {
			this.son1x1[iii].sincPkSon();
		}
	}

	this.paramCreate = function() {
		var params = '';
		for (i = 0; i < this.fieldPk.length; i++) {
			if (this.parent1x1 == false || this.fieldPk[i] == false) {
				var fieldValue = this.fieldNewValue[this.fieldName[i]];
				params += '&new_'+this.fieldId[i]+'='+encodeURIComponent(fieldValue);
			}
		}
		
		if (this.parent1x1 == false) {
			params = 'objName='+this.objName + '&' + this.objName+'_action=c'+params;		
		}
		else {
			params = this.objName+'_action=c'+params;
		}

		for (iSon in this.son1x1) {
			if (this.son1x1[iSon].isVisible) {			
				if (this.fieldNewValue[this.son1x1[iSon].parent1x1Condition['fieldName']] == this.son1x1[iSon].parent1x1Condition['value'] || this.son1x1[iSon].parent1x1Condition['fieldName'] == '') {
					params += '&'+this.son1x1[iSon].paramCreate();
				}
			}
		}
		
		if (this.defaultParamCreate != '') {
			params += '&' + this.defaultParamCreate;
		}
		
		return params
	}

	this.doCreate = function() {
		if (this.beforeCreate()) {
			if (this.validateDuplicatedIds()) {
				this.readNewValues();
				this.pAjax.cmd = 'create';
				this.pAjax.goAjax(this.paramCreate());
			}
		}
	}

	this.paramRetrieve = function() {
		if (this.parent1x1 == false) {
			var	params = 'objName='+this.objName+'&';
		}
		else {
			var	params = '';
		}
		
		params += this.objName+'_action=r'+this.paramPk();
		for (i in this.son1x1) {
			params += '&'+this.son1x1[i].paramRetrieve();
		}
		return params;
	}
	
	this.doRetrieve = function() {
		if (this.beforeRetrieve()) {
			if (this.validateDuplicatedIds()) {
				this.readNewValues();
				this.sincPkSon();
				this.pAjax.cmd = 'retrieve';
				this.pAjax.goAjax(this.paramRetrieve());
			}
		}
	}
	
	this.doCopyFrom = function() {
		if (this.validateDuplicatedIds()) {
			this.readNewValues();
			this.sincPkSon();
			this.pAjax.cmd = 'copyFrom';
			this.pAjax.goAjax(this.paramRetrieve());
		}
	}
	
	this.paramUpdate = function() {
		var params = '';
		for (i = 0; i < this.fieldPk.length; i++) {
			if (this.parent1x1 == false || this.fieldPk[i] == false) {
				var fieldNewValue = this.fieldNewValue[this.fieldName[i]];
				var fieldOldValue = this.fieldOldValue[this.fieldName[i]];
				params += '&old_'+this.fieldId[i]+'='+encodeURIComponent(fieldOldValue);
				params += '&new_'+this.fieldId[i]+'='+encodeURIComponent(fieldNewValue);
			}
		}
		
		if (this.parent1x1 == false) {
			params = 'objName='+this.objName + '&' + this.objName+'_action=u'+params;
		}
		else {
			params = this.objName+'_action=u'+params;
		}
		
		for (ii in this.son1x1) {
			if (this.son1x1[ii].isVisible) {
				params += '&'+this.son1x1[ii].paramUpdate();
			}
		}
		return params;
	}
	
	this.doUpdate = function() {
		if (this.beforeUpdate()) {
			if (this.validateDuplicatedIds()) {
				this.readNewValues();
				this.sincPkSon();
				this.pAjax.cmd = 'update';
				this.pAjax.goAjax(this.paramUpdate());
			}
		}
	}
	
	this.doDelete = function() {
		if (this.beforeDelete()) {
			if (this.validateDuplicatedIds()) {
				this.readNewValues();
				var	param = this.paramPk();
			
				if (this.parent1x1 == false) {
					param += '&objName='+this.objName;
				}
			
				this.pAjax.cmd = 'delete';
				this.pAjax.goAjax(this.objName+'_action=d&'+param);
			}
		}
	}

	this.freezeFields = function() {
		var fieldCount = this.fieldId.length;
		for (i=0; i < fieldCount; i++) {
			var inputField = document.getElementById(this.fieldId[i]);
			inputField.setAttribute('title',inputField.value);
			if (this.parent1x1 == false || !this.fieldPk[i]) {
				inputField.setAttribute('disabled','disabled');
			}
		}
		for (i=0; i < this.sonSearch.length; i++) {
			document.getElementById(this.sonSearch[i].objName+'Bt').setAttribute('disabled','disabled');
		}
	}
	
	this.unFreezeFields = function() {
		var fieldCount = this.fieldId.length;
		for (i=0; i < fieldCount; i++) {
			var inputField = document.getElementById(this.fieldId[i]);
			inputField.removeAttribute('title');
			if (this.parent1x1 == false || !this.fieldPk[i]) {
				if (this.fieldType[i] != 'serial' && this.fieldReadonly[i] == false) {
					inputField.removeAttribute('disabled');
				}
				else {
					inputField.setAttribute('disabled','disabled');
				}
			}
		}
		for (i=0; i < this.sonSearch.length; i++) {
			document.getElementById(this.sonSearch[i].objName+'Bt').removeAttribute('disabled');
		}
		this.formFocus();
	}
	
	this.backToForms = function() {
		divForms = document.getElementById(this.objName+'_form');
		if (divForms != 'undefined') {
			divForms.style.display = 'block';
		}
		if (this.pCrudList != false) {
			this.pCrudList.hide();
		}
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após o stateChange do paCRUD
	 */
	this.onStateChange = function() {
		return true;
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado antes do doRetrieve do paCRUD,
	 * continuando somente se o retorno for true
	 *
	 * @returns boolean
	 */
	this.beforeCreate = function() {
		return true;
	}
		
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado antes do doRetrieve do paCRUD,
	 * continuando somente se o retorno for true
	 *
	 * @returns boolean
	 */
	this.beforeRetrieve = function() {
		return true;
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado antes do doUpdate do paCRUD,
	 * continuando somente se o retorno for true
	 *
	 * @returns boolean
	 */
	this.beforeUpdate = function() {
		return true;
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado antes do doDelete do paCRUD,
	 * continuando somente se o retorno for true
	 *
	 * @returns boolean
	 */
	this.beforeDelete = function() {
		return true;
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após o retrieve do paCRUD
	 */
	this.afterCreate = function() {
		//
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após o update do paCRUD
	 */
	this.afterUpdate = function() {
		//
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após o retrieve do paCRUD
	 */
	this.afterRetrieve = function() {
		return true;
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após o delete do paCRUD
	 */
	this.afterDelete = function() {
		//
	}
	
	this.hideSon1xN = function() {
		for (iSon in this.son1xN) {
			this.son1xN[iSon].hide();
		}
	}
	
	/**
	 * Sincroniza os filtros dos objetos filhos com as chaves primárias do objeto pai
	 */
	this.sincPkToSon1xN = function() {
		for (iSon in this.son1xN) {
			if (this.son1xN[iSon].pCrudList) {
				this.son1xN[iSon].pCrudList.pFilter.clearFilters();
			}
			if (this.son1xN[iSon].pSearch) {
				this.son1xN[iSon].pSearch.pFilter.clearFilters();
			}
			for (iField in this.fieldPk) {
				if (this.fieldPk[iField] == true) {
					for (iFieldSon in this.son1xN[iSon].fieldId) {
						if (this.son1xN[iSon].fieldId[iFieldSon] == this.fieldId[iField]) {
							var fieldName = this.son1xN[iSon].fieldName[iFieldSon];
						}
					}
					var fieldId = this.fieldId[iField];
					var fieldValue = document.getElementById(fieldId).value;
					if (this.son1xN[iSon].pCrudList) {
						this.son1xN[iSon].pCrudList.pFilter.addFilter(null,fieldName,'equal',fieldValue,'',false);
					}
					if (this.son1xN[iSon].pSearch) {
						this.son1xN[iSon].pSearch.pFilter.addFilter(null,fieldName,'equal',fieldValue,'',false);
					}
				}
			}
			if (this.son1xN[iSon].pCrudList) {
				this.son1xN[iSon].pCrudList.pFilter.draw();
			}
			if (this.son1xN[iSon].pSearch) {
				this.son1xN[iSon].pSearch.pFilter.draw();
			}
			var sonDivForms = document.getElementById(this.son1xN[iSon].objName+'_form');
			if (sonDivForms != undefined) {
				sonDivForms.style.display = 'none';
			}
			if (this.son1xN[iSon].pCrudList) {
				this.son1xN[iSon].pCrudList.goSearch();
			}
		}
	}
	
	/**
	 * Muda o stado do objeto crud
	 * 
	 * @param newState string: suporta new, view, edit e list
	 */
	this.stateChange = function(newState) {
		this.state = newState;
		
		if (newState == 'new' || newState == 'copy') {
			if (newState == 'new') {
				this.clear();
			}
			this.unFreezeFields();
			if (this.parent1x1 == false) {
				document.getElementById(this.objName+'_control_new').style.display  = 'block';
				document.getElementById(this.objName+'_control_view').style.display = 'none';
				document.getElementById(this.objName+'_control_edit').style.display = 'none';
			}
			this.hideSon1xN();
			if (this.parent1xN) {
				this.parent1xN.hideControls();
			}
		}		
		else if (newState == 'view') {
			this.freezeFields();
			if (this.parent1x1 == false) {
				document.getElementById(this.objName+'_control_new').style.display  = 'none';
				document.getElementById(this.objName+'_control_view').style.display = 'block';
				document.getElementById(this.objName+'_control_edit').style.display = 'none';
			}
			this.sincPkToSon1xN();
			if (this.parent1xN) {
				this.parent1xN.showControls();
			}
		}
		else if (newState == 'edit') {
			this.unFreezeFields();
			if (this.parent1x1 == false) {
				document.getElementById(this.objName+'_control_new').style.display  = 'none';
				document.getElementById(this.objName+'_control_view').style.display = 'none';
				document.getElementById(this.objName+'_control_edit').style.display = 'block';
			}
			this.hideSon1xN();
			if (this.parent1xN) {
				this.parent1xN.hideControls();
			}
		}
		else if (newState == 'list') {
			divForms = document.getElementById(this.objName+'_form');
			
			if (divForms != undefined && divForms != null) {
				divForms.style.display = 'none';
				
				if (this.pCrudList == false) {
					if (this.parent1x1 == false) {
						alert(this.objName+': '+'Listagem não disponível');
					}
				}
				else {
					this.pCrudList.goSearch();
				}
			}
			else {
				alert(this.objName+': ('+this.objName+'_form'+') '+'Formulário não encontrado');
			}
			
			this.hideSon1xN();
			if (this.parent1xN) {
				this.parent1xN.showControls();
			}
		}
		else {
			var msg = gettext('Estado desconhecido para objeto paCRUD: stateChange(\'"%newState%"\')');
			msg = msg.replace('%newState%',newState);
			alert(msg);
		}
		
		for (i in this.son1x1) {
			this.son1x1[i].stateChange(newState);
		}
		
		for (iSon in this.son1xN) {
			divConteiner = document.getElementById(this.son1xN[iSon].objName+'_conteiner');
			if (divConteiner != undefined && divConteiner != null) {
				if (newState == 'view') {
					divConteiner.style.display = 'block';
				}
				else {
					divConteiner.style.display = 'none';
				}
			}
		}
		
		this.onStateChange();
	}
	
	/**
	 * Evento reservado para implementação pelo desenvolvedor da aplicação, disparado após a validação de notNull
	 */
	this.preValidate = function() {
		return true;
	}
	
	/**
	 * Valida formato dos campos
	 */
	this.errValidateType = function() {
		var err = '';
		var regex = /[^0-9,-]/;
		
		var value = '';
		for (i in this.fieldName) {
			fieldValue = this.fieldNewValue[this.fieldName[i]];
			if (fieldValue != '') {
				
				// inteiro
				if (this.fieldType[i] == 'integer') {
					if (regex.test(fieldValue)) {
						var msg = '- '+gettext('"%fieldValue%" não é um número inteiro, campo "%fieldLabel%"')+'.\n'
						msg = msg.replace('%fieldLabel%',this.fieldLabel[i]);
						err += msg.replace('%fieldValue%',fieldValue);
					}
				}
				
				// date
				if (this.fieldType[i] == 'date') {
					if (!isDate(fieldValue)) {
						var msg = '- '+gettext('"%fieldValue%" não é uma data válida, campo "%fieldLabel%"')+'.\n'
						msg = msg.replace('%fieldLabel%',this.fieldLabel[i]);
						err += msg.replace('%fieldValue%',fieldValue);
					}
				}
			}
			
		}
		
		for (ii in this.son1x1) {
			if (this.fieldNewValue[this.son1x1[ii].parent1x1Condition['fieldName']] == this.son1x1[ii].parent1x1Condition['value'] || this.son1x1[ii].parent1x1Condition['fieldName'] == '') {
				err += this.son1x1[ii].errValidateType();
			}
		}
		
		return err;
	}
	
	/**
	 * Valida campos notNull
	 */
	this.errValidateNotNull = function() {
		this.readNewValues();
		var err = '';
		for (i in this.fieldName) {
			if (this.fieldNotNull[i] && this.fieldNewValue[this.fieldName[i]] == '') {
				var msg = '- '+gettext('Campo "%fieldLabel%" não pode ficar em branco')+'.\n'
				err += msg.replace('%fieldLabel%',this.fieldLabel[i]);
			}
		}
		
		for (ii in this.son1x1) {
			if (this.fieldNewValue[this.son1x1[ii].parent1x1Condition['fieldName']] == this.son1x1[ii].parent1x1Condition['value'] || this.son1x1[ii].parent1x1Condition['fieldName'] == '') {
				err += this.son1x1[ii].errValidateNotNull();
			}
		}
		
		return err;
	}
	
	this.validateNotNull = function() {
		err = this.errValidateNotNull();
		err += this.errValidateType();
		
		if (err == '') {
			return this.preValidate();
		}
		else {
			alert(err);
			this.focusNotNull();
			return false;
		}
	}

	this.focusNotNull = function() {
		var fucusOk = false;
		for (i in this.fieldName) {
			if (this.fieldNotNull[i] && this.fieldNewValue[this.fieldName[i]] == '') {
				if (this.parent1x1 == false || !this.fieldPk[i]) {
					document.getElementById(this.fieldId[i]).focus();
					fucusOk = true;
					break;
				}
			}
		}
		for (ii in this.son1x1) {
			if (fucusOk == false && this.son1x1[ii].isVisible) {
				this.son1x1[ii].focusNotNull();
			}
		}
	}
	
	this.formFocus = function() {
		if (this.parent1x1 == false) {
			for (i in this.fieldName) {
				inputField = document.getElementById(this.fieldId[i]);
				if (inputField.getAttribute('disabled') != 'disabled') {
					inputField.focus();
					break;
				}
			}
		}
	}
	
	this.bt_write_new = function() {
		if (this.validateNotNull()) {
			this.doCreate();
		}
		this.visibleSon1x1();
	}
	
	this.bt_search = function() {
		if (this.pCrudList == false) {
			this.pSearch.goSearch();
		}
		else {
			this.stateChange('list');
		}
	}
	
	this.bt_write_edit = function() {
		if (this.validateNotNull()) {
			this.doUpdate();
		}
	}
	
	this.bt_cancel_edit = function() {
		this.pAjax.ajaxXmlOk();
	}
	
	this.bt_edit = function() {
		this.stateChange('edit');
	}
	
	this.bt_delete = function() {
		if(confirm(gettext('Confirma a exclusão do registro?'))){
			this.doDelete();
			this.stateChange('new');
		}
	}
	
	this.bt_new = function() {
		if (this.pCrudList) {
			this.pCrudList.hide();
		}
		this.backToForms();
		this.stateChange('new');
		this.visibleSon1x1();
	}
	
	this.bt_list = function() {
		this.stateChange('list');
	}
	
	this.bt_copyFrom = function() {
		this.pSearch.goSearch();
	}
	
	this.hide = function() {
		document.getElementById(this.objName+'_form').style.display = 'none';
		if (this.pCrudList) {
			document.getElementById('pCrudList_'+this.objName).style.display = 'none';
		}
	}
	
	/**
	 * Torna visível os controles do crud
	 */
	this.showControls = function() {
		if (document.getElementById(this.objName+'_controls') == undefined) {
			alert('Botões de controle não encontrado para objeto "'+this.objName+'".');
		}
		else {
			document.getElementById(this.objName+'_controls').style.display = 'block';
		}
	}
	
	/**
	 * Torna invisível os controles do crud
	 */
	this.hideControls = function() {
		document.getElementById(this.objName+'_controls').style.display = 'none';
	}
}
