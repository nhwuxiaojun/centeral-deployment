<%@ include file="../interface/check_qa.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>项目版本信息删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
QADBean db = new QADBean();
String sql = new String();
String sql_user = new String();
String project_name = new String();
String project_version = new String();
String uat_start_date = new String();
String production_start_date = new String();
String sql_check = new String();
String sql_temp = new String();
String datestr = new String();
ResultSet rs_user;
ResultSet rs_log;
ResultSet rs;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
int i = 0;
int j = 0;
int id = 0;
int uat_start_year = 0;
int uat_start_month = 0;
int uat_start_day = 0;
int production_start_year = 0;
int production_start_month = 0;
int production_start_day = 0;


project_name = Tools.toGB(request.getParameter("project_name").trim());
project_version = Tools.toGB(request.getParameter("project_version").trim());
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
datestr = df.format(new java.util.Date());

sql_check = "select * from a_project_version_info where project_name = '"+ project_name +"' and project_version = '" + project_version + "'";

sql = "delete from a_project_version_info where project_name = '" + project_name + "' and project_version = '" + project_version + "'";

rs = db.execSQL(sql_check);
while(rs.next()){
	uat_start_year = rs.getDate("uat_start_date").getYear() + 1900;
	uat_start_month = rs.getDate("uat_start_date").getMonth() + 1;
	uat_start_day = rs.getDate("uat_start_date").getDate();
	production_start_year = rs.getDate("production_start_date").getYear() + 1900;
	production_start_month = rs.getDate("production_start_date").getMonth() + 1;
	production_start_day = rs.getDate("production_start_date").getDate();

	uat_start_date = uat_start_year + "-" + uat_start_month + "-" + uat_start_day;
	production_start_date = production_start_year + "-" + production_start_month + "-" + production_start_day;
	
	if("admin".equals(session.getAttribute("username"))){
		i = db.execUpdate(sql);
	}else{
		if(rs.getString("user_name").equals(session.getAttribute("username"))){
			i = db.execUpdate(sql);
		}
	}
}
%>
<body>
<%
if(i==1){
	sql_temp = "select a_qa_log__id.nextval as id from dual";
	//out.print(sql_temp+"<br>");
	rs_log = db.execSQL(sql_temp);
	if(rs_log.next()){
		id = rs_log.getInt("id");
	}
	rs_log.close();
	j = db.execUpdate("insert into a_qa_log(id,usr,operation,date_time,project_name,project_version,pre_uat_start_date,after_uat_start_date,pre_production_start_date,after_production_start_date)values(" + id + ",'" + session.getAttribute("username") + "','del',to_date('" + datestr + "','yyyy-mm-dd hh24:mi:ss'),'" + project_name + "','" + project_version + "',to_date('" + uat_start_date + "','yyyy-mm-dd'),'',to_date('" + production_start_date + "','yyyy-mm-dd'),'')");
	db.close();
	if(j==1){
		response.sendRedirect("project_version_manage.jsp?info=删除成功！");
	}else{
		response.sendRedirect("project_version_manage.jsp?info=删除成功！日志记录失败！");
	}
}else{
	response.sendRedirect("project_version_manage.jsp?info=删除失败！");
}
%>
</body>
</html>