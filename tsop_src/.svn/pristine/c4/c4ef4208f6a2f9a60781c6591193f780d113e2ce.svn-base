<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.QADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>项目版本新增处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%
QADBean db = new QADBean();
String sql = new String();
String sql_user = new String();
String sql_temp = new String();
ResultSet rs_user;
ResultSet rs_log;
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
String project_name = new String();
String project_version = new String();
String uat_start_date = new String();
String production_start_date = new String();
String datestr = new String();
String datestr2 = new String();

project_name = Tools.toGB(request.getParameter("project_name").trim());
project_version = Tools.toGB(request.getParameter("project_version").trim());
uat_start_date = request.getParameter("uat_start_date");
production_start_date = request.getParameter("production_start_date");
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
datestr = df.format(new java.util.Date());
datestr2 = df2.format(new java.util.Date());


//out.print(project_name+"<br>"+env_num+"<br>"+start_date+"<br>"+end_date+"<br>"+take_person+"<br>"+take_date+"<br>"+check_person+"<br>"+check_date+"<br>"+test_result+"<br>"+sample_date+"<br>");
sql = "insert into a_project_version_info(project_name,project_version,uat_start_date,production_start_date,user_name,submit_datetime)values('" + project_name + "','" + project_version + "',to_date('" + uat_start_date + "','yyyy-mm-dd'),to_date('" + production_start_date + "','yyyy-mm-dd'),'" + session.getAttribute("username") + "',to_date('" + datestr + "','yyyy-mm-dd'))";
//out.println(sql+"<br>");
i=db.execUpdate(sql);
//out.println(i+"<br>");
if(i==1){
	sql_temp = "select a_qa_log__id.nextval as id from dual";
	//out.print(sql_temp+"<br>");
	rs_log = db.execSQL(sql_temp);
	if(rs_log.next()){
		id = rs_log.getInt("id");
	}
	rs_log.close();
	j = db.execUpdate("insert into a_qa_log(id,usr,operation,date_time,project_name,project_version,pre_uat_start_date,after_uat_start_date,pre_production_start_date,after_production_start_date)values(" + id + ",'" + session.getAttribute("username") + "','add',to_date('" + datestr2 + "','yyyy-mm-dd hh24:mi:ss'),'" + project_name + "','" + project_version + "','',to_date('" + uat_start_date + "','yyyy-mm-dd'),'',to_date('" + production_start_date + "','yyyy-mm-dd'))");
	if(j==1){
		response.sendRedirect("project_version_manage.jsp?info=新增成功！");
	}else{
		response.sendRedirect("project_version_manage.jsp?info=新增成功！日志记录失败！");
	}
}else{
	response.sendRedirect("project_version_manage.jsp?info=新增失败！");
}
db.close();
%>
</body>
</html>