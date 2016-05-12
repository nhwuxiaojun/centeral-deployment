<?php
require_once '../../../jq-config.php';
// include the jqGrid Class
require_once ABSPATH."php/jqGrid.php";
// include the driver class
require_once ABSPATH."php/jqGridPdo.php";
// Connection to the server
$conn = new PDO(DB_DSN,DB_USER,DB_PASSWORD);
// Tell the db that we use utf-8
$conn->query("SET NAMES 'utf8'");

// Create the jqGrid instance
$grid = new jqGridRender($conn);
// Write the SQL Query
$grid->SelectCommand = 'SELECT OrderID, CustomerID, Freight, OrderDate, ShipCity, ShipAddress FROM orders';
// set the ouput format to json
$grid->table = 'orders';
$grid->dataType = 'json';
// Let the grid create the model
$grid->setColModel();
// Set the url from where we obtain the data
$grid->setUrl('grid.php');
// Set some grid options
$grid->setGridOptions(array("rowNum"=>10,"rowList"=>array(10,20,30), "sortname"=>"OrderID","height"=>150));
// Change some property of the field(s)
$grid->setColProperty("OrderDate", array(
    "formatter"=>"date",
    "formatoptions"=>array("srcformat"=>"Y-m-d H:i:s","newformat"=>"m/d/Y"),
    "search"=>false,
    "editable"=>false
    )
);
$grid->setColProperty("OrderID",array("editable"=>false));
$grid->setSelect('CustomerID', "SELECT CustomerID, CompanyName FROM customers");
// Enable toolbar searching

$custelm =<<<CUSTELM
function( value, options) {
	var elm = $('<textarea></textarea>');
	elm.val( value );
	// give the editor time to initialize
	setTimeout( function() {
		tinymce.init({selector: "textarea#ShipAddress"});
	}, 100);
	return elm;
}
CUSTELM;

$custval =<<<CUSTVAL
function( element, oper, gridval) {
	if(oper === 'get') {
		return tinymce.get('ShipAddress').getContent({format: 'row'});
	} else if( oper === 'set') {
		if(tinymce.get('ShipAddress')) {
			tinymce.get('ShipAddress').setContent(gridval);
		}
	}
}
CUSTVAL;

$grid->setColProperty("ShipAddress", array(
	"edittype"=>"custom",
	"editoptions"=>array(
		"custom_element"=>"js:".$custelm,
		"custom_value"=>"js:".$custval
	)
));

$grid->navigator = true;
$grid->setNavOptions('navigator', array("del"=>false,"excel"=>false,"search"=>false,"refresh"=>false));
$grid->setNavOptions('edit', array("modal"=>false,"recreateForm"=>true, "height"=>'auto',"dataheight"=>"auto", "width"=>500));
$grid->setNavOptions('add', array("modal"=>false,"recreateForm"=>true,"height"=>'auto',"dataheight"=>"auto", "width"=>500));
// Enjoy
$grid->renderGrid('#grid','#pager',true, null, null, true,true);
$conn = null;
?>
