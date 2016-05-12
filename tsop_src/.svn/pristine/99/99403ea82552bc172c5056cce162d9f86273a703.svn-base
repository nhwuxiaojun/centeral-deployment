<html>
  <head>

    <link href="themes/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
	<link href="Scripts/jtable/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css" />
	
	<script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jtable/jquery.jtable.js" type="text/javascript"></script>
	
  </head>
  <body>
	<div id="PeopleTableContainer" style="width: 100%;"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#PeopleTableContainer').jtable({
				title: 'Table of t_driver',
				paging: true,
				pageSize: 20,
				sorting: true,
				defaultSorting: 'NAME ASC',
				actions: {
					listAction: 'TDriverActions.php?action=list',
					createAction: 'TDriverActions.php?action=create',
					updateAction: 'TDriverActions.php?action=update',
					deleteAction: 'TDriverActions.php?action=delete'
				},
				fields: {
					DRIVER_ID: {
						key: true,
						create: false,
						edit: false,
			//			list: false
					},
					NAME: {
						title: 'Name',
						width: '10%'
					},
					GENDER: {
						title: 'Gender',
						width: '5%'
					},
					DRIVER_CODE: {
						title: 'Driver Code',
						width: '10%'
					},
					NATIONALITY: {
						title: 'NATIONALITY',
						width: '10%'
					},
					AREA: {
						title: 'AREA',
						width: '10%'
					},
					CERTI_CODE: {
						title: 'Certi Code',
						width: '20%'
					},
					REGISTER_DATE: {
						title: 'Record date',
						width: '10%',
						type: 'date',
						create: false,
						edit: false
					}
				}
			});

			//Load person list from server
			$('#PeopleTableContainer').jtable('load');

		});

	</script>
 
  </body>
</html>
