<?php
require_once("../conf.php");      
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Subgrid</title>
</head>
<body> 

<?php
//$dg = new C_DataGrid("SELECT * FROM orderdetails", "orderNumber", "orderdetails"); 
//
//$sdg = new C_DataGrid("SELECT * FROM products", "productCode", "products");
//
//$dg->set_subgrid($sdg, 'productCode');
//
//$dg->display();


$dg = new C_DataGrid("SELECT * FROM test1", "id", "test1"); 
$dg->enable_edit('INLINE', 'CRUD');

$sdg = new C_DataGrid("SELECT * FROM test2", "id2", "test2");

$sdg->enable_edit('INLINE', 'CRUD');

$dg->set_subgrid($sdg, 'd2', 'b1');

$dg->enable_debug(true);
$sdg->enable_debug(true);

$dg->display();


//$dg = new C_DataGrid("SELECT * FROM productlines", "productLine", "productlines"); 
//
//$sdg = new C_DataGrid("SELECT * FROM products", "productCode", "products");
//
//$dg->set_subgrid($sdg, 'productLine', 'productLine');
//
//$dg->display();


//$dg = new C_DataGrid("SELECT * FROM test1", "id", "test1"); 
//
//$sdg = new C_DataGrid("SELECT * FROM test2", "id2", "test2");
//
//$dg->set_masterdetail($sdg, 'd2');
//
//$dg->display();

?>

</body>
</html>