<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<title>申请答复流程修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();

int i = 0;

String host_id = Tools.toGB(request.getParameter("host_id").trim());   
String host_ip = Tools.toGB(request.getParameter("host_ip").trim());   
String asset = Tools.toGB(request.getParameter("asset").trim());     
String proj_name = Tools.toGB(request.getParameter("proj_name").trim());     
String proj_code = Tools.toGB(request.getParameter("proj_code").trim());  
String purpose = Tools.toGB(request.getParameter("purpose").trim());    
String ts_owner = Tools.toGB(request.getParameter("ts_owner").trim()); 
String apply_owner  = Tools.toGB(request.getParameter("apply_owner").trim());   
String admin_user  = Tools.toGB(request.getParameter("admin_user").trim()); 
String pwd  = Tools.toGB(request.getParameter("pwd").trim());   
String sys_type  = Tools.toGB(request.getParameter("sys_type").trim()); 
String cpu_size  = Tools.toGB(request.getParameter("cpu_size").trim());   
String mem_size  = Tools.toGB(request.getParameter("mem_size").trim());  
String disk_size  = Tools.toGB(request.getParameter("disk_size").trim());  
String vm_mac_ip  = Tools.toGB(request.getParameter("vm_mac_ip").trim());  
String location  = Tools.toGB(request.getParameter("location").trim());   
String note  = Tools.toGB(request.getParameter("note").trim());   
String status  = Tools.toGB(request.getParameter("status").trim());  
String server_type  = Tools.toGB(request.getParameter("server_type").trim());   



sql = "update a_pc_info set host_ip = '" + host_ip + "',asset = '" + asset + "',proj_name = '" + proj_name + "',proj_code = '" + proj_code + "',purpose = '" + purpose + "',ts_owner = '" + ts_owner + "',apply_owner = '" + apply_owner +"',admin_user = '" + admin_user +"',pwd = '" + pwd +"',sys_type = '" + sys_type +"',cpu_size = '" + cpu_size +"',mem_size = '" + mem_size +"',disk_size = '" + disk_size +"',vm_mac_ip = '" + vm_mac_ip +"',location = '" + location +"',note = '" + note +"',status = '" + status +"',server_type = '" + server_type +"' where host_id = " + host_id;

out.println(sql + "<br>");

i = db.execUpdate(sql);

out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("pc_list.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("pc_list.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
