<html>
  <head>

    <link href="themes/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
	<link href="Scripts/jtable/themes/lightcolor/red/jtable.css" rel="stylesheet" type="text/css" />
	
	<script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jtable/jquery.jtable.js" type="text/javascript"></script>
	
  </head>
  <body>
<div class="filtering">
</div>
	<div id="TsMemberContainer" style="width: 100%; height: 500"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#TsMemberContainer').jtable({
				title: '<font color=red>External and Internal IP Address Map Query</font>',
                                paging: true,
                                pageSize: 11,
                                sorting: true,
                                defaultSorting: 'INTERNAL_IP ASC',
				actions: {
					listAction: 'TsIPMapActionPagedSorted.php?action=list',
					createAction: 'TsIPMapActionPagedSorted.php?action=create',
					updateAction: 'TsIPMapActionPagedSorted.php?action=update',
					deleteAction: 'TsIPMapActionPagedSorted.php?action=delete'
				},
				fields: {
					NO: {
						key: true,
					//	title: 'NO'
						create: false,
						edit: false,
						list: false
					},
					INTERNAL_IP: {
						title: 'Internal IP',
						width: '12%'
					},
					INTERNAL_PORT: {
						title: 'Port',
						width: '7%'
					},
					EXTERNAL_IP: {
						title: 'External IP',
						width: '12%'
					},
					EXTERNAL_PORT: {
						title: 'Port',
						width: '7%'
					},
					PROJ_NAME: {
						title: 'Project Name',
						width: '8%'
					},
					PROJ_CODE: {
						title: 'Project Code',
						width: '8%'
					},
					APPLY_DATE: {
						title: 'Apply Date',
						width: '10%',
                                                type: 'date',
                                                create: false,
                                                edit: false,
						list: false
					}
				}
			});

			//Load person list from server
			$('#TsMemberContainer').jtable('load');

		});

	</script>
 
  </body>
</html>
