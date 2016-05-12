
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
 
function pacrudFilter(objName) {
	this.objName = objName;
	this.pAjax = new pacrudAjax();
	this.pAjax.ajaxFormat = 'xml';
	this.page;
	this.pacrudWebPath;
	this.xmlIdentification = 'pFilter';
	
	this.fieldName  = new Array();
	this.fieldLabel = new Array();
	this.fieldType  = new Array();
	
	this.filter = new Array();
	this.count = 0;
	
	//operadores lógicos para campos em formato texto
	this.textOperators        = Array(
	                                    'like',
	                                    'not like',
	                                    'begins with',
	                                    'ends with',
	                                    'not begins with',
	                                    'not ends with',
	                                    'equal',
	                                    'not equal',
   	                                    'is null',
   	                                    'not is null'
							         );
	this.textOperatorsName    = Array(
	                                    gettext('contém'),
	                                    gettext('não contém'),
	                                    gettext('começa com'),
	                                    gettext('termina com'),
	                                    gettext('não começa com'),
	                                    gettext('não termina com'),
							            gettext('igual a'),
							            gettext('diferente de'),
							            gettext('é nulo'),
							            gettext('não é nulo')
							         );
	//operadores lógicos para campos em formato numerico
	this.numericOperators     = Array(
							            'numeric equal',
							            'numeric not equal',
							            'less than',
							            'greater than',
							            'less than or equal',
							            'greater than or equal',
   	                                    'is null',
   	                                    'not is null'
							         );
	this.numericOperatorsName = Array(
							            gettext('igual a'),
							            gettext('diferente de'),
							            gettext('menor que'),
							            gettext('maior que'),
							            gettext('menor ou igual a'),
							            gettext('maior ou igual a'),
							            gettext('é nulo'),
							            gettext('não é nulo')
							         );
	//operadores lógicos para campos boleanos
	this.booleanOperators        = Array(
							            'equal',
							            'not equal',
   	                                    'is null',
   	                                    'not is null'
							         );
	this.booleanOperatorsName    = Array(
							            gettext('igual a'),
							            gettext('diferente de'),
							            gettext('é nulo'),
							            gettext('não é nulo')
							         );
	
	/**
	 * Adiciona um filtro
	 *
	 * @param filterIndex integer: número do filtro, também aceita null para pegar o próximo disponível
	 * @param fieldName string: nome do campo
	 * @param operator string: operador inicial
	 * @param aValue string: valor inicial
	 * @param aValue2 string: reservado para implementação futura da condição sql BETWEEN
	 */
	this.addFilter = function(filterIndex,fieldName,operator,value,value2,visible) {
		function aFilter(aFieldName,aOperator,aValue,aValue2,aVisible) {
			this.fieldName = aFieldName;
			this.operator  = aOperator;
			this.value     = aValue;
			this.value2    = aValue2;
			this.visible   = aVisible;
		}
		var newFilter = new aFilter(fieldName,operator,value,value2,visible);
		if (filterIndex == null) {
			this.filter.push(newFilter);
		}
		else {
			this.filter.splice(filterIndex,0,newFilter);
		}
		this.count++;
	}
	
	/**
	 * Coloca o foco no primeiro filtro
	 */
	this.focus = function() {
		for (i in this.filter) {
			if (this.filter[i].visible) {
				document.getElementById(this.objName+'_'+i+'_value').focus();
				break;
			}
		}
	}
	
	/**
	 * Evento do botão (-) do filtro
	 */
	this.cmdAddFilter = function(filterIndex) {
		this.addFilter(filterIndex,'','','','',true);
		this.draw();
	}
	
	/**
	 * Remove um determinado filtro
	 *
	 * @param filterIndex integer: número do filtro
	 */
	this.removeFilter = function(filterIndex) {
		removed = this.filter.splice(filterIndex,1);
		this.count--;
		return removed;
	}
	
	/**
	 * Evento do botão (-) do filtro
	 *
	 * @param filterIndex integer: número do filtro
	 */
	this.cmdRemoveFilter = function(filterIndex) {
		this.removeFilter(filterIndex);
		this.draw();
	}
	
	/**
	 * Remove todos os filtros
	 */
	this.clearFilters = function() {
		this.filter = new Array();
	}
	
	/**
	 * Pega o tipo do campo
	 *
	 * @param fieldName string: nome do campo
	 * @returns string: fieldType daquele campo
	 */
	this.fieldTypeByName = function(fieldName) {
		for (i=0; i < this.fieldName.length; i++) {
			if (fieldName == this.fieldName[i]) {
				return this.fieldType[i];
			}
		}
		return null;
	}
	
	/**
	 * Pega o nome do operador
	 *
	 * @param fieldName string: nome do campo
	 * @returns string: tipo de operador daquele campo (text, numeric ou boolean)
	 */
	this.operatorTypeByName = function(fieldName) {
		fieldType = this.fieldTypeByName(fieldName);
		
	    switch (fieldType) {
		    case 'string':
		        return 'text';
		        break;
		    case 'integer':
		        return 'numeric';
		        break;
		    case 'serial':
		        return 'numeric';
		        break;
		    case 'date':
		        return 'numeric';
		        break;
		    case 'time':
		        return 'numeric';
		        break;
		    case 'timestamp':
		        return 'numeric';
		        break;
		    case 'boolean':
		        return 'boolean';
		        break;
		default:
            return 'text';
	    }
	}
	
	/**
	 * Evento disparado pelo onChange do select "nome do campo"
	 * 
	 * @param selectFieldName string: nome do campo
	 * @param index integer: número do filtro
	 */
	this.selectFieldChange = function(selectFieldName,index) {
		operatorType = this.operatorTypeByName(selectFieldName.value);
		selectOperator = document.getElementById(this.objName+'_'+index+'_operator');

		if (operatorType == 'text') {
			arrOperators     = this.textOperators;
			arrOperatorsName = this.textOperatorsName;
		}
		if (operatorType == 'numeric') {
			arrOperators     = this.numericOperators;
			arrOperatorsName = this.numericOperatorsName;
		}
		if (operatorType == 'boolean') {
			arrOperators     = this.booleanOperators;
			arrOperatorsName = this.booleanOperatorsName;
		}
		
		var htmlOptions = '';
		for (j=0; j < arrOperators.length; j++) {
			htmlOptions += '<option value="'+arrOperators[j]+'">'+arrOperatorsName[j]+'</option>\n';
		}

		selectOperator.innerHTML = htmlOptions;	
		this.filter[index].fieldName = selectFieldName.value;
		
		selectOperator.value = arrOperators[0];
		this.selectOperatorChange(selectOperator,index);

		// coloca o foco no campo de pesquisa
		document.getElementById(this.objName+'_'+index+'_value').focus();
	}
	
	/**
	 * Evento disparado pelo onChange do select "nome do campo"
	 * 
	 * @param selectFieldName string: nome do campo
	 * @param index integer: número do filtro
	 */
	this.selectOperatorChange = function(selectOperator,index) {
		// passa o valor escolhido para o objeto filter
		this.filter[index].operator = selectOperator.value;
		
		// coloca o foco no campo de pesquisa
		document.getElementById(this.objName+'_'+index+'_value').focus();
	}
	
	/**
	 * Copia o valor de um input para a propriedade filter[index] do objeto pacrudFilter
	 *
	 * @param inputObject objeto dom
	 * @param index integer: número do filtro
	 */
	this.inputValueChange = function(inputObject,index) {
		this.filter[index].value = inputObject.value;
	}
	
	/**
	 * Evento disparado pelo onKeyup das caixas de texto dos filtros
	 * @param event: evento
	 * @param index integer: número do filtro
	 */
	this.inputValueKeyUp = function(event,index) {
		switch (event.keyCode) {
			case 13: //ENTER
				this.parent.enterKey();
				break;
			case 27: //ESC
				this.parent.cancel();
				break;
			case 113: //F2
				break;
			case 38: //Seta para cima
				this.parent.upArrow();
		        break;
		    case 40: //Seta para baixo
				this.parent.downArrow();
				break;
		}
	}
	
	/**
	 * Evento disparado pelo onKeydown das caixas de texto dos filtros
	 * @param event: evento
	 * @param index integer: número do filtro
	 */
	this.inputValueKeyDown = function(event,index) {
		//Enter
		if (event.keyCode != 13) {
			this.parent.keyDown();
		}
	}

	/**
	 * Desenha/Redesenha os botões (+) e (-) dos filtros
	 */
	this.drawFilterControls = function() {
		//Conta os filtros visíveis
		visibleFilters = 0;
		for (i=0; i < this.filter.length; i++) {
			if (this.filter[i].visible) {
				visibleFilters++;
			}
		}
		
		// laço que corre todos os filtros
		for (i=0; i < this.filter.length; i++) {
		
			// coloca o botão apenas se o filtro é visível
			if (this.filter[i].visible) {
				// coloca o botão (+)
				filterIndex = i+1;
				filterControl  = '<a href="javascript:'+this.objName+'.cmdAddFilter('+filterIndex+')">';
				filterControl += '<img src="'+this.pacrudWebPath+'/view/images/add.png" alt="add" />';
				filterControl += '</a>\n';
				
				// se possui mais de um filtro visível coloca o botão (-)
				if (visibleFilters > 1) {
					filterControl += '<a href="javascript:'+this.objName+'.cmdRemoveFilter('+i+')">';
					filterControl += '<img src="'+this.pacrudWebPath+'/view/images/remove.png" alt="del" />';
					filterControl += '</a>\n';
				}
				
				document.getElementById(this.objName+'_'+i+'_controls').innerHTML = filterControl;
			}
		}
	}
	
	/**
	 * Limpa os valores de todos os filtros visíveis
	 */
	this.clearValues = function() {
		for (i=0; i < this.filter.length; i++) {
			if (this.filter[i].visible) {
				this.filter[i].value  = '';
				this.filter[i].value2 = '';
			}
		}
	}
	
	/**
	 * Configura os filtros, passando as propriedades do objeto para a interface
	 */
	this.configureFilter = function(fieldName,filterIndex) {
		if (this.filter[filterIndex].visible) {
			selectFieldName = document.getElementById(this.objName+'_'+filterIndex+'_field');
			selectOperator  = document.getElementById(this.objName+'_'+filterIndex+'_operator');
			inputValue      = document.getElementById(this.objName+'_'+filterIndex+'_value');
			var operator = this.filter[filterIndex].operator;

			// configura selectFilter e o inputValue com o valor anteriormente passado via XML
			if (this.filter[filterIndex].fieldName == '') {
				selectFieldName.value = this.filter[0].fieldName;
			}
			else {
				selectFieldName.value = this.filter[filterIndex].fieldName;
			}
			inputValue.value = this.filter[filterIndex].value;

			// preenche o combo selectOperator
			this.selectFieldChange(selectFieldName,filterIndex);

			// configura o selectOperator
			var operatorType = this.operatorTypeByName(this.filter[filterIndex].fieldName);
			if (this.filter[filterIndex].operator == '') {
				switch (operatorType) {
					case 'text':
						arrOperators = this.textOperators;
						break;
					case 'numeric':
						arrOperators = this.numericOperators;
						break;
				default:
					arrOperators = this.textOperators;
				}
				this.filter[filterIndex].operator = arrOperators[0];
			}
			selectOperator.value = operator;
			if (operator != '') {
				this.filter[filterIndex].operator = operator;
			}
		}
	}
	
	/**
	 * Desenha/Redesenha a interface (apenas a parte do pacrudFilter)
	 */
	this.draw = function() {
		htmlFilters = '<table cellpadding="0" cellspacing="0">\n';
		for (i=0; i< this.filter.length; i++) {
			if (this.filter[i].visible) {
				htmlFilters += '	<tr>\n';
				htmlFilters += '		<td>\n';
				htmlFilters += '			<select id="'+this.objName+'_'+i+'_field" onchange="'+this.objName+'.selectFieldChange(this,'+i+')">\n';
				for (j=0; j< this.fieldName.length; j++) {
					htmlFilters += '				<option value="'+this.fieldName[j]+'">'+this.fieldLabel[j]+'</option>\n';
				}
				htmlFilters += '			</select>\n';
				htmlFilters += '		</td>\n';
				htmlFilters += '		<td>\n';
				htmlFilters += '			<select id="'+this.objName+'_'+i+'_operator" onchange="'+this.objName+'.selectOperatorChange(this,'+i+')"></select>\n';
				htmlFilters += '		</td>\n';
				htmlFilters += '		<td>\n';
				htmlFilters += '			<input id="'+this.objName+'_'+i+'_value" size="15" onchange="'+this.objName+'.inputValueChange(this,'+i+')" onkeyup="'+this.objName+'.inputValueKeyUp(event,'+i+')" onkeydown="'+this.objName+'.inputValueKeyDown(event,'+i+')" />\n';
				htmlFilters += '			<span id="'+this.objName+'_'+i+'_controls"></span>\n';
				htmlFilters += '		</td>\n';
				htmlFilters += '	</tr>\n';
			}
		}
		htmlFilters += '</table>\n';
		
		document.getElementById(this.objName+'_filters').innerHTML = htmlFilters;
		
		// chama o metodo configure filter para passar os valores do objeto para a interface
		for (ii = 0; ii < this.filter.length; ii++) {
			this.configureFilter(this.filter[ii].fieldName,ii);
		}
		
		// redesenha os botões (+) e (-)
		this.drawFilterControls();
	}
	
	/**
	 * Pega um valor na tabela que foi retornada via XML
	 *
	 * @param fieldName string: nome do campo
	 * @param index integer: número da linha
	 * @returns string: valor do campo
	 */
	this.getValue = function(fieldName,index) {
		var value = this.xmlData[index].getElementsByTagName(fieldName)[0].childNodes[0].nodeValue;
		if (value == 'NULL') {
			value = '';
		}
		return value;
	}
	
	/**
	 * Evento disparado após o assignResponseXML para ser implementado conforme necessidade do desenvolvedor da aplicação
	 */
	this.afterAssignResponseXML = function() {
		// implementar conforme necessidade
	}
	
	/**
	 * Configura as propriedades do objeto pacrudFilter de acordo com o resultado XML passado como parâmetro
	 *
	 * @param responseXML: resultado xml
	 */
	this.assignResponseXML = function(responseXML) {
		this.xmlData = responseXML.getElementsByTagName(this.xmlIdentification);

		// limpa os filtros
		this.filter = new Array()

		// laço que percorre o xml
		for (i=0; i < this.xmlData.length; i++) {
			fieldName    = this.getValue('fieldName',i);
			operator     = this.getValue('operator',i);
			value        = this.getValue('value',i);
			value2       = this.getValue('value2',i);
			visible      = this.getValue('visible',i);
			if (visible == 'false') {
				visible = false;
			}
			else {
				visible = true;
			}

			this.addFilter(i,fieldName,operator,value,value2,visible);
		}
		// redesenha
		this.draw();
		
		this.afterAssignResponseXML();
	}
	
	/**
	 * Seta o valor para o primeiro filtro que encontrar com o id passado, caso não encontre cria um filtro
	 */
	this.setFilter = function(fieldName,filterOperator,fieldValue) {
		//Caso não possua nenhum filtro então cria
		if (this.filter.length == 0) {
			this.addFilter(null,fieldName,filterOperator,fieldValue,'',true);
		}
		
		// Procura um campo no filtro visivel com o mesmo fieldName
		var nothing = true;
		for (iFilter in this.filter) {
			if (this.filter[iFilter].fieldName == fieldName && this.filter[iFilter].visible) {
				this.filter[iFilter].value = fieldValue;
				nothing = false;
				break;
			}
		}
		
		if (nothing) {
			// caso não encontre nenhum filtro
			this.addFilter(null,fieldName,filterOperator,fieldValue,'');
		}
	}
	
	/**
	 * Seta o valor para o primeiro filtro que encontrar com o id passado, caso não encontre cria um filtro
	 */
	this.setInvisibleFilter = function(fieldName,filterOperator,fieldValue) {
		//Caso não possua nenhum filtro então cria
		if (this.filter.length == 0) {
			this.addFilter(null,fieldName,filterOperator,fieldValue,'',false);
		}
		
		// Procura um campo no filtro visivel com o mesmo fieldName
		var nothing = true;
		for (iFilter in this.filter) {
			if (this.filter[iFilter].fieldName == fieldName && this.filter[iFilter].visible == false) {
				this.filter[iFilter].value = fieldValue;
				nothing = false;
				break;
			}
		}
		
		if (nothing) {
			// caso não encontre nenhum filtro
			this.addFilter(null,fieldName,filterOperator,fieldValue,'',false);
		}
	}
}
