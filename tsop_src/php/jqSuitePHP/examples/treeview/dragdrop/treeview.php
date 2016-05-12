<?php
ini_set("display_errors",1);

require_once '../../../jq-config.php';
// include the driver class
require_once ABSPATH."php/jqUtils.php";
// include the jqGrid Class
require_once ABSPATH."php/jqTreeView.php";


$treeview = new jqTreeView();
$treeview->setOption(array(
	"dragAndDrop"=>true,
	"dragAndDropUrl"=>'draganddrop.php',
	"multipleSelect"=>true,
	"height"=>300,
	"width"=>200
));
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

// set drag and drop rules
$nodesDragged = <<< DRAG
    function (args, event) {
        // NodesDragged client-side event has the following arguments
        // args.draggedNodes -> array, list of nodes being currently dragged
        // args.sourceTreeView -> an instance to the client-side object of the parent treeview
        // event -> the browser event object
        
		try {
			var srcTreeView = args.sourceTreeView; // the instance to the treeview parent                
        
			var draggedNodesText = "";
			for (var i=0; i<args.draggedNodes.length; i++) {
				var draggedNodeOptions = srcTreeView.getNodeOptions(args.draggedNodes[i]); // get node options like Text, Value, etc    
				draggedNodesText = draggedNodesText + draggedNodeOptions.text + ",";
			}           
        
        
			var message = "<b>" + draggedNodesText + "</b>" + 
                      " dragged from " + srcTreeView.options.id;                      
        
			var dragDropLog = $("#dragDropLog");
			dragDropLog.prepend(message);
		}catch (e) {}
    }
DRAG;
		
$nodesDropped = <<< DROP
    function (args, event) {
        // NodesDropped client-side event has the following arguments
        // args.draggedNodes -> array, list of nodes being currently dragged
        // args.sourceTreeView -> an instance to the client-side object of the parent treeview
        // args.destinationNode -> the reference to the destination node
        // args.destinationTreeView -> the reference to the destination treeview
        try {
			var srcTreeView = args.sourceTreeView; // the instance to the treeview parent        
			var destTreeView = args.destinationTreeView; // get the destination treeview
			var destNode = args.destinationNode; // destination node can only be one, no need for array 
        
			var draggedNodesText = "";
			for (var i=0; i<args.draggedNodes.length; i++) {
				var draggedNodeOptions = srcTreeView.getNodeOptions(args.draggedNodes[i]); // get node options like Text, Value, etc    
				draggedNodesText = draggedNodesText + draggedNodeOptions.text + ",";
			}   
        
			var destNodeOptions = destTreeView.getNodeOptions(destNode); // get the options of the destination node

			var message = "<b>" + draggedNodesText + "</b>" + 
                      " from " + srcTreeView.options.id + " dropped on " +
                      "<b>" + destNodeOptions.text + "</b>" +
                      " from " + destTreeView.options.id + "<br/>";
        
			var dragDropLog = $("#dragDropLog");
			dragDropLog.prepend(message);
		} catch (e) {}
    }
DROP;


$treeview->setEvent("onNodesDragged", $nodesDragged);
$treeview->setEvent("onNodesDropped", $nodesDropped);
$treeview->renderTreeView('#tree');

// TREE1 Rures
$treeview1 = new jqTreeView();
$treeview1->setOption(array(
	"dragAndDrop"=>true,
	"dragAndDropUrl"=>'draganddrop.php',
	"multipleSelect"=>true,
	"height"=>300,
	"width"=>200
));
$treeview1->addNodes(
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

$treeview1->setEvent("onNodesDragged", $nodesDragged);
$treeview1->setEvent("onNodesDropped", $nodesDropped);
$treeview1->renderTreeView('#tree1');
?>
