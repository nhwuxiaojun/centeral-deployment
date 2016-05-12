<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>项目代码提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String proj_name = new String();
String proj_grp = new String();
String proj = new String();
String proj_code = new String();
String error_msg=new String();

proj_name = request.getParameter("proj_name").trim();
proj_grp = request.getParameter("proj_grp").trim();
proj = request.getParameter("proj").trim();
proj_code = request.getParameter("proj_code").trim();

//sql_temp = "select * from a_env_name where proj_name = '" + request.getParameter("proj_name") + "'";
sql_temp = "select * from ts_proj where proj_name = '" + request.getParameter("proj_name") + "'";
rs = db.execSQL(sql_temp);
%>

<%if(rs.next()){%>
	<script language="JavaScript">
		alert("项目名称已存在！");
		window.location = "project_code_manage.jsp";
	</script>
<%}else{%>

<%
try {
sql = "insert into ts_proj(proj_grp,proj_name,proj_desc,proj_id) values(upper('" + proj_grp + "'),upper('" + proj_name + "'),'" + proj + "'," + proj_code + ")";
System.out.println(sql);
i = db.execUpdate(sql);
//sql = "insert into a_env_name(proj_grp,proj_name,proj,proj_code,valid_flag) values('" + proj_grp + "','" + proj_name + "','" + proj + "'," + proj_code + ",null)";
//i = db.execUpdate(sql);
} catch(Exception e) {
	e.printStackTrace();
	error_msg=e.toString();
}
if(i==1){
	response.sendRedirect("project_code_manage.jsp?info=Create Succeed!");
}else{
	response.sendRedirect("project_code_manage.jsp?info=Create Failed!+<br>"+error_msg);
}
%>

<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
