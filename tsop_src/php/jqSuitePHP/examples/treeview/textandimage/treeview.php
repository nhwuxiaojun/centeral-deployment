<?php
ini_set("display_errors",1);

require_once '../../../jq-config.php';
// include the driver class
require_once ABSPATH."php/jqUtils.php";
// include the jqGrid Class
require_once ABSPATH."php/jqTreeView.php";


$treeview = new jqTreeView();
$treeview->addNodes(
array(
	array("imageUrl"=>"../images/document.png", "text"=>"One"),
	array("imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png", "text"=>"Two", "expanded"=>true,"nodes"=>array(
			array("imageUrl"=>"../images/document.png","text"=>"2.1"),
			array("imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png","text"=>"2.2", "expanded"=>true, "nodes"=>array(
				array("imageUrl"=>"../images/document.png","text"=>"2.2.1"),
				array("imageUrl"=>"../images/document.png","text"=>"2.2.2"),
				array("imageUrl"=>"../images/document.png","text"=>"2.2.3")
			)),
			array("imageUrl"=>"../images/document.png","text"=>"2.3")
		)
	),
	array("imageUrl"=>"../images/document.png","text"=>"Three")
)
);
$treeview->setOption(array("height"=>300));
$treeview->renderTreeView('#tree');
?>
