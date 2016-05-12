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
	array("text"=>"One", "imageUrl"=>"../images/document.png"),
	array("text"=>"Two",  "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png",  "expanded"=>true,"nodes"=>array(
			array("text"=>"2.1","imageUrl"=>"../images/document.png"),
			array("text"=>"2.2", "imageUrl"=>"../images/folder.png", "expandedImageUrl"=>"../images/folder-open.png", "expanded"=>true, "nodes"=>array(
				array("text"=>"2.2.1", "imageUrl"=>"../images/document.png"),
				array("text"=>"2.2.2", "imageUrl"=>"../images/document.png"),
				array("text"=>"2.2.3", "imageUrl"=>"../images/document.png"),
				array("text"=>"2.2.4", "imageUrl"=>"../images/document.png")
			)),
			array("text"=>"2.3", "imageUrl"=>"../images/document.png")
		)
	),
	array("text"=>"Three", "imageUrl"=>"../images/document.png")
)
);
$getnodes = <<<GETNODES
$("#getexpanded").click(function(){
// get the tree instance
var tree = $("#tree").getTreeViewInstance();
// get selected nodes
var nodes = tree.getExpandedNodes();
var text = "Expanded Nodes:";
for (var i=0; i < nodes.length; i++) {
	// convert to more readable format
	var nodeOptions = tree.getNodeOptions( nodes[i] );
	text += " "+ nodeOptions.text + "; ";
}
$("#result").html( text );
});
GETNODES;
$treeview->setJSCode( $getnodes);
$treeview->setOption(array("height"=>300));
$treeview->renderTreeView('#tree');
?>
