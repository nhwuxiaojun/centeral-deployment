

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

function pacrudWindow(objName) {
	this.objName = objName;
	this.width   = 730;
	this.title   = 'pacrudWindow';
	this.align   = 'center';
	this.vAlign  = 'middle';
	this.positioned = false;
	
	this.div = document.getElementById(objName);
	
	this.show = function(modal) {
		document.getElementById(this.objName+'_title').innerHTML = this.title;
		
		if (modal) {
			document.getElementById(this.objName+'_veil').style.display = 'block';
		}
		this.div.style.display = 'block';
		if (this.positioned == false) {
			this.position();
		}
		this.positioned = true;
	}
  
	this.hide = function() {
		document.getElementById(this.objName+'_veil').style.display = 'none';
		this.div.style.display = 'none';
	}
  
	this.move = function() {
		this.positioned = true;
		thisDiv = document.getElementById(this.objName)
		diffX = 0;
		diffY = 0;
		
		document.getElementById(this.objName+'_title').style.cursor = 'move';
		
		document.onmousemove = function Mouse(event){
			if (diffX == 0) {
				diffX = event.clientX - thisDiv.offsetLeft;
			}
			if (diffY == 0) {
				diffY = event.clientY - thisDiv.offsetTop;
			}

			x = event.clientX - diffX;
			y = event.clientY - diffY;

			thisDiv.style.left = x + "px";
			thisDiv.style.top  = y + "px";			
		}
		document.onclick = null;
	}
	
	this.dropMove = function() {
		document.getElementById(this.objName+'_title').style.cursor = '';
		document.onmousemove = false;
	}
  
	this.position = function() {
		topPosition = 0;
		leftPosition = 0;
		
		this.div.style.width = this.width + "px";
		if (this.vAlign == 'middle') {
			topPosition = (document.body.offsetHeight/2)-(this.div.offsetHeight/2);
			if (topPosition < 0) {
				topPosition = 1;
			}
		}
		if (this.vAlign == 'top') {
			topPosition = 1;
		}
		this.div.style.top = topPosition + "px";

		if (this.align == 'center') {
			leftPosition = (document.body.clientWidth/2)-(this.width/2);
			if (leftPosition < 0) {
				leftPosition = 1;
			}
		}
		if (this.align == 'left') {
			leftPosition = 1;
		}
		if (this.align == 'rigth') {
			leftPosition = document.body.clientWidth - this.width -5;
		}
		this.div.style.left = leftPosition + "px";
	}

}

