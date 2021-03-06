<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>Demo环境表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
ResultSet rs;
int i = 0;

String mac_ip = new String();
String os_usr = new String();
String os_pwd = new String();
String proj_name = new String();
String proj_ver = new String();
String demo_loc = new String();
String demo_app_ip = new String();
String demo_db_ip = new String();
String demo_intra_web = new String();
String demo_outer_web = new String();
String demo_create_time = new String();
String demo_status = new String();
String demo_signer = new String();
String demo_note = new String();
String demo_app_edi = new String();
String demo_db_edi = new String();

mac_ip = Tools.toGB(request.getParameter("MAC_IP").trim());
os_usr = Tools.toGB(request.getParameter("OS_USR").trim());
os_pwd = Tools.toGB(request.getParameter("OS_PWD").trim());
proj_name = Tools.toGB(request.getParameter("PROJ_NAME").trim());
proj_ver = Tools.toGB(request.getParameter("PROJ_VER").trim());
demo_loc = Tools.toGB(request.getParameter("DEMO_LOC").trim());
demo_app_ip = Tools.toGB(request.getParameter("DEMO_APP_IP").trim());
demo_db_ip = Tools.toGB(request.getParameter("DEMO_DB_IP").trim());
demo_intra_web = Tools.toGB(request.getParameter("DEMO_INTRA_WEB").trim());
demo_outer_web = Tools.toGB(request.getParameter("DEMO_OUTER_WEB").trim());
demo_create_time = Tools.toGB(request.getParameter("DEMO_CREATE_TIME").trim());
demo_status = Tools.toGB(request.getParameter("DEMO_STATUS").trim());
demo_note = Tools.toGB(request.getParameter("DEMO_NOTE").trim());
demo_app_edi = Tools.toGB(request.getParameter("DEMO_APP_EDI").trim());
demo_db_edi = Tools.toGB(request.getParameter("DEMO_DB_EDI").trim());

//out.print(mac_ip + "<br>" + os_usr + "<br>" + os_pwd + "<br>" + proj_name + "<br>" + proj_ver + "<br>" + demo_loc + "<br>" + demo_app_ip + "<br>" + demo_db_ip + "<br>" + demo_intra_web + "<br>" + demo_outer_web + "<br>" + demo_create_time + "<br>" + demo_status + "<br>" + demo_note + "<br>" + demo_app_edi + "<br>" + demo_db_edi + "<br>");

sql = "select * from a_proj_demo_svr where id = " + request.getParameter("id");
rs = db.execSQL(sql);
while(rs.next()){
	demo_signer = rs.getString("DEMO_SIGNER");
}

if(demo_signer.equals(session.getAttribute("username"))){
	sql = "update a_proj_demo_svr set mac_ip = '" + mac_ip + "',os_usr = '" + os_usr + "',os_pwd = '" + os_pwd + "',proj_name = '" + proj_name + "',proj_ver = '" + proj_ver + "',demo_loc = '" + demo_loc + "',demo_app_ip = '" + demo_app_ip + "',demo_db_ip = '" + demo_db_ip + "',demo_intra_web = '" + demo_intra_web + "',demo_outer_web = '" + demo_outer_web + "',demo_create_time = to_date('" + demo_create_time + "','yyyy-MM-dd'),demo_status = '" + demo_status + "',demo_note = '" + demo_note + "',demo_app_edi = '" + demo_app_edi + "',demo_db_edi = '" + demo_db_edi + "' where id = " + request.getParameter("id");
	//out.println(sql + "<br>");
	i = db.execUpdate(sql);
	//out.println(i + "<br>");
}
if(i==1){
	response.sendRedirect("env_info_demo_query.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("env_info_demo_query.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
