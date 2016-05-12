<?php
require_once("../conf.php");      
if (!isset($HTTP_POST_VARS) && isset($_POST)){ $HTTP_POST_VARS = $_POST;}  // backward compability when register_long_arrays = off in config 

$theme_name = (isset($_POST['_gridThemeRoller']))? $_POST['_gridThemeRoller']:'dot-luv';
//echo $theme_name;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Theme</title>
</head>
<body> 

<form id="_form" name="_form" method="post" action="theme_roller.php">

Selected Theme <select id="_gridThemeRoller" name="_gridThemeRoller" onchange="document.forms['_form'].submit();">
	<option value="dot-luv"			<?php echo ($theme_name=='dot-luv') ? ' selected' : '';  ?>>Dot-Luv</option>
	<option value="absolute"		<?php echo ($theme_name=='absolute') ? ' selected' : '';  ?>>Absolute</option>
	<option value="aristo"			<?php echo ($theme_name=='aristo') ? ' selected' : '';  ?>>Aristo</option>
	<option value="black-beauty"	<?php echo ($theme_name=='black-beauty') ? ' selected' : '';  ?>>Black-Beauty</option>
	<option value="blackandred"		<?php echo ($theme_name=='blackandred') ? ' selected' : '';  ?>>Blackandred</option>
	<option value="clean"			<?php echo ($theme_name=='clean') ? ' selected' : '';  ?>>Clean</option>
	<option value="cupertino"		<?php echo ($theme_name=='cupertino') ? ' selected' : '';  ?>>Cupertino</option>
	<option value="dark-round"		<?php echo ($theme_name=='dark-round') ? ' selected' : '';  ?>>Dark-Round</option>
	<option value="duck"			<?php echo ($theme_name=='duck') ? ' selected' : '';  ?>>Duck</option>
	<option value="excite-bike"		<?php echo ($theme_name=='excite-bike') ? ' selected' : '';  ?>>Excite-Bike</option>
	<option value="flick"			<?php echo ($theme_name=='flick') ? ' selected' : '';  ?>>Flick</option>
	<option value="overcast"		<?php echo ($theme_name=='overcast') ? ' selected' : '';  ?>>Overcast</option>
	<option value="pepper-grinder"	<?php echo ($theme_name=='pepper-grinde') ? ' selected' : '';  ?>>Pepper-Grinder</option>
	<option value="purple-haze"		<?php echo ($theme_name=='purple-haze') ? ' selected' : '';  ?>>Purple-Haze</option>
	<option value="redmond"			<?php echo ($theme_name=='redmond') ? ' selected' : '';  ?>>Redmond</option>
	<option value="smoothness"		<?php echo ($theme_name=='smoothness') ? ' selected' : '';  ?>>Smoothness</option>
	<option value="start"			<?php echo ($theme_name=='start') ? ' selected' : '';  ?>>Start</option>
	<option value="tiffany"			<?php echo ($theme_name=='tiffany') ? ' selected' : '';  ?>>Tiffany</option>
	<option value="ui-darkness"		<?php echo ($theme_name=='ui-darkness') ? ' selected' : '';  ?>>UI-Darkness</option>
	<option value="ui-lightness"	<?php echo ($theme_name=='ui-lightness') ? ' selected' : '';  ?>>UI-Lightness</option>
</select>

<?php
$dg = new C_DataGrid("SELECT * FROM orders", "orderNumber", "orders");

// change column titles
$dg -> set_col_title("orderNumber", "Order No.");
$dg -> set_col_title("orderDate", "Order Date");
$dg -> set_col_title("shippedDate", "Shipped Date");
$dg -> set_col_title("customerNumber",  "Customer No.");

// hide a column
$dg -> set_col_hidden("requiredDate");

// change default caption
$dg -> set_caption("Orders List");

// set export type
$dg -> enable_export('EXCEL');

// enable integrated search
$dg -> enable_search(true);

// set height and weight of datagrid
$dg -> set_dimension(800, 600); 

// increase pagination size to 40 from default 20
$dg -> set_pagesize(40);

// use vertical scroll to load data
$dg -> set_scroll(true);

// change theme
$dg -> set_theme($theme_name);
 
$dg -> display();
?>

</form>

</body>
</html>