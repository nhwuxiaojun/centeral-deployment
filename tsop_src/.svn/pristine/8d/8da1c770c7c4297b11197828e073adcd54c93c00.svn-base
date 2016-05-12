<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>TS成员信息提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
ResultSet rs_temp;
String sql = new String();
String sql_temp = new String();
int i = 0;
int j = 0;
int id = 0;
int flag = 0;
String no = new String();
String error = new String();
String account = new String();
String name = new String();
//String cname = new String();
String mobile1 = new String();
//String mobile2 = new String();
String ext = new String();

no = request.getParameter("ENV_NO").trim();
account = request.getParameter("ENV_ACCOUNT").trim();
name = request.getParameter("ENV_NAME").trim().toLowerCase();
//cname = Tools.toGB(request.getParameter("ENV_CNAME").trim());
mobile1 = request.getParameter("ENV_MOBILE1").trim();
//mobile2 = request.getParameter("ENV_MOBILE2").trim();
ext = request.getParameter("ENV_EXT").trim();

sql = "insert into ts_member(no,account,name,mobile1,ext) values('"+no+"','"+account+"','"+name+"','"+mobile1+"','"+ext+"')";
System.out.println(sql);
try {
	i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error=e.toString();
}

System.out.println(i);
if(i==1){
	sql_temp="insert into a_user(usr,valid) values('"+account+"','1')";
	System.out.print(sql_temp);
   try {
   	j = db.execUpdate(sql_temp);
   }catch (Exception e) {
	e.printStackTrace();
   	out.println(e);
   	StringWriter sw = new java.io.StringWriter();  
   	PrintWriter pw = new java.io.PrintWriter(sw);  
   	e.printStackTrace(pw);  
   	out.println(sw.toString());  
   } finally {
	sql_temp="update a_user set valid='1' where usr='"+account+"'";
	System.out.print(sql_temp);
  	j = db.execUpdate(sql_temp);
   }
	//rs_temp2.close();
db.close();
}

if(i==1){
	response.sendRedirect("ts_member_query.jsp?info=Create Succeed!");
//	out.println("新增成功");
}else{
	response.sendRedirect("ts_member_query.jsp?info=Create Failed!"+error);
//	out.println("新增失败");
}

%>
<button onClick="history.go(-1)">返回</button>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
