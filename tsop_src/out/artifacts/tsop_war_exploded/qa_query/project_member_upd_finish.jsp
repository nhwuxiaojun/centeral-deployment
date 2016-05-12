<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.QADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>项目人员提交处理</title>
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
String sql = new String();
ResultSet rs;
int i = 0;
int id = 0;
int ba_member = 0;
int dm_member = 0;
int st_member = 0;
int total_member = 0;


id = Integer.parseInt(request.getParameter("id"));
ba_member = Integer.parseInt(request.getParameter("ba_member"));
dm_member = Integer.parseInt(request.getParameter("dm_member"));
st_member = Integer.parseInt(request.getParameter("st_member"));
total_member = Integer.parseInt(request.getParameter("total_member"));


sql = "update a_project_member_info set ba_member = " + ba_member + ",dm_member = " + dm_member + ",st_member = " + st_member + ",total_member = " + total_member + ",booking_user = '" + session.getAttribute("username") + "' where id = " + id;
//out.println(sql+"<br>");
i = db.execUpdate(sql);
//out.println(i+"<br>");
db.close();
if(i==1){
	response.sendRedirect("project_version_manage2.jsp?info2=修改成功！");
}else{
	response.sendRedirect("project_version_manage2.jsp?info2=修改失败！");
}
%>
</body>
</html>