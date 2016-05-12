<?php

/* *********************************************************************
 *
 *  paCRUD - PHP Ajax CRUD Framework é um framework para
 *  desenvolvimento rápido de sistemas de informação web.
 *  Copyright (C) 2010 Emerson Casas Salvador <salvaemerson@gmail.com>
 *  e Odair Rubleski <orubleski@gmail.com>
 *
 *  This file is part of paCRUD.
 *
 *  paCRUD is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3, or (at your option)
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 * ******************************************************************* */
?>
	<div style="position: relative; width:481px; height: 360px; float:right;">
		<a href="http://www.w3schools.com/js">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/javascript.png" alt="JavaScript" style="position: absolute; top: 1.23cm; left: 2.94cm" />
		</a>
		<a href="http://www.mariadb.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/mariadb.png" alt="MariaDB" style="position: absolute; top: 2.43cm; left: 10.45cm" />
		</a>
		<a href="http://www.apache.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/apache.png" alt="Apache" style="position: absolute; top: 7.2cm; left: 7.84cm" />
		</a>
		<a href="http://meld.sourceforge.net/">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/meld.png" alt="Meld" style="position: absolute; top: 7.35cm; left: 6.33cm" />
		</a>
		<a href="http://www.pacrud.com.br">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/pacrud.png" alt="paCRUD Framework" style="position: absolute; top: 2.96cm; left: 0.48cm" />
		</a>
		<a href="http://www.postgresql.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/postgresql.png" alt="PostgreSQL" style="position: absolute; top: 1.46cm; left: 8.33cm" />
		</a>
		<a href="http://rapidsvn.tigris.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/rapidsvn.png" alt="RapidSVN" style="position: absolute; top: 7.34cm; left: 4.35cm" />
		</a>
		<a href="http://www.w3schools.com/html5">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/html5.png" alt="xhtml" style="position: absolute; top: 0.70cm; left: 1.2cm" />
		</a>
		<a href="http://www.php.net">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/php.png" alt="PHP" style="position: absolute; top: 1.23cm; left: 5.15cm" />
		</a>
		<a href="http://www.gnu.org/s/gettext/">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/gettext.jpg" alt="PHPUnit" style="position: absolute; top: 6.32cm; left: 11.19cm" />
		</a>
		<a href="http://www.sourceforge.net">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/sourceforge.png" alt="SourceForge" style="position: absolute; top: 8.63cm; left: 3.85cm" />
		</a>
		<a href="http://www.w3c.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/w3c.png" alt="W3C" style="position: absolute; top: 0.02cm; left: 4.25cm" />
		</a>
		<a href="http://www.w3schools.com/xml">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/xml.png" alt="XML" style="position: absolute; top: 1.77cm; left: 10.37cm" />
		</a>
		<a href="http://subversion.tigris.org">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/subversion.png" alt="SubVersion" style="position: absolute; top: 7.22cm; left: 2.63cm" />
		</a>
		<a href="http://www.mozilla.com/pt-BR/firefox/">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/firefox.png" alt="Firefox" style="position: absolute; top: 6.69cm; left: 0.88cm" />
		</a>
		<a href="http://www.w3schools.com/ajax">
			<img src="<?php echo $pacrudConfig['pacrudWebPath']; ?>/view/images/logo/ajax.png" alt="Ajax" style="position: absolute; top: 2.39cm; left: 0.29cm" />
		</a>
	</div>
	<div style="">
		<h1><?php echo _('Sobre o paCRUD');  ?></h1>
		<p><?php  echo _('Versão');  ?>: <?php echo $pacrudVersion; ?></p>
		<p><?php  echo _('Site do projeto');  ?>: <a href="http://www.pacrud.com.br">http://www.pacrud.com.br</a></p>
		<h2><?php echo _('O que é paCRUD?');  ?></h2>
		<p><?php  echo '<b>paCRUD - PHP Ajax CRUD Framework</b> '._('é um Framework PHP/Ajax com funcionalidades CRUD (Create, Retrieve, Update e Delete) para desenvolvimento rápido de sistemas de informação com bancos de dados PostgreSQL ou MariaDB.'); ?></p>
		<p><?php  echo _('A missão do projeto paCRUD, é potencializar a eficiência do desenvolvedor de sistemas de informação, separando as regras de negócio da programação das funcionalidades comuns aos SIs, através de um Framework Ajax leve e fácil de usar.');  ?></p>
		<h2><?php echo _('Tecnologias envolvidas no projeto paCRUD');  ?></h2>
		<p><?php  echo _('A direita você pode observar o conjunto de tecnologias envolvidas no projeto.');  ?></p>
		<p><?php  echo _('Na parte superior, estão os logos das tecnologias que o paCRUD depende ou suporta. O paCRUD respeita os padrões WEB para garantir	que sua aplicação irá rodar em qualquer browser que também esteja dentro das normas.');  ?></p>
		<p><?php  echo _('Embaixo do logo paCRUD, estão as tecnologias que utilizamos no desenvolvimento do framework.');  ?></p>
	</div>

