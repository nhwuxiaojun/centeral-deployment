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
	"checkBoxes"=>true
));

$clientapi = <<<GETNODES
    function selectNodes() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.select(node);
        
        var node = tree.getNodeByValue("London");        
        if (node)
            tree.select(node);
        
        var node = tree.getNodeByText("2.2.3");
        if (node)
            tree.select(node);
    }
    $("#selnode").click	( function(){ selectNodes();} );
		
    function unSelectNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("2.2.3");
        if (node)
            tree.unSelect(node);
    }
    $("#unselnode").click	( function(){ unSelectNode();} );
		
    function unSelectAllNodes() {
        var tree = $("#tree").getTreeViewInstance();
        tree.unSelectAll();
    }
    $("#unselall").click	( function(){ unSelectAllNodes();} );
		
    function expandNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.expand(node);
    }
    $("#enode").click	( function(){ expandNode();} );
		
    function collapseNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.collapse(node);
    }
    $("#cnode").click	( function(){ collapseNode();} );
		
    function toggleNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.toggle(node);
    }
    $("#tnode").click	( function(){ toggleNode();} );
		 
    function expandAllNodes() {
        var tree = $("#tree").getTreeViewInstance();
        tree.expandAll();
    }
    $("#eall").click	( function(){ expandAllNodes();} );
		
    function collapseAllNodes() {
        var tree = $("#tree").getTreeViewInstance();
        tree.collapseAll();
    }
    $("#call").click	( function(){ collapseAllNodes();} );
		
    function checkNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.check(node);
    }
    $("#checktwo").click	( function(){ checkNode();} );
		
    function unCheckNode() {
        var tree = $("#tree").getTreeViewInstance();
        var node = tree.getNodeByText("Two");
        if (node)
            tree.unCheck(node);
    }
    $("#unchecktwo").click	( function(){ unCheckNode();} );
		
    function checkAllNodes() {
        var tree = $("#tree").getTreeViewInstance();
        var allNodes = tree.getAllNodes();
        $.each(allNodes, function(index, node) {
            tree.check(node);
        });
    }
    $("#checkall").click	( function(){ checkAllNodes();} );
		
    function unCheckAllNodes() {
        var tree = $("#tree").getTreeViewInstance();
        var allNodes = tree.getAllNodes();
        $.each(allNodes, function(index, node) {
            tree.unCheck(node);
        });
    }
	$("#uncheckall").click	( function(){ unCheckAllNodes();} );
GETNODES;
$treeview->setJSCode( $clientapi);
$treeview->setOption(array("height"=>300));
$treeview->renderTreeView('#tree');
?>
