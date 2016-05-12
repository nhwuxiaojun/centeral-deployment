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
	<div id="TsMemberContainer" style="width: 100%;"></div>
	<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#TsMemberContainer').jtable({
				title: 'TS Member List',
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
					NAME: {
						title: 'Name',
						width: '10%'
					},
					CNAME: {
						title: 'Chinese Name',
						width: '10%'
					},
					gender: {
						title: 'Gender',
						width: '10%' ,
                    				options: { 'M': 'ÄÐ', 'F': 'Å®' } 
					},
					MOBILE1: {
						title: 'Mobile Phone',
						width: '10%'
					},
					EXT: {
						title: 'Ext No',
						width: '10%'
					},
					ACCOUNT: {
						title: 'Domain Account',
						width: '10%'
					}
				}
			});

			//Load person list from server
			$('#TsMemberContainer').jtable('load');

        //Re-load records when user click 'load records' button.         
$('#LoadRecordsButton').click(function (e) {             
	e.preventDefault();             
	$('#TsMemberTableContainer').jtable('load', {                 
		name: $('#name').val(),                 
		});         
});           
//Load all records when page is first shown         
$('#LoadRecordsButton').click(); 

		});

	</script>
 
  </body>
</html>
