<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.SYSDBADBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
String sql_apply = new String();
String sql_checkdb = new String();
String sql_ip = new String();
String shell = new String();
String shell_ex = new String();
String url = new String();
ResultSet rs;
ResultSet rs_apply;
ResultSet rs_ip;
ResultSet rs_checkdb;
//url="jdbc:oracle:thin:@172.25.13.3:1521:g133u3";
url="jdbc:oracle:thin:@172.25.14.12:1521:g12u1";
try{
	System.out.println("create db account...");
	SYSDBADBean dbadb = new SYSDBADBean(url,"sys","ebaotsdbasqw");
	Connection conn = dbadb.getConnection();
	String procedure1 = "{call p_create_user(?,?,?)}";
	CallableStatement cstmt1;
	cstmt1 = conn.prepareCall(procedure1);
	cstmt1.setString(1,"ccc");
	cstmt1.setString(2,"/oradata2/g12u1");
	cstmt1.setInt(3,500);
	cstmt1.execute();
	conn.close();
	dbadb.close();
}catch (Exception e) {
	e.printStackTrace();
}

%>
