<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page  import="java.util.Date" %>
<html>
<head>
<title>现场备份检查确认表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
int i=0;
String project_name = new String();
String env_num = new String();
String start_date = new String();
String end_date = new String();
String take_person = new String();
String take_date = new String();
String check_person = new String();
String check_date = new String();
String test_result = new String();
String sample_date = new String();

project_name = Tools.toGB(request.getParameter("project_name").trim());
env_num = request.getParameter("env_num").trim();
start_date = request.getParameter("start_date").trim();
end_date = request.getParameter("end_date").trim();
take_person = Tools.toGB(request.getParameter("take_person").trim());
take_date = request.getParameter("take_date").trim();
check_person = Tools.toGB(request.getParameter("check_person").trim());
check_date = request.getParameter("check_date").trim();
test_result = Tools.toGB(request.getParameter("test_result").trim());
sample_date = request.getParameter("sample_date").trim();

sql="update a_pro_bak set start_date = to_date('" + start_date + "','yyyy-mm-dd')" + ",end_date = to_date('" + end_date + "','yyyy-mm-dd'),take_person = '" + take_person + "',take_date = to_date('" + take_date + "','yyyy-mm-dd'),check_person = '" + check_person + "',check_date = to_date('" + check_date + "','yyyy-mm-dd'),test_result = '" + test_result + "',sample_date = to_date('" + sample_date + "','yyyy-mm-dd')" + " where project_name = '"+ project_name +"'";
//out.println(sql + "<br>");
i=db.execUpdate(sql);
//out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("scene_backup_check_manage.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("scene_backup_check_manage.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
