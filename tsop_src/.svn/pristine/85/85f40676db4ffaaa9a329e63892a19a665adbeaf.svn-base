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
<form>         Name: <input type="text" name="name" id="name" /> 
        <button type="submit" id="LoadRecordsButton">Load records</button>     
</form> 
</div> 

	<div id="PeopleTableContainer" style="width: 100%;"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#PeopleTableContainer').jtable({
				title: 'Table of t_driver',
				paging: true,
				pageSize: 20,
				sorting: true,
				defaultSorting: 'VEHICLE_NO ASC',
				actions: {
					listAction: 'TVehicleActions.php?action=list',
					createAction: 'TVehicleActions.php?action=create',
					updateAction: 'TVehicleActions.php?action=update',
					deleteAction: 'TVehicleActions.php?action=delete'
				},
				fields: {
					VEHICLE_ID: {
						key: true,
						create: false,
						edit: false,
						list: false
					},
					VEHICLE_NO: {
						title: 'Vehicle No',
						width: '5%'
					},
					VEHICLE_TYPE: {
						title: 'Type',
						width: '1%'
					},
					RACK_NO: {
						title: 'Rack No',
						width: '10%'
					},
					ENGINE_NO: {
						title: 'Engine No',
						width: '10%'
					},
					COLOR: {
						title: 'Color',
						width: '1%'
					},
					OWNER: {
						title: 'Owner',
						width: '18%'
					},
					MADE_FACTORY: {
						title: 'Made FACTORY',
						width: '15%'
					},
					VEHICLE_BRAND_1: {
						title: 'VEHICLE_BRAND',
						width: '4%'
					},
					REGISTER_DATE: {
						title: 'Register date',
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
