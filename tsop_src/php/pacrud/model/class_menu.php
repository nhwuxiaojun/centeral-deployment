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

class pacrudMenu {
	public $objName;
	public $pacrudConfig;
	public $indentation;
	
	public $xml;
	
	function __construct($objName,$params) {
		global $pacrudConfig;
		$this->objName = $objName;
		
		$this->param = pParameters($params);
		$this->pacrudConfig = $pacrudConfig;
		
		if (file_exists($pacrudConfig['appPath'].'/menu.xml')) {
			$this->xml = simplexml_load_file($pacrudConfig['appPath'].'/menu.xml');
		}
		else {
			$this->xml = simplexml_load_string($this->dbXml());
		}
		$this->indentation = '';
	}
	
	private function extractIcon($node) {
		if (isset($node->icon)) {		
			$icon = '<img src="'.$node->icon.'" alt="icon" /> ';
		}
		else {
			$icon = '';	
		}
		return $icon;
	}
	
	private function extractLink($node) {
		if (isset($node->link)) {		
			$link = $node->link;
		}
		else {
			$link = '';	
		}
		return $link;
	}
	
	private function drawMenu($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menu  = $this->indentation.'<div class="pacrudMenu" onclick="'.$this->objName.'.onClick(\''.$arrParam['id'].
		                                          '\',\''.$link.'\',event)">'.$icon.$arrParam['label'].'</div>'."\n";
		$menu .= $this->indentation.'<div id="'.$this->objName.'_'.$arrParam['id'].'">'."\n";
		return $menu;
	}
	
	private function drawMenuL1($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menuL1  = $this->indentation.'	<div class="pacrudMenuL1" onclick="'.$this->objName.'.onClick(\''.
		              $arrParam['id'].'\',\''.$link.'\',event)">'.$icon.$arrParam['label'].'</div>'."\n";
		$menuL1 .= $this->indentation.'	<div id="'.$this->objName.'_'.$arrParam['id'].'">'."\n";
		return $menuL1;
	}
	
	private function drawMenuL2($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menuL2  = $this->indentation.'		<div class="pacrudMenuL2" onclick="'.$this->objName.'.onClick(\''.
		                                   $arrParam['id'].'\',\''.$link.'\',event)">'.$icon.$arrParam['label'].'</div>'."\n";
		$menuL2 .= $this->indentation.'		<div id="'.$this->objName.'_'.$arrParam['id'].'">'."\n";
		return $menuL2;
	}
	
	private function drawMenuL3($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menuL3  = $this->indentation.'			<div class="pacrudMenuL3" onclick="'.$this->objName.'.onClick(\''.
		            $arrParam['id'].'\',\''.$link.'\',event)">'.$icon.$arrParam['label'].
		                                                                                            '</div>'."\n";
		$menuL3 .= $this->indentation.'			<div id="'.$this->objName.'_'.$arrParam['id'].'">'."\n";
		return $menuL3;
	}
	
	private function drawMenuL4($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menuL4  = $this->indentation.'				<div class="pacrudMenuL4" onclick="'.$this->objName.'.onClick(\''.
		                       $arrParam['id'].'\',\''.$link.'\',event)">'.
		                                                                             $icon.$arrParam['label'].'</div>'."\n";
		$menuL4 .= $this->indentation.'				<div id="'.$this->objName.'_'.$arrParam['id'].'">'."\n";
		return $menuL4;
	}
	
	private function drawMenuL5($arrParam,$node) {
		$icon = $this->extractIcon($node);
		$link = $this->extractLink($node);
		
		$menuL5  = $this->indentation.'					<div class="pacrudMenuL5" onclick="'.$this->objName.
		                                            '.onClick(\''.$arrParam['id'].'\',\''.$link.
		                                           '\',event)">'.
		                                                                   $icon.$arrParam['label'].'</div>'."\n";
		return $menuL5;
	}
	
	public function draw($verbose) {
		require_once($this->pacrudConfig['pacrudPath'].'/controller/inc_js_menu.php');
		$opened = array();
		
		$htmlMenu  = "\n";
		
		$htmlMenu .= $this->indentation.'<script type="text/javascript">'."\n";
		$htmlMenu .= $this->indentation.'	'.$this->objName.' = new pacrudMenu(\''.$this->objName.'\');'."\n";
		$htmlMenu .= $this->indentation.'</script>'."\n";
		
		$xml = $this->xml;
		
		$iMenu = 0;
		//menu
		foreach($xml as $value0){
			$htmlMenu .= $this->indentation.'<div class="pacrudMenuBox">'."\n";
			
			$menu = array();
			foreach($value0->attributes() as $menuAtt => $menuAttValue) {
				$menu[$menuAtt] = $menuAttValue;
			}
			if (count($value0->attributes()) > 0) {
				$htmlMenu .= $this->drawMenu($menu,$xml->menu[$iMenu]);
				if (!isset($menu['opened'])) {
					$menu['opened'] = '';
				}
				$opened[] = array($menu['id'],$menu['opened']);
			}
			$iMenu++;
			
			//level1
			$iLevel1 = 0;
			foreach($value0 as $level1Key => $level1Value) {
				$level1 = array();
				foreach($level1Value->attributes() as $level1Att => $level1AttValue) {
					$level1[$level1Att] = $level1AttValue;
				}
				
				if (count($level1Value->attributes()) > 0) {
					$htmlMenu .= $this->drawMenuL1($level1,$value0->level1[$iLevel1]);
					if (!isset($level1['opened'])) {
						$level1['opened'] = '';
					}
					$opened[] = array($level1['id'],$level1['opened']);
				}
				$iLevel1++;
				
				//level2
				$iLevel2 = 0;
				foreach($level1Value as $level2Key => $level2Value) {
					$level2 = array();
					foreach($level2Value->attributes() as $level2Att => $level2AttValue) {
						$level2[$level2Att] = $level2AttValue;
					}
					
					if (count($level2Value->attributes()) > 0) {
						$htmlMenu .= $this->drawMenuL2($level2,$level1Value->level2[$iLevel2]);
						if (!isset($level2['opened'])) {
							$level2['opened'] = '';
						}
						$opened[] = array($level2['id'],$level2['opened']);
					}
					$iLevel2++;
					
					//level3
					$iLevel3 = 0;
					foreach($level2Value as $level3Key => $level3Value) {
						$level3 = array();
						foreach($level3Value->attributes() as $level3Att => $level3AttValue) {
							$level3[$level3Att] = $level3AttValue;
						}
						
						if (count($level3Value->attributes()) > 0) {
							$htmlMenu .= $this->drawMenuL3($level3,$level2Value->level3[$iLevel3]);
							if (!isset($level3['opened'])) {
								$level3['opened'] = '';
							}
							$opened[] = array($level3['id'],$level3['opened']);
						}
						$iLevel3++;
						
						//level4
						$iLevel4 = 0;
						foreach($level3Value as $level4Key => $level4Value) {
							$level4 = array();
							foreach($level4Value->attributes() as $level4Att => $level4AttValue) {
								$level4[$level4Att] = $level4AttValue;
							}
							
							if (count($level4Value->attributes()) > 0) {
								$htmlMenu .= $this->drawMenuL4($level4,$level3Value->level4[$iLevel4]);
								if (!isset($level4['opened'])) {
									$level4['opened'] = '';
								}
								$opened[] = array($level4['id'],$level4['opened']);
							}
							$iLevel4++;
							
							//level5
							$iLevel5 = 0;
							foreach($level4Value as $level5Key => $level5Value) {
								$level5 = array();
								foreach($level5Value->attributes() as $level5Att => $level5AttValue) {
									$level5[$level5Att] = $level5AttValue;
								}
								
								if (count($level5Value->attributes()) > 0) {
									$htmlMenu .= $this->drawMenuL5($level5,$level4Value->level5[$iLevel5]);
								}
								$iLevel5++;
							}
							if (count($level4Value->attributes()) > 0) {
								$htmlMenu .= $this->indentation.'				</div>'."\n"; //menuL4
							}
						}
						if (count($level3Value->attributes()) > 0) {
							$htmlMenu .= $this->indentation.'			</div>'."\n"; //menuL3
						}
					}
					if (count($level2Value->attributes()) > 0) {
						$htmlMenu .= $this->indentation.'		</div>'."\n";  //menuL2
					}
				}
				if (count($level1Value->attributes()) > 0) {
					$htmlMenu .= $this->indentation.'	</div>'."\n"; //menuL1
				}
			}
			$htmlMenu .= $this->indentation.'</div>'."\n"; //menu
			$htmlMenu .= $this->indentation.'</div>'."\n";
			$htmlMenu .= $this->indentation.'<br />'."\n";
		}
		
		$htmlMenu .= $this->indentation.'<script type="text/javascript">'."\n";
		for ($i = 0; $i < count($opened); $i++) {
			if ($opened[$i][1] == false or $opened[$i][1] == 'f') {
				$htmlMenu .= $this->indentation.'	'.$this->objName.'.close(\''.$opened[$i][0].'\');'."\n";
			}
		}
		$htmlMenu .= $this->indentation.'</script>'."\n";
		
		if ($verbose) {
			echo $htmlMenu;
		}
		return $htmlMenu;
	}
	
	public function makeXml($verbose) {
		return '';
	}
	
	function openNodeXml($indentation,$start,$node) {
		global $pacrudConfig;
		
		$id = str_replace(' ','_',$node['caption']);
		$id = strtolower($id);
		$xmlReturn = $indentation.$start.' id="'.$id.'" label="'._($node['caption']).'" opened="'.$node['opened'].'">'."\n";
		if ($node['routine'] != '' and $node['childs'] == 0) {
			if (isset($node['link'])) {
				$explode = explode(':',$node['link']);
				$protocol = $explode[0];
				if ($protocol == 'http') {
					$xmlReturn .= $indentation.'	<link>'.$node['link'].'</link>'."\n";
				}
				else {
					$xmlReturn .= $indentation.'	<link>index.php?page='.$node['routine'].'</link>'."\n";
				}
			}
			else {
				$xmlReturn .= $indentation.'	<link>index.php?page='.$node['routine'].'</link>'."\n";
			}
		}
		return $xmlReturn;
	}
	
	public function dbXml() {
		global $pacrudConfig;
		global $pConnectionPacrud;
		global $pacrudGlobal;
		
		$xml = '';
		
		$schema = pGetSchema($pacrudConfig['loginSchema_pacrud'],$pacrudConfig['sgdb_pacrud']);
		
		$sql  = 'SELECT '."\n";
		$sql .= '	m.cod,'."\n";
		$sql .= '	m.parent,'."\n";
		$sql .= '	m.caption,'."\n";
		$sql .= '	m.routine,'."\n";
		$sql .= '	m.icon,'."\n";
		$sql .= '	m.opened,'."\n";
		$sql .= '	r.link,'."\n";
		$sql .= '	(SELECT count(*) FROM '.$schema.'menu WHERE parent=m.cod) as childs'."\n";
		$sql .= 'FROM '.$schema.'menu m'."\n";
		$sql .= 'JOIN '.$schema.'routines r ON r.routine=m.routine'."\n";
		$sql .= 'JOIN '.$schema.'routines_groups rg ON rg.routine=m.routine'."\n";
		$sql .= 'JOIN '.$schema.'groups g ON g.groupname=rg.groupname'."\n";
		$sql .= 'JOIN '.$schema.'groups_syslogin gs ON gs.groupname=g.groupname'."\n";
		$sql .= 'JOIN '.$schema.'syslogin s ON s.username=gs.username'."\n";
		$sql .= 'WHERE m.enabled=\'t\''."\n";
		$sql .= 'AND r.enabled=\'t\''."\n";
		$sql .= 'AND g.enabled=\'t\''."\n";
		$sql .= 'AND s.enabled=\'t\''."\n"; 
		$sql .= 'AND (rg.c=\'t\' OR rg.r=\'t\' OR rg.u=\'t\' OR rg.d=\'t\')'."\n";
		$sql .= 'AND s.username=\''.$pacrudGlobal['currentUser'].'\''."\n";
		$sql .= 'GROUP BY m.cod,m.parent,m.caption,m.routine,m.icon,m.opened,r.link'."\n";
		$sql .= 'ORDER BY m.caption'."\n";
		$sql .= ';'."\n";
		
		$sqlResult = $pConnectionPacrud->sql2Array($sql);
				
		$xml .= '<pacrudMenu>'."\n";
		
		for ($l1=0; $l1 < count($sqlResult); $l1++) {
			if ($sqlResult[$l1]['parent'] == '') {
				$l1Cod = $sqlResult[$l1]['cod'];
				$xml .= $this->openNodeXml('	','<menu',$sqlResult[$l1]);
				
				for ($l2=0; $l2 < count($sqlResult); $l2++) {
					if ($sqlResult[$l2]['parent'] != '' and $sqlResult[$l2]['parent'] == $l1Cod) {
						$l2Cod = $sqlResult[$l2]['cod'];
						$xml .= $this->openNodeXml('		','<level1',$sqlResult[$l2]);
						
						for ($l3=0; $l3 < count($sqlResult); $l3++) {
							if ($sqlResult[$l3]['parent'] != '' and $sqlResult[$l3]['parent'] == $l2Cod) {
								$l3Cod = $sqlResult[$l3]['cod'];
								$xml .= $this->openNodeXml('			','<level2',$sqlResult[$l3]);
								
								for ($l4=0; $l4 < count($sqlResult); $l4++) {
									if ($sqlResult[$l4]['parent'] != '' and $sqlResult[$l4]['parent'] == $l3Cod) {
										$l4Cod = $sqlResult[$l4]['cod'];
										$xml .= $this->openNodeXml('				','<level3',$sqlResult[$l4]);
										
										for ($l5=0; $l5 < count($sqlResult); $l5++) {
											if ($sqlResult[$l5]['parent'] != '' and $sqlResult[$l5]['parent'] == $l4Cod) {
												$l5Cod = $sqlResult[$l5]['cod'];
												
												$xml .= $this->openNodeXml('					','<level4',$sqlResult[$l5]);
												if ($sqlResult[$l5]['icon'] != '') {
													$xml .= '		<icon>'.$pacrudConfig['pacrudWebPath'].'/'.$sqlResult[$l5]['icon'].'</icon>'."\n";
												}
												$xml .= '					</level4>'."\n";
											}
										}
										if ($sqlResult[$l4]['icon'] != '') {
											$xml .= '		<icon>'.$pacrudConfig['pacrudWebPath'].'/'.$sqlResult[$l4]['icon'].'</icon>'."\n";
										}
										$xml .= '				</level3>'."\n";
									}
								}
								if ($sqlResult[$l3]['icon'] != '') {
									$xml .= '		<icon>'.$pacrudConfig['pacrudWebPath'].'/'.$sqlResult[$l3]['icon'].'</icon>'."\n";
								}
								$xml .= '			</level2>'."\n";
							}
						}
						if ($sqlResult[$l2]['icon'] != '') {
							$xml .= '		<icon>'.$pacrudConfig['pacrudWebPath'].'/'.$sqlResult[$l2]['icon'].'</icon>'."\n";
						}
						$xml .= '		</level1>'."\n";
					}
				}
				
				if ($sqlResult[$l1]['icon'] != '') {
					$xml .= '		<icon>'.$pacrudConfig['pacrudWebPath'].'/'.$sqlResult[$l1]['icon'].'</icon>'."\n";
				}
				$xml .= '	</menu>'."\n";
			}
		}
		
		$xml .= '</pacrudMenu>'."\n";
		return $xml;
	}
}
