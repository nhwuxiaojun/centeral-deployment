

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
 
function pacrudTab(objName) {
	this.objName = objName;		
	this.tabName = new Array();

	this.addTab = function(tabName) {
		this.tabName.push(tabName);
	}

	this.show = function() {
		document.getElementById(this.objName).style.display = 'block';
	}

	this.hide = function() {
		document.getElementById(this.objName).style.display = 'none';
	}

	this.showTab = function(tabName) {
		this.show();
		for (i in this.tabName) {
			if (this.tabName[i] == tabName) {
				document.getElementById(this.objName+'_tab_'+this.tabName[i]).style.display = 'block';
				document.getElementById(this.objName+'_bt_'+this.tabName[i]).setAttribute('disabled','disabled');
			}
			else {
				document.getElementById(this.objName+'_tab_'+this.tabName[i]).style.display = 'none';
				document.getElementById(this.objName+'_bt_'+this.tabName[i]).removeAttribute('disabled');
			}
		}
	}
}
