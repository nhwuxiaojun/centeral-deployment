<?php 
require_once '../../../tabs.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>jqTreeView PHP Demo</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../../../themes/redmond/jquery-ui-custom.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../../../themes/ui.jqtreeview.css" />
    <style type="text">
        html, body {
        margin: 0;			/* Remove body margin/padding */
    	padding: 0;
        overflow: hidden;	/* Remove scroll bars on browser window */
        font-size: 75%;
        }
    </style>
    <script src="../../../js/jquery.js" type="text/javascript"></script>
    <script src="../../../js/jquery-ui-custom.min.js" type="text/javascript"></script>
    <script src="../../../js/jquery.jqTreeView.min.js" type="text/javascript"></script>
  </head>
  <body>
      <div>
          <?php include ("treeview.php");?>
		  <table> <tr>
			<td valign="top"> 
				<div id="tree" style="font-size: 12px;"></div> 
			</td>
            <td valign="top" style="width:300px; height: 300px;">                
                <div id="eventLog" style="height:300px; overflow:auto; font-size:110%; font-family:Tahoma;font-size: 12px;" />
            </td>
        </tr>
    </table>
      </div>
      <br/>
      <?php tabs(array("treeview.php"));?>
   </body>
</html>
