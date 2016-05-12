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
<body>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String tmp_id=new String();
String proj_name=new String();
String proj_id=new String();
String print_ip=new String();
String PRINT_USER=new String();
String PRINT_PWD=new String();
String OS_TYPE=new String();
String error_info=new String();

try {
tmp_id=request.getParameter("print_id");
proj_name = request.getParameter("proj_name").trim();
proj_id = request.getParameter("proj_id").trim();
print_ip = request.getParameter("print_ip").trim();
PRINT_USER = request.getParameter("PRINT_USER").trim();
PRINT_PWD = request.getParameter("PRINT_PWD").trim();
OS_TYPE = request.getParameter("OS_TYPE").trim();

sql_temp = "select * from ts_print where print_id = " + tmp_id + "";
System.out.print(sql_temp);
	rs = db.execSQL(sql_temp);
} catch (Exception e) {
        e.printStackTrace();
	error_info=e.toString();
	out.println(error_info);
}
%>

<%if(rs.next()){%>

<%
sql = "update ts_print set proj_name='"+proj_name+"',print_ip='"+print_ip+"',print_user='"+PRINT_USER+"',print_pwd='"+PRINT_PWD+"',os_type='"+OS_TYPE+"',updated_by='"+session.getAttribute("username")+"' where print_id="+tmp_id;
System.out.print(sql);
    try {
	i = db.execUpdate(sql);
    } catch (Exception e) {  
        e.printStackTrace();
	error_info=e.toString();
    }
if(i==1){
	out.println("<script>alert('Print server info update succeed!');window.close();</Script>"); 	
}else{
	out.println(error_info);	
	out.println("<button onClick=javascript: history.go(-1)>");	
}
%>
<%}%>
<%
db.close();
rs.close();
%>
</body>
</html>
