<%@ include file="interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.MySQLDBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html> 
<head>
<title>
TS DB Package Deployer - <%=request.getParameter("env_name")%>
</title>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/spin.min.js"></script>
<link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
<style type="text/css">  
body {
        font-family:verdana, sans-serif;
        font-size:small;
}
</style>  
<script type="text/javascript">
window.onload = function() {
$('#deploy_input').attr("disabled",true);
$('input[name="deploy_type"]').attr("disabled",true);
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
  hwaccel: true, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '50%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};
var target = document.getElementById('foo');

$('#inc_deploy').click ( function() {
        document.mainform.action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy&deploy_con="+$(':radio[name="deploy_con"]:checked').val();
});

$('#full_deploy').click ( function() {
        document.mainform.action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=full_deploy&deploy_con="+$(':radio[name="deploy_con"]:checked').val();
//      $('#mainform').attr('action',"ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=full_deplpy");
});


$('#emailbtn').click ( function() {
        if (this.checked) {
		$('#email').attr("value","y");
	} else {
		$('#email').attr("value","n");
	}
});
        $('#updatebtn').click ( function() {
            if (this.checked) {
                $('#content').attr("rows",30);
                $('#content').attr("disabled",false);
                $('#savebtn').attr("disabled",false);
        } else {
                $('#content').attr("rows",4);
                $('#content').attr("disabled",true);
                $('#savebtn').attr("disabled",true);
        }
        });

$('#other_type').click (  function() {
        $('#deploy_input').focus();
});

$('#deploy_input').focus ( function() {
	$('#other_type').attr('checked',"checked");
});

$('#deploy_input').autocomplete({ source: ["deploy","upgrade","inc_deploy","fully_deploy","full_deploy","increment_deploy"] });

$('#deploy_print').click ( function() {
        $('#deploy_input').attr("disabled",true);
       $('input[name="deploy_type"]').attr("disabled",true);
});
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

document.getElementById('deploy_input').onblur = function() {
        document.mainform.action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type="+$('#deploy_input').val();
};

document.getElementById('deploy').onclick = function() {
        document.mainform.action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type="+$(':radio[name="deploy_type"]:checked').val()+$('#deploy_input').val()+"&deploy_con="+$(':radio[name="deploy_con"]:checked').val()+"&email="+$('#email').val();
        if ( document.getElementById('filename').value == "" ) {
                alert("Please choose the package file!");
                document.getElementById('filename').focus();
                return false;
        }
	if ( $('#filename').val().indexOf('.zip') < 0 ) {
                alert("Invalid package file! \r\n"+$('#filename').val());
                document.getElementById('filename').focus();
                return false;
        }
        var pkg_name=document.getElementById('filename').value;
        if ( confirm("Please confirm this deployment: \r\n"+
		"Package File: " + pkg_name + " \r\n"+
		"Environment: <%=request.getParameter("env_name")%>\r\n"+
		"Deployment Include: "+$(':radio[name="deploy_con"]:checked').val()+"\r\n"+
		"Deployment Type: "+$(':radio[name ="deploy_type"]:checked').val()+$('#deploy_input').val()) ) {
        	$('#deploy').attr('disabled',"true");
        	$('#closebtn').attr('disabled',"true");
        	$('#deploy').attr('value',"Deploying...");
        	$('#info').html("<font color=red>Package uploading, please DO NOT close this window!</font>");
                document.title="Package Uploading...";
		//$('#mainform').action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type="+document.getElementById('deploy_type').value;
		$('#mainform').submit();
               	var spinner = new Spinner(opts).spin(target);
	} else return false;
     }
}
</script>
<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1  %>
</head>
<body> 
<%
System.out.println("User Authentication:"+session.getAttribute("username"));
DBean db = new DBean();
MySQLDBean db1 = new MySQLDBean();
String sql = new String();
String sql1 = new String();
String dm = new String();
String user = new String();
int i=0;
int j=0;
int k=0;
ResultSet rs;
ResultSet rs1;
user=session.getAttribute("username").toString();
// Record access history
//sql="insert into ts_recent_envs(env_id,user_name) values("+request.getParameter("env_id")+",'"+session.getAttribute("username")+"')";
//sql="insert into ts_recent_env(env_id,user_name) select 1445,'jiangtao.chen' from dual where not exists ( select * from ts_recent_env where user_name='jiangtao.chen' and env_id=1445)";
sql="insert into ts_recent_env(env_id,user_name) select "+request.getParameter("env_id")+",'"+session.getAttribute("username")+"' from dual where not exists ( select * from ts_recent_env where user_name='"+session.getAttribute("username")+"' and env_id="+request.getParameter("env_id")+")";
System.out.println(sql);
try {
	i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
}

sql="update ts_recent_env set last_access=sysdate where user_name='"+session.getAttribute("username")+"' and env_id="+request.getParameter("env_id");
System.out.println(sql);
try {
        i = db.execUpdate(sql);
} catch (Exception e) {
        e.printStackTrace();
}

try {
    sql="select d.proj_env proj_name,a.dm,c.account from ts_proj a, ts_env b, ts_member c, ts_env_db d where b.env_id(+)=d.env_id and  a.proj_id(+)=b.proj_id and a.owner1=c.no(+) and d.proj_env='"+request.getParameter("env_name")+"'";
    sql1="select * from a_user where valid<>3 and usr='"+user+"'";
    rs1=db.execSQL(sql1);
    System.out.println(sql1);
    while (rs1.next()) {
	j=1;
    }
    System.out.println(sql);
%>
<h2>Target DB Environment: <font color=blue><%=request.getParameter("env_name")%></font></h2>
<h4>
<%
    rs1=db.execSQL("select * from ts_env_db a where a.proj_env='"+request.getParameter("env_name")+"'");
    while (rs1.next()) {
	out.print("DB Info: <font color=red>"+rs1.getString("DB_USER")+"/"+rs1.getString("DB_USER_PASSWD")+"@"+rs1.getString("DB_LDAP_NAME")+"</font>");
    }
%>
</h4>
<hr>
<%
// check whether project name is belong to any project
    rs=db.execSQL(sql);
    while (rs.next()) {
	k=1;
    }
    if ( k==0 ) {
	out.println("Sorry, Environment <a href='/tsop/ext/env_info_detail.jsp?id="+request.getParameter("env_id")+"' target='_blank'>"+request.getParameter("env_name")+"</a> is not belong to any project!");
	out.println("<br>Please <a href='/tsop/ts_env_rename.jsp?env_id="+request.getParameter("env_id")+"&env_name="+request.getParameter("env_name")+"' target='_blank'>regroup</a> this environment or contact <a href='mailto:EAS-TS@ebaotech.com'>TS</a> for support!");
	out.println("<br><hr><center><button onclick='javascript:window.close();'>Close</button></center>");
    }

    rs=db.execSQL(sql);
    int sum=0;
    while (rs.next() && sum<1) {
	sum++;
	System.out.println(rs.getString("DM")+":"+rs.getString("proj_name"));
	if ("null".equals(rs.getString("DM"))||"".equals(rs.getString("DM"))||rs.getString("DM")==null ) dm="no-dm"; else {
		dm=rs.getString("DM");
		System.out.println(dm);
		i=dm.indexOf(user);
		System.out.println(i);
	}


	if ( j==1 || i != -1 ) {
	    System.out.println("found");
%>
<form id="mainform" name="mainform" method="POST" enctype="multipart/form-data" action="ts_deploy_env_action.jsp?env_name=<%=request.getParameter("env_name")%>&env_id=<%=request.getParameter("env_id")%>&deploy_type=inc_deploy"> 
<div id="file_name">Package Upload:</div>
<br>
<input id="filename" type="file" name="file" size="60" onblur="$('#file_name').html('File Name: '+$('#filename').val()); "><br/>
<br>
Deployment Include:<br> 
<input id="deploy_all" type="radio" value="all"  name="deploy_con">All</input>
<input id="deploy_app" type="radio" value="app"  name="deploy_con">App</input>
<input id="deploy_db" type="radio" value="db"  name="deploy_con" checked="checked"><font color="blue">DB</font></input>
<input id="deploy_print" type="radio" value="print"  name="deploy_con">Print</input>
<br><br>
App Deployment Type (install.sh parameters, available options highlighed below. <span style=background-color:yellow></span>):<br> 
<input id="inc_deploy" type="radio" value="inc_deploy"  name="deploy_type" checked="checked">
Incremental Deployment (inc_deploy)</font></span></input>
<br>
<input id="increment_deploy" type="radio" value="increment_deploy"  name="deploy_type" >
Incremental Deployment (increment_deploy)</font></span></input>
<br>
<input id="full_deploy" type="radio" value="full_deploy" name="deploy_type">
Full Deployment (full_deploy)</font></span></input>
<br>
<input id="fully_deploy" type="radio" value="fully_deploy" name="deploy_type">
Full Deployment (fully_deploy)</font></span></input>
<br>
<input id="upgrade_deploy" type="radio" value="upgrade" name="deploy_type" >
Upgrade Deployment (upgrade)</font></span></input>
<br>
<input id="cluster_inc_deploy" type="radio" value="cluster_inc_deploy"  name="deploy_type" >
Cluster Incremental Deployment (cluster_inc_deploy)</font></span></input>
<br>
<input id="other_type" type="radio" value="" name="deploy_type"></input><input id="deploy_input" placeholder="customization option" type="text">
<br>
<br>



<input id="emailbtn" type="checkbox" checked="true">&nbsp;Email Notification</input>
<input type="hidden" id="email" name="email" value="y">
<br>
<input id="deploy" type="submit" value="Deploy">
<input id="closebtn" value="Close" type="button" onClick="window.close()">
</form> 
<%
java.io.File f1 = new java.io.File( "/usr/local/deploy/"+request.getParameter("env_name") ) ;
System.out.println( f1.mkdirs() ? "Folder created" : "Create failed!" ) ;
Runtime.getRuntime().exec("chmod 775 "+"/usr/local/deploy/"+request.getParameter("env_name"));
%>
<%
//写文件
String initial_parameter="/usr/local/deploy/"+request.getParameter("env_name")+"/initial_parameter.tcl";
String path = "/deploy/"+request.getParameter("env_name");
String filename = request.getRealPath(path+"/initial_parameter.tcl");
java.io.File f = new java.io.File(filename);
//f.setWritable(true);

if(!f.exists())
{
  f.createNewFile();
}

if ( request.getParameter("new") != null ) {
try
{
  java.util.Date date = new java.util.Date(); 
  System.out.println("initial_parameter.tcl updated by:"+session.getAttribute("username"));
  PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
  pw.println("# Updated by "+session.getAttribute("username")+" - "+date);//写内容
  pw.println(request.getParameter("content"));//写内容
  pw.close();
}
catch(IOException e)
{
  out.println(e.getMessage());
}
} // end of if
Runtime.getRuntime().exec("chmod 664 "+initial_parameter);

//读文件
java.io.FileReader fr = new java.io.FileReader(f);
char[] buffer = new char[10];
int length; 
//out.write(filename+"<br>");
%>
<form action="ts_db_deploy_env.jsp" method="POST">
<input id="updatebtn" type="checkbox">&nbsp;Modify initial_parameter.tcl (<%=filename%>)</input>
&nbsp;&nbsp;<button type="submit" id="savebtn" disabled>Save</button>
<br>
<textarea id="content" name="content" rows=4 cols=90 disabled=disabled>
<%
while((length=fr.read(buffer))!=-1)
{
  out.write(buffer,0,length);
}
fr.close();
%>
</textarea>
<input type="hidden" name="new" value="new">
<input type="hidden" name="env_name" value="<%=request.getParameter("env_name")%>">
<input type="hidden" name="env_id" value="<%=request.getParameter("env_id")%>">

<div id="info"> </div>
<div id="foo"> </div>


<hr>
<%
	} else {
	    System.out.println("authentication failed");
	    out.println("<h3>Sorry, you don't have deployment privilege to project <font color=red><b>"+rs.getString("proj_name")+"</b></font> environment <font color=red><b>"+request.getParameter("env_name")+"</b></font>, please contact TS owner <a href='mailto:"+rs.getString("account")+"@ebaotech.com?Subject=Apply Deployment Privilege for Project "+rs.getString("proj_name")+"'>"+rs.getString("account")+"</a> or <a href='mailto:EAS-TS@ebaotech.com?Subject=Apply Deployment Privilege'>#EAS-TS</a> for help.</h2>");
	}	// end of if-else
    }	// end of while
    rs.close();
} catch(Exception e) {
	e.printStackTrace();
} finally {
    db.close();
}
%>

</body> 
</html> 
