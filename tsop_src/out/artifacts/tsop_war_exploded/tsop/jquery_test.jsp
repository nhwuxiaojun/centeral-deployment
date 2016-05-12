<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html> 
<head>
<title>
TS Package Deployer - <%=request.getParameter("env_name")%>
</title>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/spin.min.js"></script>
<script src="scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/uploadify/uploadify.css">
<link href="scripts/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

$(function() {

var opts = {
  lines: 12, // The number of lines to draw
  length: 7, // The length of each line
  width: 5, // The line thickness
  radius: 10, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#000', // #rgb or #rrggbb or array of colors
  speed: 1, // Rounds per second
  trail: 100, // Afterglow percentage
  shadow: true, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '50%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};
var target = document.getElementById('foo');

$('#deploy_input').onblur = function() {
	alert($('#deploy_input').val());
};

$('#deploy_db').click ( function() {
        $('#deploy_input').attr("disabled",true);
       $('input[name="deploy_type"]').attr("disabled",true);
});
$('#deploy_all').click ( function() {
        $('#deploy_input').attr("disabled",false);
       $('input[name="deploy_type"]').attr("disabled",false);
});
$('#deploy_app').click ( function() {
        $('#deploy_input').attr("disabled",false);
       $('input[name="deploy_type"]').attr("disabled",false);
});

$('#inc_deploy').click ( function() {
	document.mainform.action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy&deploy_content="+$(':radio[name="deploy_con"]:checked').val();
});

$('#full_deploy').click ( function() {
	document.mainform.action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=full_deploy&deploy_content="+$(':radio[name="deploy_con"]:checked').val();
});

$('#other_type').click (  function() {
	$('#deploy_input').focus();
});


$('#deploy_input').focus ( function() {
        $('#other_type').attr('checked',"checked");
});

$('#deploy_input').autocomplete({ source: ["deploy","upgrade","inc_deploy","fully_deploy","full_deploy"] });

document.getElementById('deploy_input').onblur = function() {
	document.mainform.action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type="+$('#deploy_input').val();
};

$('#deploy2').click( function() {
$( "#dialog" ).dialog({
buttons: {
"Deploy": function() {
        if ( document.getElementById('filename').value == "" ) {
                alert("file was not specified!"); 
		$(this).dialog('close');
                document.getElementById('filename').focus();
                return false;
        }       // end of if

	$('#deploy').attr('disabled',"true");
	$('#deploy').attr('value',"Deploying...");
	$('#info').html("<font color=red>Package deployment is going on, please be patient...</font>");
	var spinner = new Spinner(opts).spin(target);
	$('#mainform').submit();
	$(this).dialog('close');
},
"Cancel": function() {
	$(this).dialog('close');
}
}
	
});
 
});


document.getElementById('deploy3').onclick = function() {
	if ( confirm("Confirm the deployment?" + pkg_name + " to " + <%=request.getParameter("env_name")%>) ) {
                        $('#uploadify').uploadify({
                                'formData'     : {
                                        'timestamp' : '<?php echo $timestamp;?>',
                                        'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
                                },
                                'swf'      : 'scripts/uploadify/uploadify.swf',
                                'uploader' : 'jquery_test_uploader_action.jsp'
                    'queueID'        : 'fileQueue',
                    'queueSizeLimit' :1,  
                    'fileTypeDesc'   : 'rar or zip file',
                    'fileTypeExts'   : '*.rar;*.zip', 
                    'multi'          : true,  
                    'buttonText'     : 'Upload'
                        });
	}
};

document.getElementById('deploy').onclick = function() {
	document.mainform.action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type="+$(':radio[name="deploy_type"]:checked').val()+$('#deploy_input').val()+"&deploy_con="+$(':radio[name="deploy_con"]:checked').val();
	//$('#mainform').attr('action','jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy&deploy_con='+$(':radio[name="deploy_con"]:checked').val());
	if ( document.getElementById('filename').value == "" ) {
		alert("Please choose the package file.");	
		document.getElementById('filename').focus();
		return false;
	}	// end of if
        if ( $('#filename').val().indexOf('.zip') < 0 ) {
                alert($('#filename').val()+" Package file invalid.");
                document.getElementById('filename').focus();
                return false;
        } 	// end of if
	var pkg_name=document.getElementById('filename').value;
	if ( confirm("Confirm the deployment?" + pkg_name + " to " + <%=request.getParameter("env_name")%>) ) {
		$('#deploy').attr('disabled',"true");
		$('#deploy').attr('value',"Deploying...");
		$('#closebtn').attr('disabled',"true");
		$('#info').html("<font color=red>Package deployment is going on, please be patient...</font>");
		document.title="Package Uploading...";
		var spinner = new Spinner(opts).spin(target);
		//document.mainform.action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy";
		//$('#mainform').attr('action',"jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deplpy");
		$('#mainfrom').submit();
	}	// end of if confirm
	else return false;
}

});
</script>
</head>
<body> 
<h2><%=request.getParameter("env_name")%></h2>
<hr>
<form id="mainfrom" method="POST" name="mainform" enctype="multipart/form-data" action="jquery_test_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy&deploy_con=123" >
Upload package to deploy: <input multi="true" id="filename" value="C:\AIGBR_Testing_Empty_PKG.zip" type="file" name="file" size="40"><br/> 
<br>
Deployment content:<br> 
<input id="deploy_all" type="radio" value="all"  name="deploy_con" checked="checked">All</input>
<input id="deploy_app" type="radio" value="app"  name="deploy_con">App</input>
<input id="deploy_db" type="radio" value="db"  name="deploy_con">DB</input>
<br>
App Deployment Type:<br> 
<input id="inc_deploy" type="radio" value="inc_deploy"  name="deploy_type" checked="checked">Incremental Deployment</input>
<br>
<input id="full_deploy" type="radio" value="full_deploy" name="deploy_type" >Full Deployment</input>
<br>
<input id="other_type" type="radio" value="" name="deploy_type"></input>
<input id="deploy_input" type="text">
<br>
<br>
<%
int flag=0;
out.println(Integer.toString(flag));
%>
<br>
<input id="deploy_input1" type="text">
<br><br>
<table><tr><td><input id="selectall" type="checkbox">Select All</input>
</td></tr></table>
<input type="checkbox">1</input>
<input type="checkbox">2</input>
<input type="checkbox">3</input>
<input type="checkbox">4</input>
<input type="checkbox">5</input>
<br><br>
<input id="deploy" type="submit" value="Deploy">
<input id="deploy2" type="button" value="Deploy2" class="ui-state-default ui-corner-all">
<input id="closebtn" value="Close" type="button" onClick="window.close()">
</form> 
<div id="info">
</div>
<hr>
Notice: Chrome and Firefox are not supported currently, please use IE to deploy pachage here.


<!-- ui-dialog -->
<div id="dialog" title="Dialog Title">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exe
rcitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
<div id="dialog" title="Basic dialog">
  <p>Confirm this deployment?</p>
</div>
<div id="dialog-message" title="Download complete">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
    Your files have downloaded successfully into the My Downloads folder.
  </p>
  <p>
    Currently using <b>36% of your storage space</b>.
  </p>
</div>

        <h1>Uploadify Demo</h1>
            <div id="fileQueue"></div>  
            <input type="file" name="uploadify" id="uploadify" />  
            <p>  
                <a href="javascript:$('#uploadify').uploadify('upload')">¿ªʼÉ´«</a>   
                <a href="javascript:$('#uploadify').uplaodify('cancel','*')">ȡÏÉ´«</a>  
            </p>  
 
</body> 
</html> 
