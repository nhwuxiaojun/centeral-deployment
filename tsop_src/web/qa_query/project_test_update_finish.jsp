<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page  import="java.util.Date" %>
<html>
<head>
<title>项目版本信息修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
QADBean db = new QADBean();
String sql = new String();
int i = 0;
int id = 0;
String project_name = new String();
String project_version = new String();
String customer_name = new String();
String test_date = new String();
int fail_num = 0;
int pass_num = 0;
id = Integer.parseInt(request.getParameter("id"));
project_name = Tools.toGB(request.getParameter("project_name").trim());
project_version = Tools.toGB(request.getParameter("project_version").trim());
customer_name = Tools.toGB(request.getParameter("customer_name").trim());
fail_num = Integer.parseInt(request.getParameter("fail_num"));
pass_num = Integer.parseInt(request.getParameter("pass_num"));
test_date = request.getParameter("test_date");

sql="update a_project_version_test set project_name = '" + project_name + "',project_version = '" + project_version + "',customer_name = '" + customer_name + "',fail_num = " + fail_num + ",pass_num = " + pass_num + ",test_date = to_date('" + test_date + "','yyyy-mm-dd') where id = " + id;
//out.println(sql + "<br>");
i=db.execUpdate(sql);
//out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("project_test_manage.jsp?info=修改成功！");
}else{
	response.sendRedirect("project_test_manage.jsp?info=修改失败！");
}
%>
</body>
</html>
