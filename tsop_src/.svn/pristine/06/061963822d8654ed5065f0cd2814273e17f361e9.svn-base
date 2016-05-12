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
            <td valign="top">
                <fieldset title="Selection">
                    <legend style="font-size:120%; font-family: Tahoma">Selection</legend>
                    <input type="button" id="selnode" value="Select Nodes" />
                    <input type="button" id="unselnode" value="Unselect '2.2.3'" />
                    <input type="button" id="unselall" value="Unselect All" />
                </fieldset>
                <br /><br />
                <fieldset title="Expand/Collapse">
                    <legend style="font-size:120%; font-family: Tahoma">Selection</legend>
                    <input type="button" id="eall" value="Expand All Nodes" />
                    <input type="button" id="call" value="Collapse All Nodes"/>
                    <br />
                    <input type="button" id="enode" value="Expand 'Two'" onclick="expandNode()" />
                    <input type="button" id="cnode" value="Collapse 'Two'" onclick="collapseNode()" />
                    <input type="button" id="tnode" value="Toggle 'Two'" onclick="toggleNode()" />
                </fieldset>
                 <br /><br />
                <fieldset title="Checkboxes">
                    <legend style="font-size:120%; font-family: Tahoma">CheckBoxes</legend>
                    <input type="button" id="checkall" value="Check All Nodes" />
                    <input type="button" id="uncheckall" value="Uncheck All Nodes" />
                    <br />
                    <input type="button" id="checktwo" value="Check 'Two'"/>
                    <input type="button" id="unchecktwo" value="Uncheck 'Two'" />                    
                </fieldset>
            </td>
        </tr>
    </table>
      </div>
      <br/>
      <?php tabs(array("treeview.php"));?>
   </body>
</html>
