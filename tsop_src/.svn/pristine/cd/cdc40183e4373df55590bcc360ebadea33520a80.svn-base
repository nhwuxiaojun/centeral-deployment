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
//String tmp_id=new String();
String proj_name=new String();
String proj_id=new String();
String print_ip=new String();
String PRINT_USER=new String();
String PRINT_PWD=new String();
String OS_TYPE=new String();
String error_info=new String();

//tmp_id=request.getParameter("print_id");
proj_name = request.getParameter("proj_name").trim();
proj_id = request.getParameter("proj_id").trim();
print_ip = request.getParameter("print_ip").trim();
PRINT_USER = request.getParameter("PRINT_USER").trim();
PRINT_PWD = request.getParameter("PRINT_PWD").trim();
OS_TYPE = request.getParameter("OS_TYPE").trim();

try {
//    sql = "insert into ts_print(print_id,print_ip,print_user,print_pwd,proj_id,os_type,proj_name) values(s_print__id.nextval,'"+print_ip+"','"+PRINT_USER+"','"+PRINT_PWD+"','"+proj_id+"','"+OS_TYPE+"','"+proj_name+"')";
    sql = "insert into ts_print(print_id,print_ip,print_user,print_pwd,proj_id,os_type,proj_name,updated_by) values(s_print__id.nextval,'"+print_ip+"','"+PRINT_USER+"','"+PRINT_PWD+"','"+proj_id+"','"+OS_TYPE+"','"+proj_name+"','"+session.getAttribute("username")+"')";
    System.out.print(sql);
    i = db.execUpdate(sql);

} catch (Exception e) {  
        e.printStackTrace();
	error_info=e.toString();
}

if(i==1){
	out.println("<script>alert('Print server info add successfully!');window.close();</script>"); 	
}else{
	out.println("<h4>"+error_info+"</h4>");	
	out.println("<button name='close' onClick='window.close();'>Close</button>");	
	out.println("<button name='Back' onClick='history.go(-1);'>Back</button>");	
}
%>
<%
  db.close();
%>
</body>
</html>
