
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

function classCode() {
	this.state = 'coding';
	this.session = '';
	this.lineIndex = 3;
	this.lastKeyCode = 0;
	this.objCount = 0;
	
	this.init = function() {
		this.btPacrud = document.getElementById('btPacrud');
		this.btPacrudSearch = document.getElementById('btPacrudSearch');
		this.btPacrudList = document.getElementById('btPacrudList');
		
		this.divPacrud = document.getElementById('div_pacrud');
		this.divPacrudMaisOpcoes = document.getElementById('div_pacrud_mais_opcoes');
		this.divPacrudField = document.getElementById('div_pacrud_field');
		this.divPacrudFieldMaisOpcoes = document.getElementById('div_pacrud_field_mais_opcoes');
		this.divPacrudSearch = document.getElementById('div_pacrud_search');
		this.divPacrudSearchMaisOpcoes = document.getElementById('div_pacrud_search_mais_opcoes');
		this.divPacrudSearchField = document.getElementById('div_pacrud_search_field');
		
		this.btPacrudMaisOpcoes = document.getElementById('bt_pacrud_mais_opcoes');
		this.btPacrudFieldMaisOpcoes = document.getElementById('bt_pacrud_field_mais_opcoes');
		this.btPacrudSearchMaisOpcoes = document.getElementById('bt_pacrud_search_mais_opcoes');
		
		this.textarea = document.getElementById('pacrud_code');
		this.textarea.parent = this;
		this.textarea.ondblclick = function() {
			if (this.parent.state == 'coding') {
				switch (this.parent.session) {
					case 'paCRUD':
						this.parent.editPacrud();
						break;
					case 'paCRUDField':
						this.parent.editPacrudField();
						break;
					case 'pacrudSearch':
						this.parent.editPacrudSearch();
						break;
					case 'pacrudSearchField':
						this.parent.editPacrudSearchField();
						break;
					case 'pacrudList':
						this.parent.editPacrudSearch();
						break;
					case 'pacrudListField':
						this.parent.editPacrudSearchField();
						break;
				}				
			}
		}
		this.textarea.onclick = function() {
			if (this.parent.state == 'coding') {
				this.parent.navigate();
			}
		}
		this.textarea.onkeyup = function() {
			if (this.parent.state == 'coding') {
				this.parent.navigate();
				if (this.parent.lastKeyCode == 13) {
					var lastSession = 	this.parent.getSessionLine(this.parent.getLineIndexCursor()-1);
					
					if (lastSession == 'paCRUD' || lastSession == 'paCRUDField') {
						this.parent.clearPacrudField();
						this.parent.showPacrudFieldEdit();
					}
					if (lastSession == 'pacrudSearch' || lastSession == 'pacrudSearchField' || lastSession == 'pacrudList' || lastSession == 'pacrudListField') {
						this.parent.clearPacrudSearchField();
						this.parent.showPacrudSearchFieldEdit();
					}
				}
			}
		}
		this.textarea.onkeydown = function(event) {
			if (this.parent.state == 'coding') {
				this.parent.lastKeyCode = event.keyCode;
				document.getElementById('lastKeyCode').value = this.parent.lastKeyCode;
			}
		}
	}
	
	this.btPacrud_click = function() {
		this.objName = '';
		this.showPacrudNew();
		document.getElementById('pacrud_obj_name').focus();
	}
	
	this.btPacrudOk_click = function() {
		var objName = document.getElementById('pacrud_obj_name').value;
		if (this.state == 'newPacrud' && objName != '') {
			var arrLine = explode("\n",this.textarea.value);
			arrLine[this.lineIndex] += "\n$" + objName + '->addField(\'name=,notNull\');\n';
			if (this.objCount == 0) {
				arrLine[this.lineIndex] += "\n$" + objName + '->autoInit();';
			}
			
			var newCode = "";
			for (i in arrLine) {
				if (newCode != '') {
					newCode += "\n";
				}
				newCode += arrLine[i];
			}
			
			this.textarea.value = newCode;
		}
		
		this.stateChange('coding');
		this.divPacrud.style.display = 'none';
	}
	
	this.btPacrudFieldOk_click = function() {
		this.stateChange('coding');
		this.divPacrudField.style.display = 'none';
	}
	
	this.btPacrudMaisOpcoes_click = function() {
		this.btPacrudMaisOpcoes.setAttribute('disabled','disabled');
		this.divPacrudMaisOpcoes.style.display = 'block';
	}
	
	this.btPacrudSearchMaisOpcoes_click = function() {
		this.btPacrudSearchMaisOpcoes.setAttribute('disabled','disabled');
		this.divPacrudSearchMaisOpcoes.style.display = 'block';
	}
	
	this.btPacrudAddFieldOk_click = function() {
		this.stateChange('coding');
		this.divPacrudField.style.display = 'none';
	}
	
	this.btPacrudFieldMaisOpcoes_click = function() {
		this.btPacrudFieldMaisOpcoes.setAttribute('disabled','disabled');
		this.divPacrudFieldMaisOpcoes.style.display = 'block';
	}
	
	this.btPacrudSearch_click = function() {
		this.showPacrudSearchNew();
	}
	
	this.btPacrudSearchOk_click = function() {
		var objName = document.getElementById('pacrud_search_obj_name').value;
		if ((this.state == 'newPacrudSearch' || this.state == 'newPacrudList') && objName != '') {
			var arrLine = explode("\n",this.textarea.value);
			arrLine[this.lineIndex] += "\n$" + objName + '->addField(\'name=\');\n';
			if (this.objCount == 0) {
				arrLine[this.lineIndex] += "\n$" + objName + '->autoInit();';
			}
			
			var newCode = "";
			for (i in arrLine) {
				if (newCode != '') {
					newCode += "\n";
				}
				newCode += arrLine[i];
			}
			
			this.textarea.value = newCode;
		}
		
		this.stateChange('coding');
		this.divPacrudSearch.style.display = 'none';
	}
	
	this.btPacrudSearchFieldOk_click = function() {
		this.stateChange('coding');
		this.divPacrudSearchField.style.display = 'none';
	}
	
	this.btPacrudList_click = function() {
		this.showPacrudListNew();
	}
	
	this.editPacrud = function() {
		this.clearPacrud();
		this.readPacrudLine(this.getLineCursor());
		this.showPacrudEdit();
	}
	
	this.getObjName = function(textLine) {
		if (textLine != '') {
			this.objName = textLine.substr(0, textLine.indexOf("->addField(")).replace('$','').trim();
			if (this.objName == '') {
				this.objName = textLine.substr(0, textLine.indexOf("->autoInit(")).replace('$','').trim();
			}
			if (this.objName == '') {
				this.objName = textLine.substr(0, textLine.indexOf("= new")).replace('$','').trim();
			}
			document.getElementById('objName').value = this.objName;
			return this.objName;
		}
	}
	
	/**
	 * Lê uma linha de declaração de um objeto paCRUD e preenche os campos do formulário
	 */
	this.readPacrudLine = function(textLine) {
		var text = textLine.substr(textLine.indexOf("paCRUD('")+8, textLine.length - textLine.indexOf("paCRUD('")+8);
		var text = text.replace("');","");
		var param = explode(',',text);
		
		document.getElementById('pacrud_obj_name').value = this.objName;
		document.getElementById('pacrud_capslock').checked = false;
		document.getElementById('pacrud_drawform').checked = false;
		document.getElementById('pacrud_autoclick').checked = false;
		document.getElementById('pacrud_debug').checked = false;
		
		for (i in param) {
			var paramPart = explode('=',param[i]);
			var paramName = paramPart[0].trim();
			if (paramPart[1] == undefined) {
				paramValue = '';
			}
			else {
				paramValue = paramPart[1].trim();
			}
						
			switch (paramName.toLowerCase()) {
				case 'title':
					document.getElementById('pacrud_title').value = paramValue;
				break;
				case 'schema':
					document.getElementById('pacrud_schema').value = paramValue;
				break;
				case 'tablename':
					document.getElementById('pacrud_tablename').value = paramValue;
				break;
				case 'routine':
					document.getElementById('pacrud_routine').value = paramValue;
				break;
				case 'capslock':
					document.getElementById('pacrud_capslock').checked = true;
				break;
				
				case 'parent1xn':
					document.getElementById('pacrud_parent_type').value = '1xN';
					document.getElementById('pacrud_name_parent1xn').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'pagelines':
					document.getElementById('pacrud_pagelines').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'permission':
					document.getElementById('pacrud_permission').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'includehead':
					document.getElementById('pacrud_include_head').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'includefooter':
					document.getElementById('pacrud_include_footer').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'onduplicate':
					document.getElementById('pacrud_onduplicate').value = paramValue;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'list':
					if (paramValue == 'false') {
						document.getElementById('pacrud_list').checked = false;
					}
					else {
						document.getElementById('pacrud_list').checked = true;
					}
					this.btPacrudMaisOpcoes_click();
				break;
				case 'drawform':
					document.getElementById('pacrud_drawform').checked = true;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'autoclick':
					document.getElementById('pacrud_autoclick').checked = true;
					this.btPacrudMaisOpcoes_click();
				break;
				case 'debug':
					document.getElementById('pacrud_debug').checked = true;
					this.btPacrudMaisOpcoes_click();
				break;
			}
		}
		
		// trata relacionamento 1x1
		var lineIndex1x1 = this.getLineIndex1x1();
		if (lineIndex1x1 > -1) {
			var text1x1 = this.getLine(lineIndex1x1);
			var text = text1x1.substr(text1x1.indexOf("->addParent1x1(")+15, textLine.length - textLine.indexOf("->addParent1x1(")+15);
			text1x1 = text;
			text = text1x1.replace(");","");
			var param = explode(',',text);
			
			document.getElementById('pacrud_parent_type').value = '1x1';
			this.btPacrudMaisOpcoes_click();
			this.parentTypeChange('1x1');
			
			document.getElementById('pacrud_name_parent1x1').value = replaceAll(param[0], "$","");
			document.getElementById('pacrud_parent_field_condition').value = replaceAll(param[1], "'","");
			document.getElementById('pacrud_condition_value').value = replaceAll(param[2], "'","");
		}
	}
	
	this.editPacrudField = function() {
		this.clearPacrudField();
		this.readPacrudFieldLine(this.getLineCursor());
		this.showPacrudFieldEdit();
	}
	
	/**
	 * Lê uma linha de adicão de campo de um objeto paCRUD e preenche os campos do formulário
	 */
	this.readPacrudFieldLine = function(textLine) {
		var text = textLine.substr(textLine.indexOf("->addField('")+12, textLine.length - textLine.indexOf("->addField('")+12);
		var text = text.replace("');","");
		
		var param = explode(',',text);
		
		document.getElementById('pacrud_field_type').value = 'string';
		document.getElementById('pacrud_field_notnull').checked = false;
		document.getElementById('pacrud_field_readonly').checked = false;
		document.getElementById('pacrud_field_capslock').checked = false;			
		document.getElementById('pacrud_field_virtual').checked = false;
		document.getElementById('pacrud_field_nocreate').checked = false;
		document.getElementById('pacrud_field_nohtml').checked = false;
		
		for (i in param) {
			var paramPart = explode('=',param[i]);
			var paramName = paramPart[0].trim();
			if (paramPart[1] == undefined) {
				paramValue = '';
			}
			else {
				paramValue = paramPart[1].trim();
			}
						
			switch (paramName.toLowerCase()) {
				case 'pk':
					document.getElementById('pacrud_field_pk').checked = true;
				break;
				case 'name':
					document.getElementById('pacrud_field_name').value = paramValue;
				break;
				case 'label':
					document.getElementById('pacrud_field_label').value = paramValue;
				break;
				case 'type':
					document.getElementById('pacrud_field_type').value = paramValue;
				break;
				case 'size':
					document.getElementById('pacrud_field_size').value = paramValue;
				break;
				case 'notnull':
					document.getElementById('pacrud_field_notnull').checked = true;
				break;
				case 'visible':
					if (paramValue.toLowerCase() == 'false') {
						document.getElementById('pacrud_field_visible').checked = false;
					}
					else {
						document.getElementById('pacrud_field_visible').checked = true;
					}
				break;
				case 'readonly':
					document.getElementById('pacrud_field_readonly').checked = true;
				break;
				case 'capslock':
					document.getElementById('pacrud_field_capslock').checked = true;
				break;
				
				case 'fieldid':
					document.getElementById('pacrud_field_fieldid').value = paramValue;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'search':
					document.getElementById('pacrud_field_search').value = paramValue;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'order':
					document.getElementById('pacrud_field_order').value = paramValue;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'default':
					document.getElementById('pacrud_field_default').value = paramValue;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'virtual':
					document.getElementById('pacrud_field_virtual').checked = true;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'nocreate':
					document.getElementById('pacrud_field_nocreate').checked = true;
					this.btPacrudFieldMaisOpcoes_click();
				break;
				case 'nohtml':
					document.getElementById('pacrud_field_nohtml').checked = true;
					this.btPacrudFieldMaisOpcoes_click();
				break;
			}
		}
	}
	
	this.editPacrudSearch = function() {
		this.clearPacrudSearch();
		this.readPacrudSearchLine(this.getLineCursor());
		this.showPacrudSearchEdit();
	}
	
	/**
	 * Lê uma linha de declaração de um objeto pacrudSearch e preenche os campos do formulário
	 */
	this.readPacrudSearchLine = function(textLine) {
		var text = textLine.substr(textLine.indexOf("pacrudSearch('")+14, textLine.length - textLine.indexOf("pacrudSearch('")+14);
		var text = text.replace("');","");
		var param = explode(',',text);
		
		document.getElementById('pacrud_search_obj_name').value = this.objName;
		document.getElementById('pacrud_search_obj_modal').checked = false;
		document.getElementById('pacrud_search_obj_autofilter').checked = true;
		document.getElementById('pacrud_search_obj_debug').checked = false;
		
		for (i in param) {
			var paramPart = explode('=',param[i]);
			var paramName = paramPart[0].trim();
			if (paramPart[1] == undefined) {
				paramValue = '';
			}
			else {
				paramValue = paramPart[1].trim();
			}
			
			switch (paramName.toLowerCase()) {
				case 'title':
					document.getElementById('pacrud_search_obj_title').value = paramValue;
				break;
				case 'schema':
					document.getElementById('pacrud_search_obj_schema').value = paramValue;
				break;
				case 'tablename':
					document.getElementById('pacrud_search_obj_tablename').value = paramValue;
				break;
				case 'pagelines':
					document.getElementById('pacrud_search_obj_pagelines').value = paramValue;
				break;
				case 'modal':
					document.getElementById('pacrud_search_obj_modal').checked = true;
					this.btPacrudSearchMaisOpcoes_click();
				break;
				case 'autofilter':
					if (paramValue.toLowerCase() == 'false') {
					document.getElementById('pacrud_search_obj_autofilter').checked = false;
					}
					else {
					document.getElementById('pacrud_search_obj_autofilter').checked = true;
					}
					this.btPacrudSearchMaisOpcoes_click();
				break;
				case 'debug':
					document.getElementById('pacrud_search_obj_debug').checked = true;
					this.btPacrudSearchMaisOpcoes_click();
				break;
			}
		}
	}
	
	this.editPacrudSearchField = function() {
		this.clearPacrudSearchField();
		this.readPacrudSearchFieldLine(this.getLineCursor());
		this.showPacrudSearchFieldEdit();
	}
	
	/**
	 * Lê uma linha de adicão de campo de um objeto pacrudSearch e preenche os campos do formulário
	 */
	this.readPacrudSearchFieldLine = function(textLine) {
		var text = textLine.substr(textLine.indexOf("->addField('")+12, textLine.length - textLine.indexOf("->addField('")+12);
		var text = text.replace("');","");
		
		var param = explode(',',text);
		
		document.getElementById('pacrud_search_field_pk').checked = false;
		document.getElementById('pacrud_search_field_visible').checked = true;
		
		for (i in param) {
			var paramPart = explode('=',param[i]);
			var paramName = paramPart[0].trim();
			if (paramPart[1] == undefined) {
				paramValue = '';
			}
			else {
				paramValue = paramPart[1].trim();
			}
			
			switch (paramName.toLowerCase()) {
				case 'pk':
					document.getElementById('pacrud_search_field_pk').checked = true;
				break;
				case 'name':
					document.getElementById('pacrud_search_field_name').value = paramValue;
				break;
				case 'label':
					document.getElementById('pacrud_search_field_label').value = paramValue;
				break;
				case 'type':
					document.getElementById('pacrud_search_field_type').value = paramValue;
				break;
				case 'visible':
					if (paramValue.toLowerCase() == 'false') {
						document.getElementById('pacrud_search_field_visible').checked = false;
					}
					else {
						document.getElementById('pacrud_search_field_visible').checked = true;
					}
				break;
			}
		}
	}
	
	this.writePacrud = function() {
		var objName = document.getElementById('pacrud_obj_name').value;
		var title = document.getElementById('pacrud_title').value;
		var schema = document.getElementById('pacrud_schema').value;
		var tableName = document.getElementById('pacrud_tablename').value;
		var routine = document.getElementById('pacrud_routine').value;
		var capsLock = document.getElementById('pacrud_capslock').checked;
		
		var parentType = document.getElementById('pacrud_parent_type').value;
		var nameParent1x1 = document.getElementById('pacrud_name_parent1x1').value;
		var parentFieldCondition = document.getElementById('pacrud_parent_field_condition').value;
		var conditionValue = document.getElementById('pacrud_condition_value').value;
		var nameParent1xn = document.getElementById('pacrud_name_parent1xn').value;
		var pagelines = document.getElementById('pacrud_pagelines').value;
		var permission = document.getElementById('pacrud_permission').value;
		var includeHead = document.getElementById('pacrud_include_head').value;
		var includeFooter = document.getElementById('pacrud_include_footer').value;
		var onDuplicate = document.getElementById('pacrud_onduplicate').value;
		var list = document.getElementById('pacrud_list').checked;
		var drawForm = document.getElementById('pacrud_drawform').checked;
		var autoClick = document.getElementById('pacrud_autoclick').checked;
		var debug = document.getElementById('pacrud_debug').checked;		
		
		if (objName == '') {
			alert('É necessário informar o nome do objeto.');
			document.getElementById('pacrud_obj_name').focus();
		}
		else {
			if (this.objName != '' && objName != this.objName) {
				var newText = replaceAll(this.textarea.value, '$'+this.objName, '$'+objName);
				this.textarea.value = newText;
				this.objName = objName;
			}
			
			var codeLine = '$'+objName+' = new paCRUD(\'';
			codeLine += 'tableName='+tableName;
			if (schema != '') codeLine += ',schema='+schema;
			if (title != '') codeLine += ',title='+title;
			if (routine != '') codeLine += ',routine='+routine;
			if (capsLock) codeLine += ',capsLock';
			
			if (parentType == '1xN') codeLine += ',parent1xN='+nameParent1xn;
			this.parentTypeChange(parentType);
			
			if (pagelines != '') codeLine += ',pageLines='+pagelines;
			if (permission != '') codeLine += ',permission='+permission;
			if (includeHead != '') codeLine += ',includeHead='+includeHead;
			if (includeFooter != '') codeLine += ',includeFooter='+includeFooter;
			if (onDuplicate != '') codeLine += ',onDuplicate='+onDuplicate;
			if (list == false) codeLine += ',list=false';
			if (drawForm) codeLine += ',drawForm';
			if (autoClick) codeLine += ',autoClick';
			if (debug) codeLine += ',debug';
			
			codeLine += '\');'
			
			this.replaceTextboxLine(codeLine, this.lineIndex);
			
			//Trata relacionamento 1x1
			if (nameParent1x1 != '') {
				var line1x1 = this.getLineIndex1x1();
				if (line1x1 == -1) {
					this.addLine1x1();
					line1x1 = this.getLineIndex1x1();
				}
				
				codeLine = '$'+this.objName+'->addParent1x1($'+nameParent1x1+',\''+parentFieldCondition+'\',\''+conditionValue+'\');';
				
				this.replaceTextboxLine(codeLine, line1x1);
			}
		}
	}
	
	this.replaceTextboxLine = function(newTextLine, lineIndex=-1) {		
		var arrLine = explode("\n",this.textarea.value);
		arrLine[lineIndex] = newTextLine;
		
		var newCode = "";
		for (i in arrLine) {
			if (newCode != '') {
				newCode += "\n";
			}
			newCode += arrLine[i];
		}
		
		this.textarea.value = newCode;
	}
	
	this.getLineIndex1x1 = function() {
		var arrLine = explode("\n",this.textarea.value);
		for (i in arrLine) {
			if (arrLine[i].indexOf(this.objName+'->addParent1x1' ) > -1) {
				return i;
			}
		}
		return -1;
	}
	
	this.addLine1x1 = function() {
		var lastLineObject = -1;
		
		var arrLine = explode("\n",this.textarea.value);
		for (i in arrLine) {
			var startLine = arrLine[i].trim().substr(1,this.objName.length);
			if (startLine == this.objName && arrLine[i].indexOf('autoInit(') == -1) {
				lastLineObject = i;
			}
		}
		
		if (lastLineObject > -1) {
			lastLineObject++;
			var oldLineCode = this.getLine(lastLineObject);
			var newLineCode = '$'+this.objName+'->addParent1x1'+"\n"+oldLineCode;
			this.replaceTextboxLine(newLineCode,lastLineObject);
		}
	}
	
	this.writePacrudField = function() {		
		var name = document.getElementById('pacrud_field_name').value;
		var pk = document.getElementById('pacrud_field_pk').checked;
		var label = document.getElementById('pacrud_field_label').value;
		var type = document.getElementById('pacrud_field_type').value;
		var size = document.getElementById('pacrud_field_size').value;
		var notNull = document.getElementById('pacrud_field_notnull').checked;
		var visible = document.getElementById('pacrud_field_visible').checked;
		var readonly = document.getElementById('pacrud_field_readonly').checked;
		var capsLock = document.getElementById('pacrud_field_capslock').checked;
		
		var fieldId = document.getElementById('pacrud_field_fieldid').value;
		var pSearch = document.getElementById('pacrud_field_search').value;
		var order = document.getElementById('pacrud_field_order').value;
		var pDefault = document.getElementById('pacrud_field_default').value;
		var virtual = document.getElementById('pacrud_field_virtual').checked;
		var nocreate = document.getElementById('pacrud_field_nocreate').checked;
		var nohtml = document.getElementById('pacrud_field_nohtml').checked;
		
		if (name == '') {
			alert('É necessário informar o nome do campo.');
			document.getElementById('pacrud_field_name').focus();
		}
		else {
			var codeLine = '$'+this.objName+'->addField(\'';
			codeLine += 'name='+name;
			if (fieldId != '') codeLine += ',fieldId='+fieldId;
			if (label != '') codeLine += ',label='+label;
			if (pk) codeLine += ',pk';
			if (type != '' && type != 'string') codeLine += ',type='+type;
			if (size != '') codeLine += ',size='+size;
			if (notNull) codeLine += ',notNull';
			if (visible == false) codeLine += ',visible=false';
			if (readonly) codeLine += ',readonly';
			if (capsLock) codeLine += ',capsLock';
			if (pSearch != '') codeLine += ',search='+pSearch;
			if (order != '') codeLine += ',order='+order;
			if (pDefault != '') codeLine += ',default='+pDefault;
			if (virtual) codeLine += ',virtual';
			if (nocreate) codeLine += ',noCreate';
			if (nohtml) codeLine += ',nohtml';
			codeLine += '\');'
			
			this.replaceTextboxLine(codeLine, this.lineIndex);
		}
	}
	
	this.writePacrudSearch = function() {
		var objName = document.getElementById('pacrud_search_obj_name').value;
		var title = document.getElementById('pacrud_search_obj_title').value;
		var schema = document.getElementById('pacrud_search_obj_schema').value;
		var tableName = document.getElementById('pacrud_search_obj_tablename').value;
		var pageLines = document.getElementById('pacrud_search_obj_pagelines').value;
		if (document.getElementById('pacrud_search_obj_modal').checked) {
			var modal = true;
		}
		else {
			var modal = false;
		}
		if (document.getElementById('pacrud_search_obj_autofilter').checked) {
			var autoFilter = true;
		}
		else {
			var autoFilter = false;
		}
		if (document.getElementById('pacrud_search_obj_debug').checked) {
			var debug = true;
		}
		else {
			var debug = false;
		}
		
		if (objName == '') {
			alert('É necessário informar o nome do objeto.');
			document.getElementById('pacrud_search_obj_name').focus();
		}
		else {
			if (this.objName != '' && objName != this.objName) {
				var newText = replaceAll(this.textarea.value, '$'+this.objName, '$'+objName);
				this.textarea.value = newText;
				this.objName = objName;
			}
			
			if (this.state == 'newPacrudSearch' || this.state == 'editPacrudSearch') {
				var codeLine = '$'+objName+' = new pacrudSearch(\'';
			}
			
			if (this.state == 'newPacrudList' || this.state == 'editPacrudList') {
				var codeLine = '$'+objName+' = new pacrudList(\'';
			}
			
			codeLine += 'tableName='+tableName;
			if (schema != '') codeLine += ',schema='+schema;
			if (title != '') codeLine += ',title='+title;
			if (pageLines != '') codeLine += ',pageLines='+pageLines;

			if (modal) codeLine += ',modal';
			if (autoFilter == false) codeLine += ',autoFilter=false';
			if (debug) codeLine += ',debug';
			
			codeLine += '\');'
			
			this.replaceTextboxLine(codeLine, this.lineIndex);
		}
	}
	
	this.writePacrudSearchField = function() {		
		var pk = document.getElementById('pacrud_search_field_pk').checked;
		var name = document.getElementById('pacrud_search_field_name').value;
		var label = document.getElementById('pacrud_search_field_label').value;
		var type = document.getElementById('pacrud_search_field_type').value;
		var visible = document.getElementById('pacrud_search_field_visible').checked;
		
		if (name == '') {
			alert('É necessário informar o nome do campo.');
			document.getElementById('pacrud_search_field_name').focus();
		}
		else {
			var codeLine = '$'+this.objName+'->addField(\'';
			codeLine += 'name='+name;
			if (pk) codeLine += ',pk';
			if (label != '') codeLine += ',label='+label;
			if (type != '' && type != 'string') codeLine += ',type='+type;
			if (visible == false) codeLine += ',visible=false';
			codeLine += '\');'
		
			this.replaceTextboxLine(codeLine, this.lineIndex);
		}
	}
	
	this.parentTypeChange = function(parentType) {
		if (parentType == '1x1') {
			document.getElementById('crudObjCrud1x1_form').style.display = 'block';
			document.getElementById('crudObjCrud1xn_form').style.display = 'none';
		}
		else if (parentType == '1xN') {
			document.getElementById('crudObjCrud1x1_form').style.display = 'none';
			document.getElementById('crudObjCrud1xn_form').style.display = 'block';
		}
		else {
			document.getElementById('crudObjCrud1x1_form').style.display = 'none';
			document.getElementById('crudObjCrud1xn_form').style.display = 'none';
		}
	}
	
	this.stateChange = function(newState) {
		hideOtherCode();
		if (newState == 'coding') {
			this.textarea.removeAttribute('readonly');
			this.textarea.focus();
			this.navigate();
			
			if (this.getLineCursor() == '') {
				this.unFreezeBtClass();
			}
		}
		else {
			this.freezeBtClass();
			this.textarea.setAttribute('readonly','readonly');
			this.lastKeyCode = 0;
		}
		this.state = newState;
		document.getElementById('state').value = this.state;
	}
	
	this.showPacrudEdit = function() {
		this.stateChange('editPacrud');
		this.divPacrud.style.display = 'block';
		document.getElementById('pacrud_obj_name').focus();
	}
	
	this.showPacrudNew = function() {
		this.stateChange('newPacrud');
		this.clearPacrud();
		this.divPacrud.style.display = 'block';
		this.divPacrudMaisOpcoes.style.display = 'none';
		this.btPacrudMaisOpcoes.removeAttribute('disabled');
		document.getElementById('pacrud_obj_name').focus();	
	}
	
	this.clearPacrud = function() {
		this.divPacrudMaisOpcoes.style.display = 'none';
		this.btPacrudMaisOpcoes.removeAttribute('disabled');
		
		document.getElementById('pacrud_obj_name').value = '';
		document.getElementById('pacrud_title').value = '';
		document.getElementById('pacrud_schema').value = '';
		document.getElementById('pacrud_tablename').value = '';
		document.getElementById('pacrud_routine').value = '';
		document.getElementById('pacrud_capslock').checked = false;
		
		document.getElementById('pacrud_parent_type').value = '';
		document.getElementById('pacrud_name_parent1x1').value = '';
		document.getElementById('pacrud_parent_field_condition').value = '';
		document.getElementById('pacrud_condition_value').value = '';
		document.getElementById('pacrud_name_parent1xn').value = '';
		document.getElementById('pacrud_pagelines').value = '';
		document.getElementById('pacrud_permission').value = '';
		document.getElementById('pacrud_include_head').value = '';
		document.getElementById('pacrud_include_footer').value = '';
		document.getElementById('pacrud_onduplicate').value = '';
		document.getElementById('pacrud_list').checked = true;
		document.getElementById('pacrud_drawform').checked = false;
		document.getElementById('pacrud_autoclick').checked = false;
		document.getElementById('pacrud_debug').checked = false;
	}
	
	this.showPacrudFieldEdit = function() {
		this.stateChange('editPacrudField');
		this.divPacrudField.style.display = 'block';
		document.getElementById('pacrud_field_name').focus();
	}
	
	this.clearPacrudField = function() {
		this.divPacrudFieldMaisOpcoes.style.display = 'none';
		this.btPacrudFieldMaisOpcoes.removeAttribute('disabled');
		
		document.getElementById('pacrud_field_name').value = '';
		document.getElementById('pacrud_field_pk').checked = false;
		document.getElementById('pacrud_field_label').value = '';
		document.getElementById('pacrud_field_type').value = '';
		document.getElementById('pacrud_field_size').value = '';
		document.getElementById('pacrud_field_notnull').checked = true;
		document.getElementById('pacrud_field_visible').checked = true;
		document.getElementById('pacrud_field_readonly').checked = false;
		document.getElementById('pacrud_field_capslock').checked = false;
		
		document.getElementById('pacrud_field_fieldid').value = '';
		document.getElementById('pacrud_field_search').value = '';
		document.getElementById('pacrud_field_order').value = '';
		document.getElementById('pacrud_field_default').value = '';
		document.getElementById('pacrud_field_virtual').checked = false;
		document.getElementById('pacrud_field_nocreate').checked = false;
		document.getElementById('pacrud_field_nohtml').checked = false;
	}
	
	this.showPacrudSearchEdit = function() {
		this.stateChange('editPacrudSearch');
		this.divPacrudSearch.style.display = 'block';
		document.getElementById('pacrud_search_obj_name').focus();
	}
	
	this.showPacrudSearchNew = function() {
		this.stateChange('newPacrudSearch');
		this.clearPacrudSearch();
		this.divPacrudSearch.style.display = 'block';
		document.getElementById('pacrud_search_obj_name').focus();
	}
	
	this.showPacrudListNew = function() {
		this.stateChange('newPacrudList');
		this.clearPacrudSearch();
		this.divPacrudSearch.style.display = 'block';
		document.getElementById('pacrud_search_obj_name').focus();
	}
	
	this.clearPacrudSearch = function() {
		this.divPacrudSearchMaisOpcoes.style.display = 'none';
		this.btPacrudSearchMaisOpcoes.removeAttribute('disabled');
		
		document.getElementById('pacrud_search_obj_name').value = '';
		document.getElementById('pacrud_search_obj_title').value = '';
		document.getElementById('pacrud_search_obj_schema').value = '';
		document.getElementById('pacrud_search_obj_tablename').value = '';
		document.getElementById('pacrud_search_obj_pagelines').value = '';
		document.getElementById('pacrud_search_obj_modal').checked = false;
		document.getElementById('pacrud_search_obj_autofilter').checked = true;
		document.getElementById('pacrud_search_obj_debug').checked = false;
	}
	
	this.showPacrudSearchFieldEdit = function() {
		this.stateChange('editPacrudSearchField');
		this.divPacrudSearchField.style.display = 'block';
		document.getElementById('pacrud_search_field_name').focus();
	}
	
	this.clearPacrudSearchField = function() {
		document.getElementById('pacrud_search_field_pk').checked = false;
		document.getElementById('pacrud_search_field_name').value = '';
		document.getElementById('pacrud_search_field_label').value = '';
		document.getElementById('pacrud_search_field_type').value = '';
		document.getElementById('pacrud_search_field_visible').checked = true;

	}
	
	this.navigate = function() {
		var newLine = this.getLineIndexCursor();
		if (newLine != this.lineIndex) {
			this.lineIndex = newLine;
			this.onLineIndexChange();
		}
		document.getElementById('lineIndex').value = this.lineIndex;
		this.getObjName(this.getLineCursor());
		
		var objCount = 0;
		var objCount = 0;
		for (i in this.line) {
			if (this.line[i].indexOf(' = new ' ) > -1) {
				objCount++;
			}
		}
		
		this.objCount = objCount;
	}
	
	this.onSessionChange = function() {
		if (this.getLineCursor() == '') {
			this.unFreezeBtClass();
		}
		else {
			this.freezeBtClass();
		}
		
		if (this.session != '') {
			this.textarea.title = 'Duplo click para editar ou enter no final da linha para adicionar um campo';
		}
		else {
			this.textarea.title = '';
		}
	}
	
	this.freezeBtClass = function() {
		btPacrud.setAttribute('disabled','disabled');
		btPacrudSearch.setAttribute('disabled','disabled');
		btPacrudList.setAttribute('disabled','disabled');
	}
	
	this.unFreezeBtClass = function() {
		var text = this.textarea.value;
		if (text.indexOf('pacrudSearch') == -1 && text.indexOf('pacrudList') == -1) {
			btPacrud.removeAttribute('disabled');
		}
		
		if (this.objCount == 0) {
			btPacrudSearch.removeAttribute('disabled');
			btPacrudList.removeAttribute('disabled');
		}
	}
	
	this.onLineIndexChange = function() {
		var newSession = this.getSession();
		if (this.session != newSession) {
			this.session = newSession;
			this.onSessionChange();	
		}
		if (this.getLineCursor() == '') {
			this.unFreezeBtClass();
		}
		else {
			this.freezeBtClass();
		}
		document.getElementById('session').value = this.session;
	}
	
	this.getSession = function() {
		return this.getSessionLine(this.getLineIndexCursor());
	}
	
	this.getSessionLine = function(lineIndex,recursive) {
		var line = this.getLine(lineIndex);
		
		if (recursive == undefined) {
			var recursive = true;
		}
		
		if (line.indexOf("new paCRUD(") > -1) {
			return 'paCRUD';
		}
		else if (line.indexOf("new pacrudSearch(") > -1) {
			return 'pacrudSearch';
		}
		else if (line.indexOf("new pacrudList(") > -1) {
			return 'pacrudList';
		}
		else if (line.indexOf("->addField(") > -1 && recursive) {
			if (lineIndex == 0) {
				return '';
			}
			var index = lineIndex - 1;
			var session = this.getSessionLine(index,false);
			while (session != 'paCRUD' && session != 'pacrudSearch' && session != 'pacrudList') {
				index--;
				session = this.getSessionLine(index,false);
			}
			return session+'Field';
		}
		else if (line.indexOf("->addField(") > -1 && recursive == false) {
			return 'addField';
		}
		else {
			return '';
		}
	}
	
	this.getLineIndexCursor = function() {
		var text = this.textarea.value;
		var cursorPosition = this.textarea.selectionStart;
		var lineIndex = 0;
		var position = 0;
		for (i=0; i < text.length; i++) {
			if (text.substr(i,1) == "\n") {
				if (cursorPosition >= position && cursorPosition <= i) {
					return lineIndex;
				}
				position = i + 1;
				lineIndex++;
			}
		}
		
		return lineIndex;
	}
	
	this.getLine = function(lineIndex) {
		this.line = explode("\n",this.textarea.value);
		return this.line[lineIndex];
	}
	
	this.getLineCursor = function() {
		return this.getLine(this.getLineIndexCursor());
	}
}

/**
 * Transforma uma string em array dado um delimitador
 */
function explode(delimiter,textIn) {
	var arrOut = Array();
	var text = textIn;
	
	var i = 0;
	while (text.indexOf(delimiter) > -1) {
		var position = text.indexOf(delimiter);
		arrOut[i] = text.substr(0,position);
		text = text.substr(position + delimiter.length, text.length - position - delimiter.length);
		i++;
	}
	arrOut[i] = text;
	
	return arrOut;
}

function replaceAll(str, from, to) {
	var strOut = str;
	while (strOut.indexOf(from) > -1){
		strOut = strOut.replace(from, to);
	}
	return (strOut);
}

window.onload = function() {
	document.getElementById('pacrud_code').value = "<?php\nrequire_once('pacrud.php');\n\n";
	document.getElementById('pacrud_code').focus();
	
	code = new classCode();
	code.init();
}

pAjaxFileManager = new pacrudAjax('ctrl_file_manager.php');
pAjaxFileManager.process = function() {
	if (this.operation == 'open') {
		code.state = 'coding';
		code.textarea.value = this.responseText;
		code.textarea.focus();
		code.navigate();
		showOtherCode();
	}
	
	if (this.operation == 'save') {
		if (this.responseText == 'OK') {
			showOtherCode();
		}
		else {
			alert(this.responseText);
		}
	}
}

function makeViewCode() {
	var ctrlFile = document.getElementById('file_name').value;
	var pAjaxCodeView = new pacrudAjax('../app/'+ctrlFile+'?htmlcode');
	pAjaxCodeView.process = function() {
		document.getElementById('tabOtherCode_tab_view').innerHTML = this.responseText;
	}
	pAjaxCodeView.goAjax('');
}

function makeDdl() {
	var ctrlFile = document.getElementById('file_name').value;
	var pAjaxCodeDdl = new pacrudAjax('../app/'+ctrlFile+'?ddl');
	pAjaxCodeDdl.process = function() {
		document.getElementById('tabOtherCode_tab_ddl').innerHTML = this.responseText;
	}
	pAjaxCodeDdl.goAjax('');
}

function showOtherCode() {
	if (document.getElementById('pacrud_code').value.indexOf("new paCRUD") > -1) {
		document.getElementById('tabOtherCode_tab_view').innerHTML = '';
		document.getElementById('tabOtherCode_tab_ddl').innerHTML = '';
		tabOtherCode.show();
		makeViewCode();
		makeDdl();
	}
}

function hideOtherCode() {
	tabOtherCode.hide();
}

function btOpen_click() {
	pAjaxFileManager.operation = 'open';
	pAjaxFileManager.goAjax('open=true&filename='+document.getElementById('file_name').value);
	
	code.divPacrud.style.display = 'none';
	code.divPacrudMaisOpcoes.style.display = 'none';
	code.divPacrudField.style.display = 'none';
	code.divPacrudFieldMaisOpcoes.style.display = 'none';
	code.divPacrudSearch.style.display = 'none';
	code.divPacrudSearchField.style.display = 'none';
}

function btSalve_click() {
	pAjaxFileManager.operation = 'save';
	pAjaxFileManager.goAjax('save=true&filename='+document.getElementById('file_name').value+'&code='+encodeURIComponent(code.textarea.value));
}

function txPacrudCode_change() {
	hideOtherCode();
}

function txFileName_change() {
	hideOtherCode();
}
