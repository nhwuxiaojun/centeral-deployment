<?php
require_once '../../../jq-config.php';
// include the jqGrid Class
require_once ABSPATH."php/jqGrid.php";

// Create the jqGrid instance
$grid = new jqGridRender();
// Lets create the model manually
$Model = array(
    array("name"=>"id","width"=>80),
    array("name"=>"Name","width"=>80),
    array("name"=>"Country","width"=>80)
);
// Let the grid create the model
$grid->setColModel($Model);
// Set grid option datatype to be local
$grid->setGridOptions(array("datatype"=>"local"));
//We can add data manually using arrays
$data = array(
    array("id"=>1,"Name"=>"Sanem","Country"=>"Turkey","Email"=>"sanem@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>2,"Name"=>"Sasha","Country"=>"Russia","Email"=>"sasha@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>3,"Name"=>"Georgious","Country"=>"Greece","Email"=>"georgiou.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>4,"Name"=>"Xao","Country"=>"Vietnam","Email"=>"xao@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>5,"Name"=>"Li","Country"=>"China","Email"=>"li@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>6,"Name"=>"George","Country"=>"Nigeria","Email"=>"george@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>7,"Name"=>"Brian","Country"=>"Australia","Email"=>"brian@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
    array("id"=>8,"Name"=>"Ivan","Country"=>"Bulgaria","Email"=>"ivan@yahoo.com","Link"=>"http://www.yahoo.com","Checkbox"=>"Yes"),
);
// Let put it using the callGridMethod
// Integer in the array acts as id column
//$grid->callGridMethod("#grid", 'addRowData', array("Integer",$data));
$grid->setGridOptions(array("datatype"=>"local", "data"=>$data,"height"=>"auto", "width"=>400));

$grid->renderGrid('#grid','#pager',true, null, null, true,true);
?>
