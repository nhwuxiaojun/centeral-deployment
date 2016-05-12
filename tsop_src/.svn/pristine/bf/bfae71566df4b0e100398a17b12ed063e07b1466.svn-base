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
    <form>
        Name: <input type="text" name="name" id="name" />
        City:
        <select id="cityId" name="cityId">
            <option selected="selected" value="0">All cities</option>
            <option value="1">Adana</option>
            <option value="2">Ankara</option>
            <option value="3">Athens</option>
            <option value="4">Beijing</option>
            <option value="5">Berlin</option>
            <option value="6">Bursa</option>
            <option value="7">?stanbul</option>
            <option value="8">London</option>
            <option value="9">Madrid</option>
            <option value="10">Mekke</option>
            <option value="11">New York</option>
            <option value="12">Paris</option>
            <option value="13">Samsun</option>
            <option value="14">Trabzon</option>
            <option value="15">Volos</option>
        </select>
        <button type="submit" id="LoadRecordsButton">Load records</button>
    </form>
</div>
 
<div id="StudentTableContainer"></div>




	<div id="TsMemberContainer" style="width: 100%;"></div>
	<script type="text/javascript">



		$(document).ready(function () {

		    //Prepare jTable
			$('#TsMemberContainer').jtable({
				title: '<font color=red>External and Internal IP Address Map Query</font>',
				actions: {
					listAction: 'TsIPMapAction.php?action=list',
				//	listAction: 'TsIPMapAction.php?action=list',
					createAction: 'TsIPMapAction.php?action=create',
					updateAction: 'TsIPMapAction.php?action=update',
					deleteAction: 'TsIPMapAction.php?action=delete'
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
						width: '11%'
					},
					INTERNAL_PORT: {
						title: 'Port',
						width: '3%'
					},
					EXTERNAL_IP: {
						title: 'External IP',
						width: '11%'
					},
					EXTERNAL_PORT: {
						title: 'Port',
						width: '5%'
					},
					PROJ_NAME: {
						title: 'Project Name',
						width: '10%'
					},
					PROJ_CODE: {
						title: 'Project Code',
						width: '10%'
					},
					APPLY_DATE: {
						title: 'Apply Date',
						width: '10%',
                                                type: 'date',
                                                create: false,
                                                edit: false
					}
				}
			});

        //Re-load records when user click 'load records' button.
        $('#LoadRecordsButton').click(function (e) {
            e.preventDefault();
            $('#StudentTableContainer').jtable('load', {
                name: $('#name').val(),
                cityId: $('#cityId').val()
            });
        });
 
        //Load all records when page is first shown
        $('#LoadRecordsButton').click();

		});

	</script>
 
  </body>
</html>
