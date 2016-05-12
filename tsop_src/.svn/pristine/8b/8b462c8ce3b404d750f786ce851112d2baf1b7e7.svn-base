<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.MySQLDBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ include file="interface/check.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html> 
<head>
<title>
TS Package Deployer - <%=request.getParameter("env_name")%>
</title>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/spin.min.js"></script>
<link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
window.onload = function() {

$("#new_name").focus();

$('#submitbtn').click ( function() {
	alert("sss");
        document.mainform.action="ts_env_rename.jsp";
	if ($('#new_name')=="") {
		alert("New Name is empty");
		$('#new_name').focus();
		return false;
	}
        if ( confirm("Please confirm rename: \r\n"+
		$('#mainform').submit();
               	var spinner = new Spinner(opts).spin(target);
	}; else return false;
     };
})
}
</script>
<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1  %>
</head>
<body> 
<%
//System.out.println("Environment Rename from "+request.getParameter("old_name").trim()+" to "+request.getParameter("new_name").trim()+" by "+session.getAttribute("username"));
DBean db = new DBean();
MySQLDBean db1 = new MySQLDBean();
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String dm = new String();
String user = new String();
int i=0;
int j=0;
ResultSet rs;
ResultSet rs1;
user=session.getAttribute("username").toString();
if (request.getParameter("new_name")!=null) {
try {
	sql1="update a_proj_env_svr set proj_code='"+request.getParameter("proj_name")+"',proj_env='"+request.getParameter("new_name").trim()+"' where proj_env='"+request.getParameter("old_name").trim()+"'";
	sql2="update a_db_svr a set a.proj_env='"+request.getParameter("new_name").trim()+"' where a.proj_env='"+request.getParameter("old_name").trim()+"'";
    System.out.println(sql1);
    System.out.println(sql2);
	db.execUpdate(sql1);
	db.execUpdate(sql2);
	out.println("Rename succeed!");	
%>
	<input id="closebtn" value="Close" type="button" onClick="window.close()">
<%
} catch(Exception e) {
	e.printStackTrace();
} finally {
	System.out.println("xxxx");	
}
}
try {
    sql="select distinct b.env_name,b.env_id,a.proj_name,a.proj_id from ts_proj a, ts_env b where a.proj_id(+)=b.proj_id and b.env_name='"+request.getParameter("env_name").trim()+"'";
    rs=db.execSQL(sql);
    sql1="select proj_id,proj_name from ts_proj order by proj_name";
    rs1=db.execSQL(sql1);
    System.out.println(sql);
    while (rs.next()) {
%>
<h2>Environment Rename & Regroup <font color=red></font></h2>
<hr>
<form id="mainform" name="mainform" method="GET" action="ts_env_rename.jsp"> 
Old Name: <input type=text id="old_name" name="old_name" readonly value="<%=request.getParameter("env_name").trim()%>" size="30"></input>
<br>
<br>
New Name: <input type=text id="new_name" name="new_name" size="30" value="<%=request.getParameter("env_name").trim()%>"></input>
<br>
<br>
Project Name: <select id="proj_name" name="proj_name"><option value="<%=rs.getString("proj_id")%>"><%=rs.getString("proj_name")%></option>
<%
    while (rs1.next()) { out.println("<option value='"+rs1.getString("proj_id")+"'>"+rs1.getString("proj_name")+"</option>");}
%>
</select>
<br>
<br>
<input id="submitbtn" type="submit" value="Update">
<input id="closebtn" value="Close" type="button" onClick="window.close()">
</form> 
<div id="info"> </div>
<div id="foo"> </div>
<hr>
<%
 }
    rs.close();
} catch(Exception e) {
	e.printStackTrace();
} finally {
    db.close();
}
%>

</body> 
</html> 
