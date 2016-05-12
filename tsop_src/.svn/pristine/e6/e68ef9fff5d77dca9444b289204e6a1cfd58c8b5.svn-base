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
	array("text"=>"One"),
	array("text"=>"Two", "expanded"=>true,"nodes"=>array(
			array("text"=>"2.1"),
			array("text"=>"2.2", "expanded"=>true, "nodes"=>array(
				array("text"=>"2.2.1"),
				array("text"=>"2.2.2"),
				array("text"=>"2.2.3")
			)),
			array("text"=>"2.3")
		)
	),
	array("text"=>"Three")
)
);
$treeview->setOption(array("height"=>300));
$treeview->renderTreeView('#tree');
?>
