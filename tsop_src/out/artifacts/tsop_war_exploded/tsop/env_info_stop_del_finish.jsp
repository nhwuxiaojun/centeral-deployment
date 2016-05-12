<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<html>
<head>
<title>应用环境信息删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
String db_ip = new String();
String db_sid = new String();
String db_port_num = new String();
String db_user = new String();
String db_user_type = new String();
String url = new String();
ResultSet rs_temp = null;
int i = 0;
sql_temp = "select * from a_db_svr where db_id = " + request.getParameter("id");
rs_temp = db.execSQL(sql_temp);
if(rs_temp.next()){
	db_user = rs_temp.getString("db_user");
	db_user_type = rs_temp.getString("db_user_type");
	db_ip = rs_temp.getString("db_ip");
	db_sid = rs_temp.getString("db_sid");
	db_port_num = String.valueOf(rs_temp.getInt("db_port_num"));
}
url = "jdbc:oracle:thin:@" + db_ip + ":" + db_port_num + ":" + db_sid;
//out.print(url + "<br>");
//sql = "update a_db_svr set db_status = 'deleted' where db_id = " + request.getParameter("id");
sql = "delete from a_db_svr where db_id = " + request.getParameter("id");
//out.print(sql + "<br>");
System.out.println(sql);
i = db.execUpdate(sql);
try{
	DBADBean dbadb = new DBADBean(url,"dbadmin","dbadmin");
	Connection conn = dbadb.getConnection();
	String procedure1 = "{call p_delete_user(?,?)}";
	CallableStatement cstmt1;
	cstmt1 = conn.prepareCall(procedure1);
	cstmt1.setString(1,db_user);
	cstmt1.setString(2,db_user_type);
   	cstmt1.execute();
	conn.close();
	dbadb.close();
}catch (Exception e) {
	e.printStackTrace();
}
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("env_info_stop_del.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("env_info_stop_del.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
