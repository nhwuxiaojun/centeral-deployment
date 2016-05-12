<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>服务器硬件新增处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String proj_name=new String();
String proj_code=new String();
String FTP_USER=new String();
String FTP_PASSWD=new String();
String FTP_TYPE=new String();
String FTP_DIR=new String();
String COMMENTS=new String();
String error_info=new String();

FTP_DIR = request.getParameter("FTP_DIR").trim();
COMMENTS= request.getParameter("COMMENTS").trim();
FTP_TYPE = request.getParameter("FTP_TYPE").trim();
FTP_USER = request.getParameter("FTP_USER").trim();
FTP_PASSWD = request.getParameter("FTP_PASSWD").trim();
proj_name = request.getParameter("proj_name").trim();
proj_code = request.getParameter("proj_code").trim();
sql_temp = "select * from a_ftp_info where proj_code = '" + proj_name + "'";
System.out.print(sql_temp);
try {
	rs = db.execSQL(sql_temp);
} catch (Exception e) {
        e.printStackTrace();
	error_info=e.toString();
}

if(rs.next()){
	out.println("<script>alert('FTP Account existed for project "+proj_name+"!');history.go(-1);</Script>"); 	
	System.out.print("existed"+proj_name+proj_code);
}else
sql = "insert into a_ftp_info(ftp_id,proj_name,proj_code,username,ftp_password,ftp_type,ftp_dir,comments) values(s_ftp_info__id.nextval,'"+ proj_name + "','" + proj_code + "','" + FTP_USER + "','" + FTP_PASSWD + "','" + FTP_TYPE + "','" + FTP_DIR + "','" + COMMENTS + "')";
System.out.print(sql);
    try {
	i = db.execUpdate(sql);
    } catch (Exception e) {  
        e.printStackTrace();
	error_info=e.toString();
    }
if(i==1){
//	response.sendRedirect("hardware_info_query.jsp?info=Create Succeed!");
//o	response.write("<script language=\"javascript\">window.opener=null;window.close();</script>");
	out.println("<script>alert('FTP Account create Succeed!');window.close();</Script>"); 	
}else{
//	response.sendRedirect("hardware_info_query.jsp?info=Create Failed!<br>"+error_info);
	out.println(error_info);	
	out.println("<button onClick=javascript: history.go(-1)>");	
}
rs.close();
db.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
