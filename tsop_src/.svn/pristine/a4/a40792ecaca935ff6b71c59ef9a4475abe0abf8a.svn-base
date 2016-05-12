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

class pacrudCrudList extends pacrudBasic {
	private $pGrid;
	private $fieldReturn;
	private $indentation;
	public $pacrudConfig;
	public $pConnection;
	public $pFilter;
	private $fixedSqlSearch;
	private $constructedGrid;
	private $orderby;
	
	public $page;
	
	function __construct($params) {
		global $pacrudConfig;
		$this->pacrudConfig = $pacrudConfig;
		
		parent::__construct($params);
		$this->constructedGrid = false;
		
		if (!isset($this->param['xmlfile'])) {
			pError(_('Propriedade xmlFile não especificada para objeto pacrudSearch'),'js');
		}
		
		$this->page = 1;
		$this->fieldReturn = array();
		
		$this->orderby = '';
	}
	
	public function setIndentation($indentation) {
		$this->indentation = $indentation;
		$this->pGrid->indentation = $indentation . '		';
	}

	protected function constructGrid() {
		$this->getObjName();
		$lines = $this->pageLines();
		$this->pGrid = new pacrudGrid($this->name,$lines);
		$this->pGrid->indentation = $this->indentation . '		';
		$this->pGrid->width = '98%';
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
		$this->pGrid->addColumn($params);
		$this->pFilter = new pacrudFilter($this->name,$this->field,'');
		$this->pFilter->setIndentation($this->indentation.'		');
		
		$param = pParameters($params);
		
		if (isset($param['sqlname'])) {
			$this->field[count($this->field)-1]['sqlname'] = $param['sqlname'];
		}
		else {
			$this->field[count($this->field)-1]['sqlname'] = $param['name'];
		}
		
		if (isset($this->param['permc']) and $this->param['permc'] == 'false') {
			$this->pFilter->permC = false;
		}
		else {
			$this->pFilter->permC = true;
		}
	}

	public function addFieldReturn($fieldName,$idReturn,$verbose=true) {
		$this->fieldReturn[] = array($fieldName,$idReturn);
		
		$field = $this->fieldByName($fieldName);
		$fieldType = $field['type'];
		
		$fieldReturn  = $this->indentation.'<script type="text/javascript">'."\n";
		$fieldReturn .= $this->indentation. '	'.$this->name.'.addFieldReturn(\''.$fieldName.'\',\''.$idReturn.'\',\''.$fieldType.'\''.");\n";
		$fieldReturn .= $this->indentation.'</script>'."\n";
		
		if ($verbose) {
			echo $fieldReturn;
		}
		return $fieldReturn;
	}
	
	private function initClientObject() {
		// trata o caminho do xmlFile (relativo e absoluto)
		if (substr($this->param['xmlfile'],0,1) == '/') {
			$ajaxFile = $this->param['xmlfile'];
		}
		else {
			$ajaxFile = $this->pacrudConfig['appWebPath'].'/'.$this->param['xmlfile'];
		}
		
		// instancia o objeto pacrudCrudList no cliente
		$clientObject = $this->indentation. '<script type="text/javascript">'."\n";
		$clientObject .= $this->indentation. '	'.$this->name.' = new pacrudCrudList(\''.$this->name.'\',\''.$ajaxFile.'\');'."\n";
		$clientObject .= $this->indentation. '	'.$this->name.'.parent = '.$this->param['crudname'].';'."\n";
		// repassa condicionalmente o pog debug para o objeto ajax
		if (isset($this->param['debug']) && $this->param['debug']) {
			$clientObject .= $this->indentation. '	'.$this->name.'.pAjax.debug = true;'."\n";
		}
		
		// repassa parametro auto click
		if (isset($this->param['autoclick']) && $this->param['autoclick']) {
			$clientObject .= $this->indentation . '	'. $this->name.'.autoClick = true;'."\n";
		}
		else {
			$clientObject .= $this->indentation . '	'. $this->name.'.autoClick = false;'."\n";
		}
		
		$clientObject .= $this->indentation. '</script>'."\n";
		return $clientObject;
	}
	
	private function makeFilters() {
		$this->pFilter->btNew = $this->param['crudname'].'.bt_new()';
		$htmlFilters = $this->pFilter->draw(false);
		
		// vinculo do pacrudFilter com o pacrudCrudList
		$htmlFilters .= $this->indentation. '		<script type="text/javascript">'."\n";
		$htmlFilters .= $this->indentation. '			'.$this->name.'.pFilter = pFilter_'.$this->name.";\n";
		$htmlFilters .= $this->indentation. '		</script>'."\n";

		return $htmlFilters;
	}
	
	private function makeGrid() {
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

		// vinculo do pacrudGrid com o pacrudCrudList
		$htmlGrid .= $this->indentation. '			'.$this->name.'.pGrid = pGrid_'.$this->name.";\n";
		
		$htmlGrid .= $this->indentation.'		</script>'."\n";
		return $htmlGrid;
	}
	
	private function makeGridNavigation() {
		$htmlGridNavigation = $this->indentation.'		<div id="pGridNavigation_'.$this->name.'" class="pacrudGridNavigation"></div>'."\n";
		$htmlGridNavigation .= $this->indentation.'		<br />'."\n";
		$htmlGridNavigation .= $this->indentation.'		<script type="text/javascript">'."\n";
		$htmlGridNavigation .= $this->indentation.'			pGridNavigation_'.$this->name.' = new pacrudGridNavigation(\''.$this->name.'\');'."\n";
		
		// vinculo do pacrudGridNavigation com o pacrudCrudList
		$htmlGridNavigation .= $this->indentation.'			'.$this->name.'.pGridNavigation = pGridNavigation_'.$this->name.';'."\n";

		$htmlGridNavigation .= $this->indentation.'		</script>'."\n";
		return $htmlGridNavigation;
	}
	
	private function makeCrudLink() {
		$htmlCrudLink  = $this->indentation.'		<script type="text/javascript">'."\n";
		$htmlCrudLink .= $this->indentation.'			'.$this->param['crudname'].'.pCrudList = '.$this->name.';'."\n";
		$htmlCrudLink .= $this->indentation.'		</script>'."\n";
		return $htmlCrudLink;
	}
	
	public function draw($verbose) {
		global $pacrudConfig;
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_crud_list.php');
		
		// junta os objetos
		$pCrudListInit = $this->initClientObject();

		$pCrudList  = $this->makeFilters();
		$pCrudList .= $this->makeGrid();
		$pCrudList .= $this->makeGridNavigation();
		$pCrudList .= $this->makeCrudLink();
		
		$pCrudList = $pCrudListInit . $pCrudList;
		if ($verbose) {
			echo $pCrudList;
		}
		return $pCrudList;
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
	
	public function setSqlSearch($sql) {
		$this->fixedSqlSearch = $sql;
		
		for ($i=0; $i < $this->fieldCount(); $i++) {
			$this->field[$i]['sqlname'] = 'fixed.'.$this->field[$i]['sqlname'];
		}
	}
	
	/**
	 * Permite ao desenvolvedor da aplicação explicitar qual pacrudConnection usar
	 */
	public function setConnection($connecion) {
		$this->pConnection = $connecion;
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
			Header('Content-type: application/xml; charset=UTF-8');
			echo $xml;
		}
		return $xml;
	}
}
