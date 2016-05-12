<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.QADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>项目测试新增处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.text
{
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
    border-right-color:Black;
}
.button1
{   height:14pt;
    width:30pt;
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;	 
}
-->
</style>
</head>
<body>
<%
QADBean db = new QADBean();
String sql_temp = new String();
String sql = new String();
ResultSet rs;
int i = 0;
int id = 0;
int fail_num = 0;
int pass_num = 0;
String project_name = new String();
String project_version = new String();
String customer_name = new String();
String test_date = new String();
String datestr = new String();

project_name = Tools.toGB(request.getParameter("project_name").trim());
project_version = Tools.toGB(request.getParameter("project_version").trim());
customer_name = Tools.toGB(request.getParameter("customer_name").trim());
fail_num = Integer.parseInt(request.getParameter("fail_num"));
pass_num = Integer.parseInt(request.getParameter("pass_num"));
test_date = request.getParameter("test_date");
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
datestr = df.format(new java.util.Date());

sql_temp = "select a_project_version_test__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
rs = db.execSQL(sql_temp);
if (rs.next()) {
	id = rs.getInt("id");
}
rs.close();

sql = "insert into a_project_version_test(id,project_name,project_version,customer_name,fail_num,pass_num,test_date,user_name,submit_datetime)values("+id+",'"+project_name+"','"+project_version+"','"+customer_name+"',"+fail_num+","+pass_num+",to_date('"+test_date+"','yyyy-mm-dd'),'"+session.getAttribute("username")+"',to_date('"+datestr+"','yyyy-mm-dd'))";
//out.println(sql+"<br>");
i=db.execUpdate(sql);
//out.println(i+"<br>");
if(i==1){
	response.sendRedirect("project_test_manage.jsp?info=新增成功！");
}else{
	response.sendRedirect("project_test_manage.jsp?info=新增失败！");
}
db.close();
%>
</body>
</html>