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
	<div id="TsMemberContainer" style="width: 100%; height: 100%;"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#TsMemberContainer').jtable({
				title: '<font color=red>FTP Info Query</font>',
                                paging: true,
                                pageSize: 150,
                                sorting: true,
                                defaultSorting: 'PROJ_NAME ASC',
				actions: {
					listAction: 'TsFTPQueryActionPagedSorted.php?action=list',
					createAction: 'TsFTPQueryActionPagedSorted.php?action=create',
					updateAction: 'TsFTPQueryActionPagedSorted.php?action=update',
					deleteAction: 'TsFTPQueryActionPagedSorted.php?action=delete'
				},
				fields: {
					FTP_ID: {
						key: true,
					//	title: 'NO'
						create: false,
						edit: false,
						list: false
					},
					PROJ_NAME: {
						title: 'Project',
						width: '8%'
					},
					USERNAME: {
						title: 'User',
						width: '8%'
					},
					FTP_PASSWORD: {
						title: 'Passwd',
						width: '10%'
					},
					FTP_TYPE: {
						title: 'Type',
						width: '5%'
					},
					FTP_DIR: {
						title: 'Pwd',
						width: '10%',
						list: false
					},
					APPLICANT: {
						title: 'Applicant',
						width: '10%',
						list: false
					},
					START_TIME: {
						title: 'Apply Date',
						width: '10%',
                                                type: 'date',
                                                create: false,
                                                edit: false,
						list:false
					}
				}
			});

			//Load person list from server
			$('#TsMemberContainer').jtable('load');

		});

	</script>
 
  </body>
</html>
