<html>
  <head>

    <link href="themes/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
	<link href="Scripts/jtable/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css" />
	
	<script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jtable/jquery.jtable.js" type="text/javascript"></script>
	
  </head>
  <body>
<div class="filtering">
</div>
	<div id="TsMemberContainer" style="width: 100%;"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#TsMemberContainer').jtable({
				title: '<font color=red>TS Member List</font>',
				actions: {
					listAction: 'TsMemberActions.php?action=list',
					createAction: 'TsMemberActions.php?action=create',
					updateAction: 'TsMemberActions.php?action=update',
					deleteAction: 'TsMemberActions.php?action=delete'
				},
				fields: {
					NO: {
						key: true,
					//	title: 'NO'
						create: false,
						edit: false,
						list: false
					},
					CNAME: {
						title: 'Chinese Name',
						width: '8%'
					},
					MOBILE1: {
						title: 'Mobile Phone',
						width: '10%'
					},
					EXT: {
						title: 'Ext No',
						width: '6%'
					},
					ACCOUNT: {
						title: 'Domain Account',
						width: '10%'
					}
				}
			});

			//Load person list from server
			$('#TsMemberContainer').jtable('load');

		});

	</script>
 
  </body>
</html>
