<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>Finish Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String ftp_id=new String();
String proj_name=new String();
String proj_code=new String();
String FTP_USER=new String();
String FTP_PASSWD=new String();
String FTP_TYPE=new String();
String FTP_DIR=new String();
String COMMENTS=new String();
String error_info=new String();

ftp_id=request.getParameter("ftp_id");
FTP_DIR = request.getParameter("FTP_DIR").trim();
COMMENTS= request.getParameter("COMMENTS").trim();
FTP_TYPE = request.getParameter("FTP_TYPE").trim();
FTP_USER = request.getParameter("FTP_USER").trim();
FTP_PASSWD = request.getParameter("FTP_PASSWD").trim();
proj_name = request.getParameter("proj_name").trim();
proj_code = request.getParameter("proj_code").trim();
sql_temp = "select * from a_ftp_info where ftp_id = " + ftp_id + "";
System.out.print(sql_temp);
try {
rs = db.execSQL(sql_temp);
} catch (Exception e) {
        e.printStackTrace();
	error_info=e.toString();
}
%>

<%if(rs.next()){%>

<%
sql = "update a_ftp_info set proj_name='"+proj_name+"',proj_code='"+proj_code+"',username='"+FTP_USER+"',ftp_password='"+FTP_PASSWD+"',ftp_type='"+FTP_TYPE+"',ftp_dir='"+FTP_DIR+"',comments='"+COMMENTS +"' where ftp_id="+ftp_id;
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
out.println("<script>alert('FTP info update succeed!');window.close();</Script>"); 	
}else{
//	response.sendRedirect("hardware_info_query.jsp?info=Create Failed!<br>"+error_info);
	out.println(error_info);	
	out.println("<button onClick=javascript: history.go(-1)>");	
}
%>
<%}%>
<%
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
