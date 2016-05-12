<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html> 
<head>
<title>
TS Package Deployer - <%=request.getParameter("env_name")%>
</title>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.2/jquery-ui.js"></script>
<script src="scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/uploadify/uploadify.css">
<link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/theme.css" rel="stylesheet" type="text/css">
<style type=text/css>
div.ui-dialog-titlebar {
  font-size : 10px;
}

div.ui-dialog-content {
  font-size : 15px;
  font-family : georgia;
  font-style : italic;
}
</style>
<script type="text/javascript">

$(function() {
//$("div#dialog").dialog('option','autoOpen',false);
//$("div#dialog").dialog({ position : ["center","right"] });
$('#deploy').click ( function(event) {
//	alert("test");
//	if ($("#dialog").dialog("isOpen")) alert("Already open!");
//	else $("#dialog").dialog("open");
	$("#dialog").dialog({
	buttons: { "Yes" : function() { $("div#dialog").dialog("close");
		}, "No" : function() {}
	},
	title : "test dialog",
	height : "600",
	width : "600",
	closeOnEscape:true,
	show : "slide",
	hide : "scale",
	modal : "true"
	});
});


});
</script>

</head>
<body> 
<h2><%=request.getParameter("env_name")%></h2>
<hr>
<div id="dialog">
<p>Content of dialog box</p>
</div>
 
<script type="text/javascript">
</script>
<input id="deploy" type="button" value="test">
</body> 
</html> 
