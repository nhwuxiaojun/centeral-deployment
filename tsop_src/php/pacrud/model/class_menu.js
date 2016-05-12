

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

function pacrudMenu(objName) {
	this.objName = objName;
	
	this.open = function(id) {
		subMenu = document.getElementById(this.objName+'_'+id);
		subMenu.style.display = 'block';
	}
	
	this.close = function(id) {
		subMenu = document.getElementById(this.objName+'_'+id);
		subMenu.style.display = 'none';
	}
	
	this.onClick = function(id,link,element) {
		if (link == '') {
			subMenu = document.getElementById(this.objName+'_'+id);
			if (subMenu.style.display == 'none' || subMenu.style.display == undefined) {
				this.open(id);
			}
			else {
				this.close(id);
			}
		}
		else {
			if (element.ctrlKey) {
				window.open(link);
			}
			else {
				location.href = link;
			}
		}
	}
	

}
