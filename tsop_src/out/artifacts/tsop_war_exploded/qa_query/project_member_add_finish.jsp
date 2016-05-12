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
String sql_temp = new String();
String sql = new String();
String datestr = new String();
ResultSet rs;
int i = 0;
int id = 0;
int ba_member = 0;
int dm_member = 0;
int st_member = 0;
int total_member = 0;

DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date=new java.util.Date();
datestr=df.format(new java.util.Date());

String project_name = new String();
String start_date = new String();


project_name = Tools.toGB(request.getParameter("project_name").trim());
start_date = request.getParameter("start_date");
ba_member = Integer.parseInt(request.getParameter("ba_member"));
dm_member = Integer.parseInt(request.getParameter("dm_member"));
st_member = Integer.parseInt(request.getParameter("st_member"));
total_member = Integer.parseInt(request.getParameter("total_member"));


sql_temp = "select a_project_member__id.nextval as id from dual";
//out.print(sql_temp+"<br>");
rs = db.execSQL(sql_temp);
if (rs.next()) {
	id = rs.getInt("id");
}
rs.close();

sql = "insert into a_project_member_info(id,project_name,start_date,ba_member,dm_member,st_member,total_member,booking_user,booking_date)values(" + id + ",'" + project_name + "',to_date('" + start_date + "','yyyy-mm-dd')," + ba_member + "," + dm_member + "," + st_member + "," + total_member + ",'" + session.getAttribute("username") + "',to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss'))";
//out.println(sql+"<br>");
i = db.execUpdate(sql);
//out.println(i+"<br>");
db.close();
if(i==1){
	response.sendRedirect("project_version_manage2.jsp?info2=新增成功！");
}else{
	response.sendRedirect("project_version_manage2.jsp?info2=新增失败！");
}
%>
</body>
</html>