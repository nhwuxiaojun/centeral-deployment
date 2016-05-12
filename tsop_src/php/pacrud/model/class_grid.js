

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
 
function pacrudGrid(objName) {
	this.xmlIdentification;
	this.xmlData;
	this.objName = objName;
	this.lines;
	this.lineEventOnData = '';
	this.pointerCursorOnData = false;
	this.selectedLine = 0;
	
	this.field;
	this.fieldType;
	this.fieldVisible;
	
	this.table = document.getElementById(objName);
	
	for (i=1; i <= this.table.rows.length -1; i++) {
		this.table.rows[i].setAttribute('onmouseover',objName+'.onmouseover('+i+')');
	}

	this.onmouseover = function(i) {
		this.selectedLine = i;
		if (i != 0) {
			this.table.rows[i].setAttribute('class','pacrudGridTrSelected');
		}
		
		for (j=1; j <= this.table.rows.length -1; j++) {
			if (j != i) {
				if (j % 2 != 0) {
					this.table.rows[j].setAttribute('class','pacrudGridTrEven');
				}
				else {
					this.table.rows[j].setAttribute('class','pacrudGridTrOdd');
				}				
			}
		}
	}

	this.clear = function() {
		pGrid = document.getElementById(this.objName);
		//laço que percorre as linhas do grid
		for (i=1; i < pGrid.rows.length; i++) {
			pGridRow = pGrid.rows[i];
			//restaura o cursor
			pGridRow.style.cursor = 'default';
			pGridRow.removeAttribute('onClick');
			for (j=0; j < pGridRow.cells.length; j++) {
				pGridRow.cells[j].innerHTML = '<br />';
			}
		}
	}
	
	this.format = function(type,value) {
		if (type == 'timestamp' && value != '') {
			var year = value.substring(0,4);
			var month = value.substring(5,7);
			var day = value.substring(8,10);
			var hour = value.substring(11,13);
			var minute = value.substring(14,16);
			var second = value.substring(17,19);
			var timestamp = value.substring(17,19);
			var formatedValue = day + '/' + month + '/' + year + ' ' + hour + ':' + minute + ':' + second;
		}
		else if (type == 'date' && value != '') {
			var year = value.substring(0,4);
			var month = value.substring(5,7);
			var day = value.substring(8,10);
			var formatedValue = day + '/' + month + '/' + year;
		}
		else if (type == 'numeric' && value != '') {
			var formatedValue = value.replace(',','');
			formatedValue = formatedValue.replace('.',',');
		}
		else if (type == 'boolean' && value != '') {
			if (value == 't') {
				var formatedValue = '<input type="checkbox" readonly="readonly" checked="checked" />';
			}
			else {
				var formatedValue = '<input type="checkbox" readonly="readonly" />';
			}
		}
		else {
			formatedValue = value.replace(/\\n/g,'<br />');
		}
		return formatedValue;
	}
	
	this.assignResponseXML = function(responseXML) {
		this.onmouseover(0);
		this.xmlData = responseXML.getElementsByTagName(this.xmlIdentification);

		//limpa o grid
		this.clear();

		//laço que percorre o xml
		for (i=0; i < this.xmlData.length; i++) {
			// faz referencia a linha do grid
			var pGridRow = document.getElementById(this.objName).rows[i+1];
			var pGridRowCells = pGridRow.cells;
			//coloca o cursor pointer
			if (this.pointerCursorOnData) {
				pGridRow.style.cursor = 'pointer';
			}
			//coloca o evento click na linha do grid
			if (this.lineEventOnData != '') {
				pGridRow.setAttribute('onClick',this.lineEventOnData.replace('%',i));
			}

			//laço que percorre as colunas do pacrudGrid
			var iColumn = 0;
			for (j=0; j < this.field.length; j++) {
				var valueCell = this.format(this.fieldType[j],this.getValue(this.field[j],i));
				if (this.fieldVisible[j] == true) {
					pGridRowCells[iColumn].innerHTML = valueCell;
					iColumn = iColumn + 1;
				}
			}
		}
	}
	
	this.getValue = function(fieldName,index) {
		var value = this.xmlData[index].getElementsByTagName(fieldName)[0].childNodes[0].nodeValue;
		if (value == 'NULL') {
			value = '';
		}
		return value;
	}

}
