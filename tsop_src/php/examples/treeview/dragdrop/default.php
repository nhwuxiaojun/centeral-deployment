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
<table style="height:350">
        <tbody><tr>
            <td>
                <div style="font-size:12px;" id="tree"></div>
            </td>
            <td>
                <div style="font-size:12px;" id="tree1"></div>
            </td>
            <td width="200" valign="top">                 
                <fieldset style="font-size: 10pt; font-family: Verdana;">
                    <legend>Drag / Drop events</legend>
                    <div style="height:300px; overflow: auto;" id="dragDropLog"> </div>
				</fieldset>
            </td>
            
        </tr>
    </tbody></table>
	  </div>
	  <?php include 'treeview.php'?>
      <br/>
      <?php tabs(array("treeview.php"));?>
   </body>
</html>
