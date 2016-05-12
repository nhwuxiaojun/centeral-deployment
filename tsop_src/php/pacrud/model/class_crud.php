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

class paCRUD extends pacrudBasic {
	private $indentation;
	
	public $pacrudConfig;
	public $pSearch;
	public $pCrudList;
	
	public $parent1x1;
	public $parent1x1Condition;
	public $son1x1;
	
	private $parent1xN;
	
	public $customSqlCreate;
	public $customSqlRetrieve;
	public $customSqlCount;
	public $customSqlUpdate;
	public $customSqlDelete;

	public $xmlRetrieve;
	
	public $conteinerType; //div, fieldset, window
	public $conteinerVisible;
	
	protected $serialFields;
	public $pConnection;
	
	private $permission;
	
	private $action;
	
	public $name;
	
	private $capsLock;
	private $clientObjectsStarted;
	
	function __construct($params) {
		global $pacrudConfig;
		
		$this->serialFields = array();
		
		$this->parent1x1 = null;
		$this->parent1x1Condition = null;
		$this->son1x1 = array();
		$this->clientObjectsStarted = false;
		$this->action = null;
		$this->pacrudConfig = $pacrudConfig;
		$this->conteinerType = '';
		$this->conteinerVisible = true;
		
		$this->customSqlCreate = '';
		$this->customSqlRetrieve = '';
		$this->customSqlCount = '';
		$this->customSqlUpdate = '';
		$this->customSqlDelete = '';
		
		// prepara a propriedade xmlFile
		$files = get_included_files();
		$lastInclusion = $files[count($files)-1];
		
		parent::__construct($params);
		
		if (!isset($this->param['xmlfile'])) {
			if (dirname($_SERVER["SCRIPT_FILENAME"]) == dirname($lastInclusion)) {
				$this->param['xmlfile'] = basename($lastInclusion);
			}
			else {
				$location = substr($_SERVER["SCRIPT_FILENAME"],0,strlen($_SERVER["SCRIPT_NAME"])-1)."\n";
				$this->param['xmlfile'] = dirname($_SERVER["REQUEST_URI"]).'/'.substr($lastInclusion,strlen($location)-1);
			}
		}
		
		if (!isset($this->param['tablename'])) {
			$this->param['tablename'] = '';
		}
		
		if (!isset($this->param['onduplicate'])) {
			$this->param['onduplicate'] = 'error';
		}
		
		if (!isset($this->param['list'])) {
			$this->param['list'] = true;
		}
		
		if (!isset($this->param['capslock'])) {
			$this->capsLock = false;
		}
		else {
			if ($this->param['capslock']) {
				$this->capsLock = true;
			}
			else {
				$this->capsLock = false;
			}
		}
		
		// permissões
		if (isset($this->param['routine'])) {
			$this->setPermissions($this->param['routine']);
		}
		else if (isset($this->param['permission'])) {
				$this->permission = $this->param['permission'];
		}
		else {
			$this->permission = 'crud';
		}
		
		if (isset($this->param['parent1xn'])) {
			$this->parent1xN = $this->param['parent1xn'];
		}
		else {
			$this->parent1xN = '';
		}
		
		$this->pSearch = null;
		$this->pCrudList = null;
	}
	
	public function startClientObjects() {
		if ($this->clientObjectsStarted == false) {
			$this->clientObjectsStarted = true;
			$this->getObjName();
			
			if ($this->param['tablename'] == '') {
				$this->param['tablename'] = $this->name;
			}
			
			//pSearch
			$debug = '';
			if (isset($this->param['debug']) && $this->param['debug']) {
				$debug = 'debug,';
			}
			$pageLines = '';
			if (isset($this->param['pagelines'])) {
				$pageLines = 'pageLines='.$this->param['pagelines'].',';
			}
			$title = '';
			if (isset($this->param['title'])) {
				$title = 'title='.$this->param['title'].',';
			}
		
			$this->pSearch = new pacrudSearch('objName=pSearch_'.$this->name.','.
													'xmlFile='.$this->param['xmlfile'].','.
													'tableName='.$this->param['tablename'].','.
													$title.$debug.$pageLines.
													'schema='.$this->param['schema']
												);
			// crudList
			if (isset($this->param['autoclick'])) {
				$autoClick = 'autoClick,';
			}
			else {
				$autoClick = '';
			}
		
			if ($this->getPermission('c') == false) {
				$paramPerm = ',permC=false';
			}
			else {
				$paramPerm = '';
			}
		
			if ($this->param['list']) {
				$this->pCrudList = new pacrudCrudList('objName=pCrudList_'.$this->name.','.
														'xmlFile='.$this->param['xmlfile'].','.
														'crudName='.$this->name.','.
														'tableName='.$this->param['tablename'].','.
														$debug.$pageLines.$autoClick.
														'schema='.$this->param['schema'].
														$paramPerm
												);
			}
			else {
				$this->pCrudList = false;
			}
		}
		return true;
	}
	
	public function setConnection($connecion) {
		$this->startClientObjects();
		$this->pConnection = $connecion;
		$this->pSearch->pConnection = $connecion;
		$this->pCrudList->pConnection = $connecion;
	}
	
	public function addField($params) {
		$this->startClientObjects();
		
		parent::addField($params);
		
		$param = pParameters($params);
		
		$fieldIndex = count($this->field)-1;
		
		// parâmetro fieldId
		if (isset($param['fieldid'])) {
			$this->field[$fieldIndex]['fieldid'] = $param['fieldid'];
		}
		else {
			$this->field[$fieldIndex]['fieldid'] = $param['name'];
		}
		
		// parâmetro default
		if (isset($param['default'])) {
			$this->field[$fieldIndex]['default'] = $param['default'];
		}
		
		// parâmetro pk
		if (isset($param['pk'])) {
			$this->field[$fieldIndex]['pk'] = true;
		}
		else {
			$this->field[$fieldIndex]['pk'] = false;
		}
		
		// parâmetro readonly
		if (isset($param['readonly'])) {
			$this->field[$fieldIndex]['readonly'] = true;
		}
		else {
			$this->field[$fieldIndex]['readonly'] = false;
		}
		
		// parâmetro nocreate
		if (isset($param['nocreate'])) {
			$this->field[$fieldIndex]['nocreate'] = true;
		}
		else {
			$this->field[$fieldIndex]['nocreate'] = false;
		}
		
		// parâmetro virtual
		if (isset($param['virtual'])) {
			$this->field[$fieldIndex]['virtual'] = true;
			$virtual = true;
		}
		else {
			$this->field[$fieldIndex]['virtual'] = false;
			$virtual = false;
		}
		
		// parâmetro nohtml
		if (isset($param['nohtml'])) {
			$this->field[$fieldIndex]['nohtml'] = true;
		}
		else {
			$this->field[$fieldIndex]['nohtml'] = false;
		}
		
		// parâmetro capsLock
		if (isset($param['capslock'])) {
			if ($param['capslock']) {
				$this->field[$fieldIndex]['capslock'] = true;
			}
			else {
				$this->field[$fieldIndex]['capslock'] = false;
			}
		}
		else {
			if ($this->field[$fieldIndex]['type'] == 'string' or $this->field[$fieldIndex]['type'] == 'text') {
				$this->field[$fieldIndex]['capslock'] = $this->capsLock;
			}
			else {
				$this->field[$fieldIndex]['capslock'] = false;
			}
		}
		
		// parâmetro list
		if ($this->param['list'] and $virtual == false) {
			$this->pCrudList->addField($params);
		}
		
		if ($virtual == false) {
			$this->pSearch->addField($params);
		}
	}
	
	public function addParent1x1($parent,$parentFieldCondition='',$conditionValue='') {
		$parent->son1x1[] = $this;
		$this->parent1x1 = $parent;
		$arrCondition['fieldName'] = $parentFieldCondition;
		$arrCondition['value'] = $conditionValue;
		$this->parent1x1Condition = $arrCondition;
		
		for ($i=0; $i < count($this->parent1x1->field); $i++) {
			if ($this->parent1x1->field[$i]['name'] == $parentFieldCondition) {
				$this->parent1x1->field[$i]['haveChild'] = true;
			}
		}
	}
	
	private function fixCondition($condition) {
		// corrige condições "campo=NULL" para "campo IS NULL" apos condição WHERE
		$arrSql = explode('WHERE',$condition);
		$fixedCondition = '';
		for ($i=0; $i<count($arrSql); $i++) {
			if ($i == 0)
				$sqlPart = $arrSql[$i];
			else
				$sqlPart = str_replace('=NULL',' IS NULL',$arrSql[$i]);
			
			if ($fixedCondition == '')
				$fixedCondition .= $sqlPart;
			else
				$fixedCondition .= 'WHERE'.$sqlPart;
		}

		return $fixedCondition;
	}
	
	/**
	 * Recupera o fieldName pelo fieldId
	 * @param: fieldId string
	 * @returns: string
	 */
	public function fieldNameById($fieldId) {
		for ($i=0; $i < count($this->field); $i++) {
			if ($this->field[$i]['fieldid'] == $fieldId) {
				return $this->field[$i]['name'];
			}
		}
		return false;
	}
	
	/*
	 * substitui os parâmetros pelos valores no comando sql (exemplo: substitui ':new_campo1:' por 'valor1')
	 * @global: $pacrudConfig
	 */
	protected function sqlValues($sql,$values=array()) {
		$sqlVal = $sql;

		//substitui variáveis globais do pacrud no comando sql
		$sqlVal = $this->pConnection->replacePacrudGlobals($sqlVal);
		
		// Quanto possui objeto pai, verifica os valores dos campos no objeto pai (apenas para evento retrieve)
		if ($this->parent1x1 != null and $this->action == 'r') {
			
			// Carrega um objeto xml através dos dados do pai 1x1
			$xml = $this->parent1x1->xmlRetrieve;
			$xml = pXmlAddParent($xml,'pacrud');
			
			$objXml = simplexml_load_string($xml);
			
			// Aplica a substituição apenas nos campos chave primária
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['pk']) {
					$parentName = $this->parent1x1->name;
					$fieldNameOnParent = $this->parent1x1->fieldNameById($this->field[$i]['fieldid']);
					$value = $objXml->$parentName->$fieldNameOnParent;
					
					$value = pFormatSql($value,$this->field[$i]['type'],$this->field[$i]['capslock']);
					$field = ':new_'.$this->field[$i]['name'].':';
					$sqlVal = str_replace($field,$value,$sqlVal);
				}
			}
		}
		
		//substitui os valores de acordo com o fieldName ou fieldId
		for ($i = 0; $i < count($this->field); $i++) {
			//substitui o parametro pelo valor de acordo com o nome do campo
			if (isset($values[$this->field[$i]['name']])) {
				$value = pFormatSql($values[$this->field[$i]['name']],$this->field[$i]['type'],$this->field[$i]['capslock']);
				$field = ':new_'.$this->field[$i]['name'].':';
				$sqlVal = str_replace($field,$value,$sqlVal);
			}
			//substitui o parametro pelo valor de acordo com fieldId do campo
			else if (isset($_POST['new_'.$this->field[$i]['fieldid']])) {
				$value = pFormatSql($_POST['new_'.$this->field[$i]['fieldid']],$this->field[$i]['type'],$this->field[$i]['capslock']);
				$field = ':new_'.$this->field[$i]['name'].':';
				$sqlVal = str_replace($field,$value,$sqlVal);
			}

			//substitui o parametro pelo valor de acordo com fieldId anterior do campo caso exista
			if (isset($_POST['old_'.$this->field[$i]['fieldid']])) {
				$value = pFormatSql($_POST['old_'.$this->field[$i]['fieldid']],$this->field[$i]['type'],false);
				$field = ':old_'.$this->field[$i]['name'].':';
				$sqlVal = str_replace($field,$value,$sqlVal);
			}
		}
		
		$sqlVal = $this->fixCondition($sqlVal);
		return $sqlVal;
	}
	
	public function sqlCount() {
		if ($this->customSqlCount != '') {
			$sql = $this->customSqlCount;
		}
		else {
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
					$value = ':new_'.$fieldName.':';
					$condition .= $fieldName.'='.$value;
				}
			}
			$tableName = $this->param['tablename'];
			$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

			$sql = 'SELECT count(*) FROM '.$schema.$tableName.$condition.';';
		}
		return $sql;
	}
	
	public function sqlCreate() {
		if ($this->customSqlCreate != '') {
			$sql = $this->customSqlCreate;
		}
		else {
			$tableName = $this->param['tablename'];
			$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		
			$fields = '';
			$values = '';
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['type'] != 'serial' and $this->field[$i]['nocreate'] == false and $this->field[$i]['virtual'] == false) {
					if ($fields != '') {
						$fields .= ',';
						$values .= ',';
					}
					$fields .= $this->field[$i]['name'];
					$values .= ':new_'.$this->field[$i]['name'].':';
				}
			}

			$sql = 'INSERT INTO '.$schema.$tableName.' ('.$fields.') VALUES ('.$values.');';
		}
		return $sql;
	}

	public function sqlRetrieve() {
		// monta condicao
		$condition = '';
		if ($this->customSqlRetrieve != '') {
			$sql = $this->customSqlRetrieve;
		}
		else {
			for ($i = 0; $i < count($this->field); $i++) {
				$fieldName = $this->field[$i]['name'];
				if ($this->field[$i]['pk']) {
					if ($condition == '') {
						$condition .= ' WHERE ';
					}
					else {
						$condition .= ' AND ';
					}
					$value = ':new_'.$fieldName.':';
					$condition .= $fieldName.'='.$value;
				}
			}

			// monta campos
			$fields = '';
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['virtual'] == false) {
					if ($fields != '') {
						$fields .= ',';
					}
					$fields .= $this->field[$i]['name'];
				}
			}

			$tableName = $this->param['tablename'];
			$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

			$sql = 'SELECT '.$fields.' FROM '.$schema.$tableName.$condition.';';
		}
		return $sql;
	}
	
	public function sqlGetSerials() {
		$condition = '';
		for ($i = 0; $i < count($this->field); $i++) {
			$fieldName = $this->field[$i]['name'];
			if ($this->field[$i]['type'] != 'serial' && $this->field[$i]['nocreate'] == false && $this->field[$i]['virtual'] == false) {
				if ($condition == '') {
					$condition .= ' WHERE ';
				}
				else {
					$condition .= ' AND ';
				}
				$value = ':new_'.$fieldName.':';
				$condition .= $fieldName.'='.$value;
			}
		}

		$fields = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($this->field[$i]['type'] == 'serial' && $this->field[$i]['nocreate'] == false && $this->field[$i]['virtual'] == false) {
				if ($fields != '') {
					$fields .= ',';
				}
				$fields .= $this->field[$i]['name'];
			}
		}

		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

		$sql = 'SELECT '.$fields.' FROM '.$schema.$tableName.$condition.' ORDER BY '.$fields.' DESC LIMIT 1;';
		return $sql;
	}
	
	public function sqlUpdate() {
		$values = '';
		if ($this->customSqlUpdate != '') {
			$sql = $this->customSqlUpdate;
		}
		else {
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['virtual'] == false) {
					if ($values != '') {
						$values .= ',';
					}
					$values .= $this->field[$i]['name'].'=:new_'.$this->field[$i]['name'].':';
				}
			}

			$condition = '';
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['pk']) {
					if ($condition == '') {
						$condition .= ' WHERE ';
					}
					else {
						$condition .= ' AND ';
					}
					$condition .= $this->field[$i]['name'].'=:old_'.$this->field[$i]['name'].':';
				}
			}

			$tableName = $this->param['tablename'];
			$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

			$sql = 'UPDATE '.$schema.$tableName. ' SET '.$values.$condition.';';
		}
		return $sql;
	}

	public function sqlDelete() {
		$condition = '';
		if ($this->customSqlDelete != '') {
			$sql = $this->customSqlDelete;
		}
		else {
			for ($i = 0; $i < count($this->field); $i++) {
				if ($this->field[$i]['pk']) {
					if ($condition == '') {
						$condition .= ' WHERE ';
					}
					else {
						$condition .= ' AND ';
					}
					$condition .= $this->field[$i]['name'].'=:new_'.$this->field[$i]['name'].':';
				}
			}

			$tableName = $this->param['tablename'];
			$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());

			$sql = 'DELETE FROM '.$schema.$tableName.$condition.';';
		}
		return $sql;
	}
	
	/**
	 * Devolve um array associativo com valor para campos do tipo serial, incluindo os seriais do objeto pai 1x1
	 *
	 * @param: $serialsParent array
	 * @returns: array
	 */
	public function sincPk($serialsParent) {
		$serials = array();
		
		// Cria um array com os campos pk do tipo inteiro
		$childParent = array();
		for ($i = 0; $i < count($this->field); $i++) {
			if ($this->field[$i]['pk'] and $this->field[$i]['type'] == 'integer') {
				$childParent[] = $this->field[$i]['name'];
			}
		}
		
		// Corre o array do objeto pai e renomeia os campos da chave estrangeira caso seja diferentes no objeto filho
		if (count($childParent) > 0) {
			$iParent = 0;
			foreach ($serialsParent as $keyParent => $valueParent) {
				$serials[$childParent[$iParent]] = $valueParent;
				$iParent++;
			}
		}
		
		// Junta os seriais do campo filho caso haja
		foreach ($this->serialFields as $keyChild => $valueChild) {
			$serials[$keyChild] = $valueChild;
		}
		
		return $serials;
	}
	
	public function doCreate($verbose) {
		global $pacrudGlobal;
		
		$this->action = 'c';
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			if ($this->beforeCreate()) {
			
				if (isset($this->param['onduplicate']) and $this->param['onduplicate'] == 'error') {
					// verifica se possui registro duplicado
					$sqlCount = $this->sqlValues($this->sqlCount());
					$count = $this->pConnection->sqlQuery($sqlCount);
					
					if ($count > 0) {
						if ($this->pConnection->encoding == 'default') {
							Header('Content-type: application/xml; charset=UTF-8');
						}
						else {
							Header('Content-type: application/xml; charset='.$this->pConnection->encoding);
						}
						echo xmlError('Duplacated',_('Registro duplicado.'));
						return false;
					}
				}
				
				if ($this->parent1x1 == null) {
					$sql = $this->sqlValues($this->sqlCreate());
					$this->pConnection->sqlQuery($sql);
					$this->serialFields = $this->getPks();
				}
				else {
					$pkValue = $this->sincPk($this->parent1x1->serialFields);
					
					if (isset($this->param['onduplicate']) and $this->param['onduplicate'] == 'update') {
						// verifica se já existe um registro com esta chave primária
						$sqlCount = $this->sqlValues($this->sqlCount(),$pkValue);
						$count = $this->pConnection->sqlQuery($sqlCount);
						if ($count > 0) {
							//atualiza
							$sql = $this->sqlUpdate();
							$sql = str_replace('old_','new_',$sql);
							$sql = $this->sqlValues($sql,$pkValue);
						}
						else {
							//insere
							$sql = $this->sqlValues($this->sqlCreate(),$pkValue);
						}
					}
					else {
						$sql = $this->sqlValues($this->sqlCreate(),$pkValue);
					}
					
					$this->pConnection->sqlQuery($sql);
					$this->serialFields = array_merge($this->getPks(),$this->parent1x1->serialFields);
				}
				
				// laço que trata os objetos filhos
				for ($i=0; $i < count($this->son1x1); $i++) {
					if (isset($_POST[$this->son1x1[$i]->name.'_action'])) {
						$this->son1x1[$i]->doCreate(false);
					}
				}
				
			}
		}
		
		if ($this->parent1x1 == null) {
			$this->afterCreate();
			$this->doRetrieve($verbose,$this->serialFields);
		}
	}
	
	/**
	 * Gatilho disparado depois do evento create
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function beforeCreate() {
		// Reservado para desenvolvedor da aplicação, deve retornar true ou false
		return true;
	}
	
	/**
	 * Gatilho disparado depois do evento update
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function beforeUpdate() {
		// Reservado para desenvolvedor da aplicação, deve retornar true ou false
		return true;
	}
	
	/**
	 * Gatilho disparado depois do evento update
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function beforeDelete() {
		// Reservado para desenvolvedor da aplicação, deve retornar true ou false
		return true;
	}
	
	/**
	 * Gatilho disparado depois do evento create
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function afterCreate() {
		// Reservado para desenvolvedor da aplicação
	}
	
	/**
	 * Gatilho disparado depois do evento update
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function afterUpdate() {
		// Reservado para desenvolvedor da aplicação
	}
	
	/**
	 * Gatilho disparado depois do evento update
	 * Função reservada para desenvolvedor da aplicação
	 */
	public function afterDelete() {
		// Reservado para desenvolvedor da aplicação
	}
	
	public function doAccessDenied($verbose) {
		global $pacrudGlobal;
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			$xml = xmlError('access denied',_('Acesso Negado'));
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
	
	public function doRetrieve($verbose,$values=array()) {
		global $pacrudConfig;
		global $pacrudGlobal;
		
		$this->action = 'r';
		
		if ($pacrudGlobal['currentUser'] == '') {
			$this->xmlRetrieve = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			$sql = $this->sqlValues($this->sqlRetrieve(),$this->sincPk($values));
			$this->xmlRetrieve = $this->pConnection->sqlXml($sql,$this->name);
			
			// laço que trata os objetos filhos recursivamente
			for ($i=0; $i < count($this->son1x1); $i++) {
				if (isset($_POST[$this->son1x1[$i]->name.'_action'])) {
					$this->xmlRetrieve .= $this->son1x1[$i]->doRetrieve(false);
				}
			}
			
			// adiciona o appIdent no XML
			if ($this->parent1x1 == null) {
				$this->xmlRetrieve = pXmlAddParent($this->xmlRetrieve,$pacrudConfig['appIdent']);
			}
		}
		
		if ($verbose) {
			if ($this->pConnection->encoding == 'default') {
				Header('Content-type: application/xml; charset=UTF-8');
			}
			else {
				Header('Content-type: application/xml; charset='.$this->pConnection->encoding);
			}
			echo $this->xmlRetrieve;
		}
		return $this->xmlRetrieve;
	}
	
	/**
	 * Monta um array associativo com nome do campo e valor para campos do tipo serial
	 *
	 * @returns: array
	 */
	public function getPks() {
		// procura campos serial
		$serialField = array();
		for ($i=0; $i < count($this->field); $i++) {
			if ($this->field[$i]['type'] == 'serial') {
				$serialField[] = $this->field[$i]['name'];
			}
		}
		// se encontrou algum campo serial recupera os valores recem gerados automaticamente pelo sgdb
		if (count($serialField) > 0) {
			$arrPks = $this->pConnection->fetch_assoc($this->sqlValues($this->sqlGetSerials()));
		}
		else {
			$arrPks = array();
			for ($i=0; $i < count($this->field); $i++) {
				if ($this->field[$i]['pk']) {
					$arrPks[$this->field[$i]['name']] = $_POST['new_'.$this->field[$i]['fieldid']];
				}
			}
		}
		
		return $arrPks;
	}
	
	public function doUpdate($verbose,$valuesParent=array()) {
		global $pacrudGlobal;
		
		$this->action = 'u';
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			if ($this->beforeUpdate()) {
				
				if ($this->parent1x1 == null) {
					$sql = $this->sqlValues($this->sqlUpdate());
				}
				else {
					$sqlCount = $this->sqlValues($this->sqlCount(),$this->sincPk($valuesParent));
					$sonCount = $this->pConnection->sqlQuery($sqlCount);
					// se não possui o registro na tabela filha da um create, se possui, da um update normal
					if ($sonCount == '0') {
						$sql = $this->sqlValues($this->sqlCreate(),$this->sincPk($valuesParent));
					}
					else {
						$sql = $this->sqlValues($this->sqlUpdate());
					}
				}
				
				$this->pConnection->sqlQuery($sql);
				
				$this->serialFields = $this->getPks();
				
				// laço que trata os objetos filhos
				for ($i=0; $i < count($this->son1x1); $i++) {
					if (isset($_POST[$this->son1x1[$i]->name.'_action'])) {
						$this->son1x1[$i]->doUpdate(false,$this->serialFields);
					}
				}
				
			}
		}
		
		$this->afterUpdate();
		
		if ($this->parent1x1 == null) {
			$this->doRetrieve($verbose);
		}
	}
	
	public function doDelete($verbose) {
		global $pacrudGlobal;
		
		$this->action = 'd';
		
		if ($pacrudGlobal['currentUser'] == '') {
			$xml = xmlError('session expires',_('Sua sessão expirou, faça login novamente.'));
		}
		else {
			if ($this->beforeDelete()) {
				$sql = $this->sqlValues($this->sqlDelete());
				$this->pConnection->sqlQuery($sql);
				$xml = '<status>ok</status>'."\n";
				$xml .= '<msg>'._('Registro excluído com sucesso!').'</msg>';
				$xml = pXmlAddParent($xml,$this->name);
			}
			else {
				$xml = '<status>err</status>'."\n";
				$msg = _('paCRUD Error: beforeDelete retornou false para objeto ":o:"!');
				$msg = str_replace($msg,':o:',$this->name);
				$xml .= '<msg>'.$msg.'</msg>';
				$xml = pXmlAddParent($xml,$this->name);
			}
		}
		
		if ($verbose) {
			Header('Content-type: application/xml; charset=UTF-8');
			echo $xml;
		}
		
		$this->afterDelete();
		
		return $xml;
	}	
	
	public function drawSearch() {
		$pSearch = $this->pSearch->draw(false);
		for ($i = 0; $i < count($this->field); $i++) {
			if ($this->field[$i]['pk']) {
				$pSearch .= $this->pSearch->addFieldReturn($this->field[$i]['name'],$this->field[$i]['fieldid'],false,false);
			}
		}
		$pSearch .= '<script type="text/javascript">'."\n";
		$pSearch .= '	pSearch_'.$this->name.'.crudName = \''.$this->name.'\';'."\n";
		$pSearch .= '</script>'."\n";
		return $pSearch;
	}
	
	/**
	 * Monta a linha de código que faz require_once para o arquivo controller do pacrudSearch
	 * @param $objName string: Nome do objeto pacrudSearch
	 * @returns string: linha de código php ex: require_once('ctrl_search_pessoa.php');
	 */
	private function requirePacrudSearch($objName) {
		global $pacrudConfig;
		
		$fileList = scandir($pacrudConfig['appPath']);
		for ($i=0; $i < count($fileList); $i++) {
			
			$info = pathinfo($fileList[$i]);
			
			//apenas arquivos .php
			if (strtolower($info['extension']) == 'php' and $info['basename'] != 'index.php' and $info['basename'] != 'pacrud.php') {
				$fileContent = file_get_contents($pacrudConfig['appPath'] . '/' . $fileList[$i]);
				
				// verifica se o arquivo inicializa o objeto informado
				if (substr_count($fileContent, '$'.$objName.' = new pacrudSearch(') > 0) {
					return 'require_once(\''.$fileList[$i].'\');';
				}
			}
		}
		
		return '//require_once(\'\'); ATENÇÃO! não foi encontrado o nenhum arquivo controller para o objeto "'.$objName.'". Informe o nome do arquivo nesta linha.';
	}
	
	/**
	 * Desenha o forumlário
	 *
	 * @returns string: html do formulário
	 */	
	public function drawForms($verbose=true,$withPhpCode=false) {
		$form = '';
		if ($this->parent1x1 == null) {
			if ($withPhpCode) {
				$controls = '<?php $'.$this->name.'->drawControls(); ?>';
				$crudList = '	<?php $'.$this->name.'->drawCrudList(); ?>';
			}
			else {
				$controls = $this->drawControls(false);
				$crudList = $this->drawCrudList(false);
			}
			
			if ($this->conteinerType == '') {
				$this->conteinerType = 'fieldset';
				if ($this->parent1xN != '') {
					$this->conteinerType = 'div';
					$this->conteinerVisible = false;
				}
			}
			
			if ($this->conteinerVisible) {
				$containerStyle = 'display:block';
			}
			else {
				$containerStyle = 'display:none';
			}
			
			$title = '';
			if (isset($this->param['title'])) {
				$title = $this->param['title'];
			}
			
			if ($withPhpCode) {
				$form .= '<?php'."\n";
				$form .= 'require_once(\'pacrud.php\');'."\n";
				for ($i=0; $i < count($this->field); $i++) {
					if (isset($this->field[$i]['search'])) {
						$form .= $this->requirePacrudSearch($this->field[$i]['search'])."\n";
					}
				}
				$form .= 'require_once(\''.basename($_SERVER["PHP_SELF"]).'\');'."\n";
				$form .= '?>'."\n\n";
			}
			
			if ($this->conteinerType == 'fieldset') {
				$form .= '<fieldset id="'.$this->name.'_conteiner" style="'.$containerStyle.'">'."\n";
				$form .= '<legend>'.$title.'</legend>'."\n";
			}
			
			if ($this->conteinerType == 'div') {
				$form .= '<div id="'.$this->name.'_conteiner" style="'.$containerStyle.'">'."\n";
			}
			
			$form .= "\n";
			$form .= '	<div id="'.$this->name.'_form">'."\n";
			$form .= '		<br />'."\n";
			$form .= '		<table class="pacrudFormTable">'."\n";
		}
		else {
			$form .= '		<div id="'.$this->name.'_form" style="display:none">'."\n";
			$form .= '			<table class="pacrudFormTable">'."\n";
		}
		
		// campos
		for ($i=0; $i < count($this->field); $i++) {
			if (!$this->field[$i]['nohtml'] and ($this->parent1x1 == null or !$this->field[$i]['pk'])) {
				$label = $this->field[$i]['label'];
				$id = $this->field[$i]['fieldid'];
				
				if ($this->field[$i]['notnull']) {
					$notNull = '*';
				}
				else {
					$notNull = '';
				}
				
				if ($this->field[$i]['readonly'] or $this->field[$i]['type'] == 'serial') {
					$disabled = ' disabled="disabled"';
				}
				else {
					$disabled = '';
				}
				
				if (isset($this->field[$i]['search'])) {
					$pSearch = $this->field[$i]['search'];
					
					if (!isset($$pSearch)) {
						global $$pSearch;
					}
					
					if ($withPhpCode) {
						$search = '<?php $'.$pSearch.'->makeButton(); ?>';
					}
					else {
						$search = $$pSearch->makeButton(false);
					}
				}
				else {
					$search = '';
				}
				
				if (isset($this->field[$i]['default'])) {
					$defaultValue = $this->field[$i]['default'];
				}
				else {
					$defaultValue = '';
				}
				
				if ($this->parent1x1 == null) {
					$indentation = '			';
				}
				else {
					$indentation = '				';
				}
				
				$formChild = '';
				$onChange = '';
				if (isset($this->field[$i]['haveChild'])) {
					$formChild .= '		</table>'."\n";
					for ($j=0; $j < count($this->son1x1); $j++) {
						$formChild .= $this->son1x1[$j]->drawForms(false,$withPhpCode);
						$onChange = ' onchange="'.$this->name.'.visibleSon1x1()"';
					}
					$formChild .= '		<table class="pacrudFormTable">'."\n";
				}
				
				$form .= $indentation.'<tr>'."\n";
				if ($this->field[$i]['type'] == 'boolean') {
					if (isset($this->field[$i]['default']) and ($this->field[$i]['default'] == 'true' or $this->field[$i]['default'] == 't')) {
						$checked = ' checked="checked"';
					}
					else {
						$checked = '';
					}
					$form .= $indentation.'	<td class="pacrudFormLabel"><br /></td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><input id="'.$id.'" type="checkbox"'.$disabled.$checked.$onChange.' />'.$label.' '.$search.'</td>'."\n";
				}
				else if ($this->field[$i]['type'] == 'date') {
					$form .= $indentation.'	<td class="pacrudFormLabel">'.$label.':</td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><input id="'.$id.'" type="text" size="9" maxlength="10"'.$disabled.$onChange.' value="'.$defaultValue.'" />'.$search.$notNull.'</td>'."\n";
				}
				else if ($this->field[$i]['type'] == 'integer' or $this->field[$i]['type'] == 'serial') {
					$form .= $indentation.'	<td class="pacrudFormLabel">'.$label.':</td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><input id="'.$id.'" type="text" size="9"'.$disabled.$onChange.' value="'.$defaultValue.'" />'.$search.$notNull.'</td>'."\n";
				}
				else if ($this->field[$i]['type'] == 'timestamp') {
					$form .= $indentation.'	<td class="pacrudFormLabel">'.$label.':</td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><input id="'.$id.'" type="text" size="17" maxlength="19"'.$disabled.$onChange.' value="'.$defaultValue.'" />'.$search.$notNull.'</td>'."\n";
				}
				else if ($this->field[$i]['type'] == 'text') {
					$form .= $indentation.'	<td class="pacrudFormLabel">'.$label.':</td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><textarea id="'.$id.'" cols="26" rows="3" '.$disabled.$onChange.'>'.$defaultValue.'</textarea>'.$search.$notNull.'</td>'."\n";
				}
				else {
					if (isset($this->field[$i]['size']) and $this->field[$i]['size'] != '') {
						if ($this->field[$i]['size'] > 40) {
							$size = 40;
						}
						else {
							$size = $this->field[$i]['size'];
						}
						$maxLength = ' maxlength='.$this->field[$i]['size'];
					}
					else {
						$size = '40';
						$maxLength = '';
					}
					$form .= $indentation.'	<td class="pacrudFormLabel">'.$label.':</td>'."\n";
					$form .= $indentation.'	<td class="pacrudFormFields"><input id="'.$id.'" type="text" size="'.$size.'"'.$disabled.$onChange.$maxLength.' value="'.$defaultValue.'" />'.$search.$notNull.'</td>'."\n";
				}
				$form .= $indentation.'</tr>'."\n";
				
				$form .= $formChild;
			}
		}
		
		if ($this->parent1x1 == null) {
			$form .= '			<tr>'."\n";
			$form .= '				<td class="pacrudFormLabel"><br /></td>'."\n";
			$form .= '				<td class="pacrudFormFields">'.$controls.'</td>'."\n";
			$form .= '			</tr>'."\n";
			$form .= '		</table>'."\n";
			$form .= '		<br />'."\n";
		
			if ($this->parent1xN == '') {
				$form .= '		* '._('Campos de preenchimento obrigatório')."\n";
			}
			
			$form .= '	</div>'."\n";
			$form .= "\n";
			$form .= $crudList."\n";
			$form .= "\n";
			
			if ($this->conteinerType == 'fieldset') {
				$form .= '</fieldset>'."\n";
			}
			
			if ($this->conteinerType == 'div') {
				$form .= '</div>'."\n";
			}
			
			$haveFieldReturn = false;
			for ($i=0; $i < count($this->field); $i++) {
				if (isset($this->field['search']) or $this->field[$i]['virtual']) {
					$haveFieldReturn = true;
				}
			}
			
			if ($withPhpCode and $haveFieldReturn) {
				$form .= "\n";
				$form .= '<?php'."\n";
			}
			
			// faz a ligação entre os objetos Search (crudState);
			for ($i=0; $i < count($this->field); $i++) {
				if (isset($this->field[$i]['search'])) {
					$pSearch = $this->field[$i]['search'];
					if ($withPhpCode) {
						// addFieldReturn para o campo que possui o botão search
						if (isset($this->field[$i]['search'])) {
							$form .= '$'.$pSearch.'->addFieldReturn(\''.$this->field[$i]['name'].'\',\''.$this->field[$i]['fieldid'].'\');'."\n";
							$lastSearch = $this->field[$i]['search'];
						}
					}
					else {
						$form .= $$pSearch->crudState($this->name,false);
					}
				}
				
				// addFieldReturn para campos virtuais
				if ($withPhpCode and $this->field[$i]['virtual']) {
					$form .= '$'.$lastSearch.'->addFieldReturn(\''.$this->field[$i]['name'].'\',\''.$this->field[$i]['fieldid'].'\');'."\n";
				}
			}
			if ($withPhpCode and $haveFieldReturn) {
				$form .= '$'.$pSearch.'->crudState(\''.$this->name.'\');'."\n";
				$form .= '?>'."\n";
			}
		}
		else {
			$form .= '			</table>'."\n";
			$form .= '		</div>'."\n";
		}
		
		if ($verbose) {
			if (isset($this->param['includehead'])) {
				include($this->param['includehead']);
			}
			
			echo $form;
			
			if (isset($this->param['includefooter'])) {
				include($this->param['includefooter']);
			}
		}
		return $form;
	}
	
	public function drawCrudList($verbose=true) {
		$pCrudList = '';
	
		$pCrudList .= '<div id="pCrudList_'.$this->name.'" style="display:none;">'."\n";

		$pCrudList .= $this->pCrudList->draw(false);
		for ($i = 0; $i < count($this->field); $i++) {
			if ($this->field[$i]['pk']) {
				$pCrudList .= $this->pCrudList->addFieldReturn($this->field[$i]['name'],$this->field[$i]['fieldid'],false);
			}
		}
		
		$pCrudList .= '</div>'."\n";
		$pCrudList .= '<script type="text/javascript">'."\n";
		$pCrudList .= '	pCrudList_'.$this->name.'.crudName = \''.$this->name.'\';'."\n";
		$pCrudList .= '</script>'."\n";
		
		if ($verbose) {
			echo $pCrudList;
		}		
		return $pCrudList;
	}

	/**
	 * Desenha os botões de controle do crud
	 * 
	 * @param $verbose boolean: se true, produzirá saída de texto na tela
	 * @returns string: html dos controles
	 */
	public function drawControls($verbose=true) {
		if ($this->getPermission('c')) {
			$permC = '';
		}
		else {
			$permC = ' disabled="disabled" style="display:none;"';
		}
		
		if ($this->getPermission('r')) {
			$permR = '';
		}
		else {
			$permR = ' disabled="disabled" style="display:none;"';
		}
		
		if ($this->getPermission('u')) {
			$permU = '';
		}
		else {
			$permU = ' disabled="disabled" style="display:none;"';
		}
		
		if ($this->getPermission('d')) {
			$permD = '';
		}
		else {
			$permD = ' disabled="disabled" style="display:none;"';
		}
	
		$controls = "\n";
		$controls .= $this->indentation.'				<span id="'.$this->name.'_controls">'."\n";
		$controls .= $this->indentation.'					<span id="'.$this->name.'_control_new" style="display:block;">'."\n";
		$controls .= $this->indentation.'						<button'.$permC.' onclick="'.$this->name.'.bt_write_new()">'._('Gravar').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permC.' onclick="'.$this->name.'.bt_copyFrom()">'._('Copiar de').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permC.' onclick="'.$this->name.'.bt_new()">'._('Limpar').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permR.' onclick="'.$this->name.'.bt_search()">'._('Listar').'</button> '."\n";
		$controls .= $this->indentation.'					</span>'."\n";
		
		$controls .= $this->indentation.'					<span id="'.$this->name.'_control_edit" style="display:none;">'."\n";
		$controls .= $this->indentation.'						<button'.$permU.' onclick="'.$this->name.'.bt_write_edit()">'._('Gravar Alterações').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permU.' onclick="'.$this->name.'.bt_cancel_edit()">'._('Cancelar').'</button> '."\n";
		$controls .= $this->indentation.'					</span>'."\n";
		
		$controls .= $this->indentation.'					<span id="'.$this->name.'_control_view" style="display:none;">'."\n";
		$controls .= $this->indentation.'						<button'.$permR.' onclick="'.$this->name.'.bt_search()">'._('Listar').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permU.' onclick="'.$this->name.'.bt_edit()">'._('Alterar').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permD.' onclick="'.$this->name.'.bt_delete()">'._('Excluir').'</button> '."\n";
		$controls .= $this->indentation.'						<button'.$permC.' onclick="'.$this->name.'.bt_new()">'._('Inserir Novo').'</button> '."\n";
		$controls .= $this->indentation.'					</span>'."\n";
		$controls .= $this->indentation.'				</span>'."\n";
		
		$controls .= "\n";
		
		//seta a propriedade maxlength dos campos quando necessário
		$controls .= $this->initMaxLength();
		
		if ($verbose) {
			echo $controls;
		}
		return $controls;
	}
	
	private function initClientObject() {
		global $pacrudConfig;
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_pacrud.php');
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_crud_list.php');
		
		echo $this->drawSearch();
		
		// trata o caminho do xmlFile (relativo e absoluto)
		if (substr($this->param['xmlfile'],0,1) == '/') {
			$ajaxFile = $this->param['xmlfile'];
		}
		else {
			$ajaxFile = $this->pacrudConfig['appWebPath'].'/'.$this->param['xmlfile'];
		}
		
		// instancia o objeto pacrudSearch no cliente
		$clientObject = $this->indentation. '<script type="text/javascript">'."\n";
		$clientObject .= $this->indentation. '	'.$this->name.' = new paCRUD(\''.$this->name.'\',\''.$ajaxFile.'\');'."\n";
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
		$fieldId = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldId != '')
				$fieldId .= ',';
			$fieldId .= '"'.$this->field[$i]['fieldid'].'"';
		}
		$fieldLabel = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldLabel != '')
				$fieldLabel .= ',';
			$fieldLabel .= '"'.$this->field[$i]['label'].'"';
		}
		$fieldType = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldType != '')
				$fieldType .= ',';
			$fieldType .= '"'.$this->field[$i]['type'].'"';
		}
		$fieldNotNull = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldNotNull != '') {
				$fieldNotNull .= ',';
			}

			if ($this->field[$i]['notnull']) {
				$fieldNotNull .= 'true';
			}
			else {
				$fieldNotNull .= 'false';
			}
		}
		$fieldReadonly = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldReadonly != '') {
				$fieldReadonly .= ',';
			}

			if ($this->field[$i]['readonly']) {
				$fieldReadonly .= 'true';
			}
			else {
				$fieldReadonly .= 'false';
			}
		}
		$fieldNoCreate = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldNoCreate != '') {
				$fieldNoCreate .= ',';
			}

			if ($this->field[$i]['nocreate']) {
				$fieldNoCreate .= 'true';
			}
			else {
				$fieldNoCreate .= 'false';
			}
		}
		
		$fieldVirtual = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldVirtual != '') {
				$fieldVirtual .= ',';
			}

			if ($this->field[$i]['virtual']) {
				$fieldVirtual .= 'true';
			}
			else {
				$fieldVirtual .= 'false';
			}
		}
		
		$fieldDefault = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($fieldDefault != '')
				$fieldDefault .= ',';
			if (isset($this->field[$i]['default'])) {
				$fieldDefault .= '"'.$this->field[$i]['default'].'"';
			}
			else {
				$fieldDefault .= '""';
			}
		}
		
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldName = Array('.$fieldName.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldPk = Array('.$fieldPk.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldId = Array('.$fieldId.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldLabel = Array('.$fieldLabel.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldType = Array('.$fieldType.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldNotNull = Array('.$fieldNotNull.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldReadonly = Array('.$fieldReadonly.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldNoCreate = Array('.$fieldNoCreate.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldVirtual = Array('.$fieldVirtual.');'."\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.fieldDefault = Array('.$fieldDefault.');'."\n";
			
		// repassa as permissões CRUD para o cliente
		echo "\n";
		if ($this->getPermission('c') == false) {
			$clientObject .= $this->indentation.'	'.$this->name.'.permC = false;'."\n";
		}
		if ($this->getPermission('r') == false) {
			$clientObject .= $this->indentation.'	'.$this->name.'.permR = false;'."\n";
		}
		if ($this->getPermission('u') == false) {
			$clientObject .= $this->indentation.'	'.$this->name.'.permU = false;'."\n";
		}
		if ($this->getPermission('d') == false) {
			$clientObject .= $this->indentation.'	'.$this->name.'.permD = false;'."\n";
		}
		"\n";
		
		// ligação do crud com o search
		$clientObject .= "\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.pSearch = pSearch_'.$this->name.";\n";

		// evento after Search
		$clientObject .= "\n";
		$clientObject .= $this->indentation.'	'.$this->name.'.pSearch.afterSearch = function() {'."\n";
		$clientObject .= $this->indentation.'		'.$this->name.'.doCopyFrom();'."\n";
		$clientObject .= $this->indentation.'	}'."\n";

		// ligações 1 to 1
		$clientObject .= "\n";
		if ($this->parent1x1 != null) {
			$clientObject .= $this->indentation.'	'.$this->name.'.addParent1x1('.$this->parent1x1->name.',\''.$this->parent1x1Condition['fieldName'].'\',\''.$this->parent1x1Condition['value'].'\');'."\n";
		}
		
		if ($this->parent1xN != '') {
			$clientObject .= "\n";
			$clientObject .= $this->indentation . '	'. $this->name.'.addParent1xN('.$this->parent1xN.');'."\n";
			$clientObject .= $this->indentation . '	'. $this->name.'.pSearch.autoClick = false;'."\n";
		}
		
		$clientObject .= $this->indentation. '</script>'."\n";
		
		return $clientObject;
	}
	
	/**
	 * Verifica quais campos possuem explicito o atributo size e seta a propriedade maxlength
	 */
	private function initMaxLength() {
		$out = '';
		for ($i = 0; $i < count($this->field); $i++) {
			if ($this->field[$i]['size'] != '') {
				$out .= $this->indentation.'	inputField = document.getElementById(\''.$this->field[$i]['fieldid'].'\');'."\n";
				$out .= $this->indentation.'	if (inputField.getAttribute(\'maxlength\') == undefined) {'."\n";
				$out .= $this->indentation.'		inputField.setAttribute(\'maxlength\','.$this->field[$i]['size'].');'."\n";
				$out .= $this->indentation.'	}'."\n";
			}
		}
		
		if ($out != '') {
			return $this->indentation.'<script type="text/javascript">'."\n".$out.$this->indentation.'</script>'."\n";
		}
		else {
			return '';
		}
	}
	
	/**
	 * configura a propriedade $this->permission buscando as informações no banco de dados
	 */
	private function setPermissions($routine) {
		$arrPermission = getPermission($routine);
		
		$permission = '';
		if ($arrPermission['c'] == true) {
			$permission .= 'c';
		}
		if ($arrPermission['r'] == true) {
			$permission .= 'r';
		}
		if ($arrPermission['u'] == true) {
			$permission .= 'u';
		}
		if ($arrPermission['d'] == true) {
			$permission .= 'd';
		}
		
		$this->permission = $permission;
	}
	
	/**
	 * Verifica as permissões do objeto para operações CRUD
	 * 
	 @params $perm string: "c", "r", "u" ou "d" acordo com a operação desejada
	 @returns boolean
	 */
	public function getPermission($perm) {
		for ($i=0; $i < strlen($this->permission); $i++) {
			if ($this->permission[$i] == $perm) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Propara a propriedade action para todos os relacionamentos 1x1 recussivamente
	 */
	private function cascadeAction() {
		for ($i=0; $i < count($this->son1x1); $i++) {
			$this->son1x1[$i]->action = $this->action;
			$this->son1x1[$i]->cascadeAction();
		}
	}
	
	public function autoInit() {
		if (isset($_GET['ddl']) or isset($_GET['htmlcode']) or isset($_GET['executeddl'])) {
			header('Content-type: text/html; charset=utf-8');
			pProtect('pacrud_devtools');
			
			if (isset($_GET['htmlcode'])) {
				$htmlCode = $this->drawForms(false,true);
				$htmlCode = str_replace('<','&lt;',$htmlCode);
				$htmlCode = str_replace('>','&gt;',$htmlCode);
				echo "<pre>\n";
				echo $htmlCode;
				echo "\n</pre>\n";
			}
		
			if (isset($_GET['ddl'])) {
				echo '<pre>'."\n";
				echo $this->ddl();
				echo "\n".'</pre>';
			}
			
			if (isset($_GET['executeddl'])) {
				echo $this->executeDdl();
			}
		}
		else {
			if (isset($_POST[$this->name.'_action']) and $_POST[$this->name.'_action'] != '') {
			
				$this->action = $_POST[$this->name.'_action'];
				$this->cascadeAction();
			
				switch ($this->action) {
					case 'c':
						if ($this->getPermission('c')) {
							$this->doCreate(true);
						}
						else {
							$this->doAccessDenied(true);
						}
						break;
					case 'r':
						if ($this->getPermission('r')) {
							$this->doRetrieve(true);
						}
						else {
							$this->doAccessDenied(true);
						}
						break;
					case 'u':
						if ($this->getPermission('u')) {
							$this->doUpdate(true);
						}
						else {
							$this->doAccessDenied(true);
						}
						break;
					case 'd':
						if ($this->getPermission('d')) {
							$this->doDelete(true);
						}
						else {
							$this->doAccessDenied(true);
						}
						break;
					default:
						echo 'Error';
						break;
				}
			}
			else {
				if (isset($_POST['pSearch_'.$this->name.'_action']) && $_POST['pSearch_'.$this->name.'_action'] != '') {
					$this->pSearch->autoInit();
				}
				else if (isset($_POST['pCrudList_'.$this->name.'_action']) && $_POST['pCrudList_'.$this->name.'_action'] != '') {
					if ($this->getPermission('r')) {
						$this->pCrudList->makeXml(true);
					}
					else {
						$this->doAccessDenied(true);
					}
				}
				else {
					echo $this->initClientObject();
					if (isset($this->param['drawform']) && $this->param['drawform']) {
						$this->drawForms();
					}
					$this->initClientObject1x1();
				}
			}
		}
	}
	
	/**
	 * Inicializa os objetos no lado do cliente com relacionamento 1x1 recursivamente
	 */
	public function initClientObject1x1() {
		for ($i=0; $i < count($this->son1x1); $i++) {
			echo $this->son1x1[$i]->initClientObject();
			$this->son1x1[$i]->initClientObject1x1();
		}
	}
	
	/**
	 * Monta o código para cada objeto de forma recursiva para relacionamentos 1x1
	 */
	public function ddl() {
		$tableName = $this->param['tablename'];
		$schema = pGetSchema($this->param['schema'],$this->pConnection->sgdb());
		
		$code  = 'CREATE TABLE '.$schema.$tableName."\n";
		$code .= '('."\n";
		
		for ($i=0; $i < count($this->field); $i++) {
			// pula os campos virtuais
			if (!isset($this->field[$i]['virtual']) or $this->field[$i]['virtual'] == false) {
			
				$name = $this->field[$i]['name'];
			
				$type = ' '.$this->pConnection->dbType($this->field[$i]['type']);;
			
				if ($this->field[$i]['notnull']) {
					$notNull = ' NOT NULL';
				}
				else {
					$notNull = '';
				}
			
				if (isset($this->field[$i]['default']) and $this->field[$i]['default'] != '') {
					$default = ' DEFAULT '.$this->field[$i]['default'];
				}
				else {
					$default = '';
				}
			
				if (isset($this->field[$i]['size']) and $this->field[$i]['size'] != '') {
					$size = '('.$this->field[$i]['size'].')';
				}
				else {
					$size = '';
				}
			
				$code .= '  '.$name.$type.$size.$notNull.$default.','."\n";
			}
		}
		
		// monta os campos da chave primária
		$pk = '';
		for ($i=0; $i < count($this->field); $i++) {
			if ($this->field[$i]['pk']) {
				if ($pk != '') {
					$pk .= ',';
				}
				$pk .= $this->field[$i]['name'];
			}
		}
		$code .= '  CONSTRAINT '.$tableName.'_pkey PRIMARY KEY ('.$pk.')';
		
		// monta chave estrangeira
		if ($this->parent1x1 != null) {
			$fk = '';
			for ($i=0; $i < count($this->parent1x1->field); $i++) {
				if ($this->parent1x1->field[$i]['pk']) {
					if ($fk != '') {
						$fk .= ',';
					}
					$fk .= $this->parent1x1->field[$i]['name'];
				}
			}
			$code .= ','."\n";
			$code .= '  CONSTRAINT '.$tableName.'_'.str_replace(',','_',$pk).'_fkey FOREIGN KEY ('.$pk.')'."\n";
			$code .= '      REFERENCES '.pGetSchema($this->parent1x1->param['schema'],$this->pConnection->sgdb()).$this->parent1x1->param['tablename'].' ('.$fk.') MATCH SIMPLE'."\n";
			$code .= '      ON UPDATE CASCADE ON DELETE CASCADE'."\n";
		}
		else {
			$code .= "\n";
		}
		
		$code .= ');'."\n";
			
		// Aplica codigo dos objetos filhos
		for ($i=0; $i < count($this->son1x1); $i++) {
			$code .= "\n";
			$code .= $this->son1x1[$i]->ddl();
		}
		
		return $code;
	}
	
	/**
	 * Cria a tabela no banco de dados, inclusive todas as relações 1x1
	 */
	public function executeDdl() {
		$sql = $this->ddl();
		$this->pConnection->sqlQuery($sql);
		
		return _('Código SQL executado');
	}
	
}
