<?php

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

class pacrudSearch extends pacrudBasic {
	private $pGrid;
	private $fieldReturn;
	protected $indentation;
	public $pacrudConfig;
	public $pConnection;
	public $pFilter;
	private $fixedSqlSearch;
	private $constructedGrid;
	
	public $page;
	
	private $orderby;
	
	public $autoFilter; // quando true (default), prepara um filtro autometicamente quando o usuário altera qualquer campo que participe do fieldReturn
	
	function __construct($params) {
		global $pacrudConfig;
		$this->pacrudConfig = $pacrudConfig;
		
		$this->orderby = '';
		
		$files = get_included_files();
		$lastInclusion = $files[count($files)-1];
		
		parent::__construct($params);
		$this->constructedGrid = false;
		
		if (!isset($this->param['xmlfile'])) {
			if (dirname($_SERVER["SCRIPT_FILENAME"]) == dirname($lastInclusion)) {
				$this->param['xmlfile'] = basename($lastInclusion);
			}
			else {
				$location = substr($_SERVER["SCRIPT_FILENAME"],0,strlen($_SERVER["SCRIPT_NAME"])-1)."\n";
				$this->param['xmlfile'] = dirname($_SERVER["REQUEST_URI"]).'/'.substr($lastInclusion,strlen($location)-1);
			}
		}
		
		if (!isset($this->param['autofilter'])) {
			$autoFilter = true;
		}
		else {
			if ($this->param['autofilter'] == 'false') {
				$autoFilter = false;
			}
			else {
				$autoFilter = true;
			}
		}
		
		$this->page = 1;
		$this->fieldReturn = array();
		
		$this->autoFilter = $autoFilter;
	}
	
	/**
	 * Permite ao desenvolvedor da aplicação explicitar qual pacrudConnection usar
	 */
	public function setConnection($connecion) {
		$this->pConnection = $connecion;
	}
	
	public function setIndentation($indentation) {
		$this->indentation = $indentation;
		$this->pGrid->indentation = $indentation . '		';
	}
	
	public function crudState($crudName,$verbose=true) {
		$state  = '<script type="text/javascript">'."\n";
		$state .= '	'.$crudName.'.addSonSearch('.$this->name.');'."\n";
		$state .= '</script>'."\n";
		if ($verbose) {
			echo $state;
		}
		return $state;
	}

	private function constructGrid() {
		$this->getObjName();
		$lines = $this->pageLines();
		$this->pGrid = new pacrudGrid($this->name,$lines);
		$this->pGrid->indentation = $this->indentation . '		';
		$this->pGrid->lineEventOnData = $this->name.'.lineClick(%)';
		$this->pGrid->pointerCursorOnData = true;
	}
	
	protected function pageLines() {
		if (isset($this->param['pagelines'])) {
			$lines = $this->param['pagelines'];
		}
		else {
			$lines = $this->pacrudConfig['searchLines'];
		}
		return $lines;
	}

	public function addField($params) {
		if ($this->constructedGrid == false) {
			$this->constructedGrid = true;

			if (!isset($this->param['tablename'])) {
				$this->param['tablename'] = $this->name;
			}

			$this->constructGrid();
		}
		parent::addField($params);
		$param = pParameters($params);
		
		$lastField = count($this->field)-1;
		
		if (isset($param['sqlname'])) {
			$this->field[$lastField]['sqlname'] = $param['sqlname'];
		}
		else {
			$this->field[$lastField]['sqlname'] = $param['name'];
		}
		
		if (isset($param['pk'])) {
			$this->field[$lastField]['pk'] = true;
		}
		else {
			$this->field[$lastField]['pk'] = false;
		}
		
		$this->pGrid->addColumn($params);
		$this->pFilter = new pacrudFilter($this->name,$this->field,'');
		$this->pFilter->setIndentation($this->indentation.'		');
	}

	public function addFieldReturn($fieldName,$idReturn,$verbose=true,$linkInput=true) {
		$this->fieldReturn[] = array($fieldName,$idReturn);
		
		$field = $this->fieldByName($fieldName);
		$fieldType = $field['type'];
		
		$fieldReturn  = $this->indentation.'<script type="text/javascript">'."\n";
		$fieldReturn .= $this->indentation. '	'.$this->name.'.addFieldReturn(\''.$fieldName.'\',\''.$idReturn.'\',\''.$fieldType.'\''.");\n";
		if ($linkInput and $this->autoFilter) {
			$fieldReturn .= $this->indentation. '	inputField = document.getElementById(\''.$idReturn.'\');'."\n";
			$fieldReturn .= $this->indentation. '	inputField.pSearch = '.$this->name.';'."\n";
			$fieldReturn .= $this->indentation. '	'."\n";
			
			$fieldReturn .= $this->indentation. '	if (inputField.getAttribute(\'onFocus\') == null) {'."\n";
			$fieldReturn .= $this->indentation. '		inputField.setAttribute(\'onFocus\',\'this.pSearch.fieldFocus(this)\');'."\n";
			$fieldReturn .= $this->indentation. '	}'."\n";
			$fieldReturn .= $this->indentation. '	'."\n";
			
			$fieldReturn .= $this->indentation. '	if (inputField.getAttribute(\'onBlur\') == null) {'."\n";
			$fieldReturn .= $this->indentation. '		inputField.setAttribute(\'onBlur\',\'this.pSearch.fieldBlur(this)\');'."\n";
			$fieldReturn .= $this->indentation. '	}'."\n";
			
			$fieldReturn .= $this->indentation. '	'."\n";
			$fieldReturn .= $this->indentation. '	if (inputField.getAttribute(\'onKeyDown\') == null) {'."\n";
			$fieldReturn .= $this->indentation. '		inputField.setAttribute(\'onKeyDown\',\'this.pSearch.fieldKeyDown(event)\');'."\n";
			$fieldReturn .= $this->indentation. '	}'."\n";
		}
		$fieldReturn .= $this->indentation.'</script>'."\n";
		
		if ($verbose) {
			echo $fieldReturn;
		}
		return $fieldReturn;
	}
	
	protected function initClientObject() {
		// trata o caminho do xmlFile (relativo e absoluto)
		if (substr($this->param['xmlfile'],0,1) == '/') {
			$ajaxFile = $this->param['xmlfile'];
		}
		else {
			$ajaxFile = $this->pacrudConfig['appWebPath'].'/'.$this->param['xmlfile'];
		}
		
		// instancia o objeto pacrudSearch no cliente
		$clientObject = $this->indentation. '<script type="text/javascript">'."\n";
		$clientObject .= $this->indentation. '	'.$this->name.' = new pacrudSearch(\''.$this->name.'\',\''.$ajaxFile.'\');'."\n";
		// repassa condicionalmente o debug para o objeto ajax
		if (isset($this->param['debug']) && $this->param['debug']) {
			$clientObject .= $this->indentation. '	'.$this->name.'.pAjax.debug = true;'."\n";
		}

		// repassa fields para o objeto cliente
		$fieldName = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldName != '')
				$fieldName .= ',';
			$fieldName .= '"'.$this->field[$i]['name'].'"';
		}
		$fieldPk = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldPk != '')
				$fieldPk .= ',';
			if ($this->field[$i]['pk']) {
				$fieldPk .= 'true';
			}
			else {
				$fieldPk .= 'false';
			}
		}
		
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldName = Array('.$fieldName.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldPk = Array('.$fieldPk.');'."\n";
		
		$clientObject .= $this->indentation. '</script>'."\n";
		return $clientObject;
	}
	
	protected function makeFilters() {
		$htmlFilters = $this->pFilter->draw(false);
		
		// vinculo do pacrudFilter com o pacrudSearch
		$htmlFilters .= $this->indentation. '		<script type="text/javascript">'."\n";
		$htmlFilters .= $this->indentation. '			'.$this->name.'.pFilter = pFilter_'.$this->name.";\n";
		$htmlFilters .= $this->indentation. '		</script>'."\n";

		return $htmlFilters;
	}
	
	protected function makeGrid() {
		$htmlGrid = $this->pGrid->draw(false);
		
		// passa informação dos fields do servidor para o grid
		$htmlGrid .= $this->indentation.'		<script type="text/javascript">'."\n";
		
		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.field = new Array(';
		for ($i=0; $i < $this->fieldCount(); $i++) {
			$htmlGrid .= '"'.$this->field[$i]['name'].'"';
			if ($i < $this->fieldCount() -1) {
				$htmlGrid .= ',';
			}
		}		
		$htmlGrid .= ');'."\n";
		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.fieldType = new Array(';
		for ($i=0; $i < $this->fieldCount(); $i++) {
			$htmlGrid .= '"'.$this->field[$i]['type'].'"';
			if ($i < $this->fieldCount() -1) {
				$htmlGrid .= ',';
			}
		}		
		$htmlGrid .= ');'."\n";
		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.fieldVisible = new Array(';
		for ($i=0; $i < $this->fieldCount(); $i++) {
			if ($this->field[$i]['visible'] == true) {
				$fieldVisible = 'true';
			}
			else {
				$fieldVisible = 'false';
			}
			$htmlGrid .= $fieldVisible;
			if ($i < $this->fieldCount() -1) {
				$htmlGrid .= ',';
			}
		}
		$htmlGrid .= ');'."\n";


		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.xmlIdentification = \''.$this->name.'\';'."\n";
		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.lineEventOnData = \''.$this->pGrid->lineEventOnData.'\';'."\n";
		if ($this->pGrid->pointerCursorOnData) {
		$htmlGrid .= $this->indentation. '			pGrid_'.$this->name.'.pointerCursorOnData = true;'."\n";
		}

		// vinculo do pacrudGrid com o pacrudSearch
		$htmlGrid .= $this->indentation. '			'.$this->name.'.pGrid = pGrid_'.$this->name.";\n";
		
		$htmlGrid .= $this->indentation.'		</script>'."\n";
		return $htmlGrid;
	}
	
	protected function makeGridNavigation() {
		$htmlGridNavigation = $this->indentation.'		<div id="pGridNavigation_'.$this->name.'" class="pacrudGridNavigation"></div>'."\n";
		$htmlGridNavigation .= $this->indentation.'		<br />'."\n";
		$htmlGridNavigation .= $this->indentation.'		<script type="text/javascript">'."\n";
		$htmlGridNavigation .= $this->indentation.'			pGridNavigation_'.$this->name.' = new pacrudGridNavigation(\''.$this->name.'\');'."\n";
		
		// vinculo do pacrudGridNavigation com o pacrudSearch
		$htmlGridNavigation .= $this->indentation.'			'.$this->name.'.pGridNavigation = pGridNavigation_'.$this->name.';'."\n";

		$htmlGridNavigation .= $this->indentation.'		</script>'."\n";
		return $htmlGridNavigation;
	}
	
	private function addWindow($pSearch) {
		if (isset($this->param['title'])) {
			$title = $this->param['title'];
		}
		else {
			$title = $this->name;
		}
		$pWindow = new pacrudWindow('pWindow_'.$this->name);
		$pWindow->title = $title;
		$pWindow->indentation = $this->indentation;
		$pWindow->commandClose = $this->name.'.cancel()';
		$pSearchReturn = $pWindow->draw(false,$pSearch);
		
		// vinculo do pacrudWindow com o pacrudSearch
		$pSearchReturn .= $this->indentation.'<script type="text/javascript">'."\n";
		$pSearchReturn .= $this->indentation.'	'.$this->name.'.pWindow = pWindow_'.$this->name.";\n";
		
		// repassa parametro modal do pacrudSerch (que só faz sentido se tiver pWindow, por isso o codigo esta aqui)
		if (isset($this->param['modal'])) {
			$pSearchReturn .= $this->indentation. '			'.$this->name.'.modal = '.$this->param['modal'].";\n";
		}
		$pSearchReturn .= $this->indentation. '	'.$this->name.'.pAjax.pLoading = new pacrudLoading(\'pWindow_'.$this->name.'_loading\');'."\n";
		$pSearchReturn .= $this->indentation.'</script>'."\n";
		
		return $pSearchReturn;
	}
	
	public function draw($verbose) {
		global $pacrudConfig;
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_search.php');

		// junta os objetos
		$pSearchInit = $this->initClientObject();
		$pSearchChids = $this->makeFilters();
		$pSearchChids .= $this->makeGrid();
		$pSearchChids .= $this->makeGridNavigation();		
		$pSearchChids = $this->addWindow($pSearchChids);

		$pSearch = $pSearchInit . $pSearchChids;
		if ($verbose) {
			echo $pSearch;
		}
		return $pSearch;
	}
	
	public function addFilter($field,$operator,$value,$visible) {
		if ($visible == false) {
			$booVisible = 'false';
		}
		else {
			$booVisible = 'true';
		}
		echo '<script type="text/javascript">'."\n";
		echo '	'.$this->name.'.pFilter.addFilter(null,\''.$field.'\',\''.$operator.'\',\''.$value.'\',\'\','.$booVisible.');'."\n";
		echo '	'.$this->name.'.pFilter.draw();'."\n";
		echo '</script>'."\n";
	}
	
	public function sqlCondition() {
		$fieldName = $this->pFilter->filter['fieldName'];
		$operator  = $this->pFilter->filter['operator'];
		$value     = $this->pFilter->filter['value'];
		
		$arrCondition = array();
		$iValue = 0;
		for ($i = 0; $i < count($fieldName); $i++) {
			if ($value[$i] != '' or $operator[$i] == 'is null' or $operator[$i] == 'not is null') {
				$field = $this->fieldByName($fieldName[$i]);
				$condition = $this->pConnection->getSqlOperator($operator[$i]);
				$condition = str_replace(':field:',$field['sqlname'],$condition);
				$condition = str_replace(':value:',pSqlNoInjection($value[$i],$field['type'],true),$condition);
				$arrCondition[$iValue] = $condition;
				$iValue++;
			}
		}
		
		$conditionOut = '';
		for ($i = 0; $i < count($arrCondition); $i++) {
			if ($i == 0) {
				$conditionOut .= ' WHERE '.$arrCondition[$i];
			}
			else {
				$conditionOut .= ' AND '.$arrCondition[$i];
			}
		}
		
		return $conditionOut;
	}
	
	public function setOrderby($orderby) {
		$this->orderby = $orderby;
	}
	
	public function sqlOrderby() {
		$fieldName = $this->pFilter->filter['fieldName'];
		$visible   = $this->pFilter->filter['visible'];
		
		$orderbyOut = '';
		$iVisible = 0;
		for ($i = 0; $i < count($fieldName); $i++) {
			$field = $this->fieldByName($fieldName[$i]);
			if ($visible[$i]) {
				if ($iVisible == 0) {
					$orderbyOut .= $field['sqlname'];
				}
				else {
					$orderbyOut .= ','.$field['sqlname'];
				}
				$iVisible++;
			}
		}
		if ($this->orderby == '') {
			$orderbyOut = ' ORDER BY ' .$orderbyOut;
		}
		else {
			$orderbyOut = ' ORDER BY ' .$this->orderby;
		}
		
		return $orderbyOut;
	}
	
	public function setSqlSearch($sql) {
		$this->fixedSqlSearch = $sql;
		
		for ($i=0; $i < $this->fieldCount(); $i++) {
			$this->field[$i]['sqlname'] = 'fixed.'.$this->field[$i]['sqlname'];
		}
	}
	
	public function sqlSearch() {
		$offsetNum = ($this->page - 1) * $this->pageLines();

		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

		$fields = '';
		for ($i=0; $i < $this->fieldCount(); $i++) {
			if ($fields != '') {
				$fields .= ',';
			}
			$fields .= $this->field[$i]['name'];
		}

		$offset = ' OFFSET '.$offsetNum;
		$limit = ' LIMIT '.$this->pageLines();
		$orderby = $this->sqlOrderby();
		$condition = $this->sqlCondition();
		if ($this->fixedSqlSearch != '') {
			$sqlSearch = 'SELECT '.$fields.' FROM ('.$this->fixedSqlSearch.') fixed '.$condition.$orderby.$limit.$offset.';';
		}
		else {
			$sqlSearch = 'SELECT '.$fields.' FROM '.$schema.$tableName.$condition.$orderby.$limit.$offset.';';
		}
		return $sqlSearch;
	}
	
	public function sqlCount() {
		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

		$condition = $this->sqlCondition();

		if ($this->fixedSqlSearch != '') {
			$sqlCount = 'SELECT count(*) FROM ('.$this->fixedSqlSearch.') fixed '.$condition.';';
		}
		else {
			$sqlCount = 'SELECT count(*) FROM '.$schema.$tableName.$condition.';';
		}
		return $sqlCount;
	}
	
	public function sqlRetrieve() {
		// monta condicao
		$condition = '';
		for ($i = 0; $i < count($this->field); $i++) {
			$fieldName = $this->field[$i]['name'];
			if ($this->field[$i]['pk']) {
				if ($condition == '') {
					$condition .= ' WHERE ';
				}
				else {
					$condition .= ' AND ';
				}
				$value = pFormatSql($_POST[$this->field[$i]['name']],$this->field[$i]['type']);
				$condition .= $fieldName.'='.$value;
			}
		}
		
		// monta campos
		$fields = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if (!isset($this->field[$i]['virtual']) or $this->field[$i]['virtual'] == false) {
				if ($fields != '') {
					$fields .= ',';
				}
				$fields .= $this->field[$i]['name'];
			}
		}
		
		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		
		if ($this->fixedSqlSearch != '') {
			$sql = 'SELECT '.$fields.' FROM ('.$this->fixedSqlSearch.') fixed '.$condition.';';
		}
		else {
			$sql = 'SELECT '.$fields.' FROM '.$schema.$tableName.$condition.';';
		}
		
		return $sql;
	}
	
	private function doRetrieve($verbose) {
		global $pacrudConfig;
		global $pacrudGlobal;
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			$sql = $this->sqlRetrieve();
			$xml = $this->pConnection->sqlXml($sql,$this->name);
			
			$xml = pXmlAddParent($xml,$pacrudConfig['appIdent']);
		}
		
		if ($verbose) {
			if ($this->pConnection->encoding == 'default') {
				Header('Content-type: application/xml; charset=UTF-8');
			}
			else {
				Header('Content-type: application/xml; charset='.$this->pConnection->encoding);
			}
			echo $xml;
		}
		return $xml;
	}
	
	public function makeXml($verbose) {
		global $pacrudGlobal;
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			$this->page = $_POST['page'];
			$this->pFilter->loadQuery();
			
			$count = $this->pConnection->sqlQuery($this->sqlCount());
			$xml = $this->pConnection->sqlXml($this->sqlSearch(),$this->name);
			$xmlStatus  = '<count>'.$count.'</count>'."\n";
			$xmlStatus .= '<pageLines>'.$this->pageLines().'</pageLines>'."\n";
			$xmlStatus .= '<page>'.$this->page.'</page>';
			$xmlStatus = pXmlAddParent($xmlStatus,'pGridStatus');
			
			$xml .= $xmlStatus;
			
			$xml .= $this->pFilter->makeXmlFilter();
			
			$debugSql  = '<sql>'.$this->sqlSearch().'</sql>'."\n";
			$debugSql .= '<sqlCount>'.$this->sqlCount().'</sqlCount>';
			$debugSql = pXmlAddParent($debugSql,'debugSql');
			if (isset($this->param['debug']) && $this->param['debug']) {
				$xml .= $debugSql;
			}
			
			$xml = pXmlAddParent($xml,$this->pacrudConfig['appIdent']);
		}
		
		if ($verbose) {
			if ($this->pConnection->encoding == 'default') {
				Header('Content-type: application/xml; charset=UTF-8');
			}
			else {
				Header('Content-type: application/xml; charset='.$this->pConnection->encoding);
			}
			echo $xml;
		}
		return $xml;
	}
	
	public function makeButton($verbose=true) {
		$iconSearch = pGetTheme('icons/pacrudSearch.png',true);
		$button = '<button id="'.$this->name.'Bt" onClick="javascript:'.$this->name.'.goSearch();"><img src="'.$iconSearch.'" alt="pacrudSearch" /></button>';
		if ($verbose) {
			echo $button;
		}
		return $button;
	}
	
	public function autoInit() {
		if (isset($_POST[$this->name.'_action']) && $_POST[$this->name.'_action'] == 'makeXml') {
			$this->makeXml(true);
		}
		else if (isset($_POST[$this->name.'_action']) && $_POST[$this->name.'_action'] == 'r') {
			$this->doRetrieve(true);
		}
		else {
			$this->draw(true);
		}
	}
}
