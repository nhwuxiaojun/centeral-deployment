<?php
ini_set("display_errors",1);

require_once '../../../jq-config.php';
// include the driver class
require_once ABSPATH."php/jqUtils.php";
// include the jqGrid Class
require_once ABSPATH."php/jqTreeView.php";

$ClientTree = jqGridUtils::GetParam("clientID", "notloaded");
if($ClientTree == "notloaded") {
	
	$treeview = new jqTreeView();
	$treeview->addNodes(
	array(
		array("text"=>"One", "value"=>"One", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Two", "value"=>"Two", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Three", "value"=>"Three", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Four", "value"=>"Four", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Five", "value"=>"Five", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Six", "value"=>"Six", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Seven", "value"=>"Seven", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
		array("text"=>"Eight", "value"=>"Eight", "loadOnDemand"=>true, "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png" ),
	));
	
	$treeview->setUrl('treeview.php');
	$treeview->setOption(array("height"=>300));
	$treeview->renderTreeView('#tree');
	
} else if($ClientTree) {
	
	$ClientNode = jqGridUtils::GetParam("parentNodeValue");
	$leafnodes = array();
	for ( $i=1; $i<=8; $i++) {
		$leafnodes[] = array("text"=>$ClientNode." - Leaf ".$i,"imageUrl"=>"../images/document.png");
	}
	echo json_encode($leafnodes);
}
?>
