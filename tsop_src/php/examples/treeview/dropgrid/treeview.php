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
    array("text"=>"North America","imageUrl"=>"../images/folder.png","expandedImageUrl"=>"../images/folder-open.png","expanded"=>true,
		"nodes"=>array(
			array("imageUrl"=>"../images/document.png","text"=>"USA"),
			array("imageUrl"=>"../images/document.png","text"=>"Mexico"),
			array("imageUrl"=>"../images/document.png","text"=>"Canada")
			)
		),
	array("text"=>"South America" ,"imageUrl"=>"../images/folder.png","expandedImageUrl"=>"../images/folder-open.png","expanded"=>true,
		"nodes"=>array(
			array("imageUrl"=>"../images/document.png","text"=>"Brazil"),
			array("imageUrl"=>"../images/document.png","text"=>"Argentina"),
			array("imageUrl"=>"../images/document.png","text"=>"Chile"),
			array("imageUrl"=>"../images/document.png","text"=>"Costa Rica"),
			array("imageUrl"=>"../images/document.png","text"=>"Columbia")
		)
	),
	array("text"=>"Europe","imageUrl"=>"../images/folder.png","expandedImageUrl"=>"../images/folder-open.png","expanded"=>true,
		"nodes"=>array(array("imageUrl"=>"../images/document.png","text"=>"England"),
			array("imageUrl"=>"../images/document.png","text"=>"Germany"),
			array("imageUrl"=>"../images/document.png","text"=>"Norway"),
			array("imageUrl"=>"../images/document.png","text"=>"Sweden"),
			array("imageUrl"=>"../images/document.png","text"=>"Italy"),
			array("imageUrl"=>"../images/document.png","text"=>"France")
		)
	)
)
);
$gropgrid = <<<DROPGRID
    function nodesDropped(args, e) {
        // NodesDropped client-side event has the following arguments
        // args.draggedNodes -> array, list of nodes being currently dragged
        // args.sourceTreeView -> an instance to the client-side object of the parent treeview
        // args.destinationNode -> the reference to the destination node
        // args.destinationTreeView -> the reference to the destination treeview
        
        var treeView = args.sourceTreeView; // the instance to the treeview parent        
        var nodesDragged = args.draggedNodes;
        var droppedOnElement = $(e.target);
        
        // check if the nodes are dropped on a grid instance
        if (droppedOnElement.parents().is(".ui-jqgrid")) {
            
            for (var i=0; i<nodesDragged.length; i++) {
                var node = nodesDragged[i];
                var options = treeView.getNodeOptions(node);
				//  add the node to the grid
				var gid = $.jgrid.randId();
				$("#grid").jqGrid('addRowData',gid,{id:gid, Name: "Name "+gid, Country: options.text},'first');
            }        
            
        }
    }
DROPGRID;
$treeview->setEvent("onNodesDropped", $gropgrid);
$treeview->setOption(array(
	"height"=>300,
	"dragAndDrop"=>true,
	"width"=>200
));
$treeview->renderTreeView('#tree');
?>
