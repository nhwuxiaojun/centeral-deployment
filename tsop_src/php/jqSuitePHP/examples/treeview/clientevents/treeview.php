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
	array("text"=>"Two",  "expanded"=>true,"nodes"=>array(
			array("text"=>"2.1"),
			array("text"=>"2.2", "expanded"=>true, "nodes"=>array(
				array("text"=>"2.2.1"),
				array("text"=>"2.2.2"),
				array("text"=>"2.2.3"),
				array("text"=>"2.2.4")
			)),
			array("text"=>"2.3")
		)
	),
	array("text"=>"Three")
)
);

// Enable checkbox
$treeview->setOption( array(
	"checkBoxes"=>true,
	"width"=>350,
	"height"=>300
));
// mouse over event
$onMouseOver = <<<MOVER
    function (node, event) {
        var tree = $("#tree").getTreeViewInstance();
        var nodeOptions = tree.getNodeOptions(node);           
        
        writeLine(nodeOptions.text, " : <b>MouseOver</b> fired");
    }
MOVER;
$treeview->setEvent('onMouseOver', $onMouseOver);

// mouse over event
$onMouseOut = <<<MOVER
    function (node, event) {
        var tree = $("#tree").getTreeViewInstance();
        var nodeOptions = tree.getNodeOptions(node);           
        
        writeLine(nodeOptions.text, " : <b>MouseOut</b> fired");
    }
MOVER;
$treeview->setEvent('onMouseOut', $onMouseOut);

$clientapi = <<<HELPER
    function writeLine(nodeText, message) {
        var currentText = $("#eventLog").html();
        $("#eventLog").html(message + " for node <b>" + nodeText + "</b><br>" + currentText);
    }
HELPER;
$treeview->setJSCode( $clientapi);
$treeview->setOption(array("height"=>300));
$treeview->renderTreeView('#tree');
?>
