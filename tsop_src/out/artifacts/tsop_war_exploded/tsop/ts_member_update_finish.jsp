<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
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
String old_no = new String();
String account = new String();
String name = new String();
//String cname = new String();
String mobile1 = new String();
//String mobile2 = new String();
String ext = new String();

no = request.getParameter("ENV_NO").trim();
old_no = request.getParameter("OLD_ENV_NO").trim();
account = request.getParameter("ENV_ACCOUNT").trim();
name = request.getParameter("ENV_NAME").trim();
//cname = Tools.toGB(request.getParameter("ENV_CNAME").trim());
mobile1 = request.getParameter("ENV_MOBILE1").trim();
//mobile2 = request.getParameter("ENV_MOBILE2").trim();
ext = request.getParameter("ENV_EXT").trim();
out.println(no);

String error=new String();
String sql1 = "update ts_proj set owner1='"+no+"' where owner1='"+old_no+"'";
String sql2 = "update ts_proj set owner2='"+no+"' where owner2='"+old_no+"'";
System.out.println(sql1);
System.out.println(sql2);
try {
i = db.execUpdate(sql1);
i = db.execUpdate(sql2);
} catch (Exception e) {
        e.printStackTrace();
        error=e.toString();
}

sql = "update ts_member set no='"+no+"',account='"+account+"',name='"+name+"',mobile1='"+mobile1+"',ext='"+ext+"' where no='"+old_no+"'";
//sql = "insert into ts_member(no,account,name,cname,mobile1,mobile2,ext) values('"+no+"','"+account+"','"+name+"','"+cname+"','"+mobile1+"','"+mobile2+"','"+ext+"')";
System.out.println(sql);
try {
i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error=e.toString();
}

db.close();

if(i==1){
	response.sendRedirect("ts_member_query.jsp?info=Update Succeed!");
//	out.println("新增成功");
}else{
	response.sendRedirect("ts_member_query.jsp?info=Update Failed!"+error);
//	out.println("新增失败");
}

%>
<button>返回</button>
<jsp:include page="includes/copyright.jsp" /></body>
</html>

