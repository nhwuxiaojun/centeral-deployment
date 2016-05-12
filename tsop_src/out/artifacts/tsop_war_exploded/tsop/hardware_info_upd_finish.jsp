<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>服务器硬件提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();

String MAC_IP = new String();
String HOST_NAME = new String();
String ROOT = new String();
String PWD = new String();
String SYS_TYPE = new String();
String SVR_TYPE = new String();
String CPU_SIZE = new String();
String MEM_SIZE = new String();
String DISK_COUNT = new String();
String DISK_SIZE = new String();
String SWAP_SIZE = new String();
String OTHERS = new String();
String MAX_MEM_NUM = new String();
String MAX_DISK_NUM = new String();
String TYPE = new String();
String DESK_NO = new String();


MAC_IP = Tools.toGB(request.getParameter("MAC_IP")).trim();
HOST_NAME = Tools.toGB(request.getParameter("HOST_NAME")).trim();
ROOT = Tools.toGB(request.getParameter("ROOT")).trim();
PWD = Tools.toGB(request.getParameter("PWD")).trim();
SYS_TYPE = Tools.toGB(request.getParameter("SYS_TYPE")).trim();
SVR_TYPE = Tools.toGB(request.getParameter("SVR_TYPE")).trim();
CPU_SIZE = Tools.toGB(request.getParameter("CPU_SIZE")).trim();
MEM_SIZE = Tools.toGB(request.getParameter("MEM_SIZE")).trim();
DISK_COUNT = Tools.toGB(request.getParameter("DISK_COUNT")).trim();
DISK_SIZE = Tools.toGB(request.getParameter("DISK_SIZE")).trim();
SWAP_SIZE = Tools.toGB(request.getParameter("SWAP_SIZE")).trim();
OTHERS = Tools.toGB(request.getParameter("OTHERS")).trim();
MAX_MEM_NUM = Tools.toGB(request.getParameter("MAX_MEM_NUM")).trim();
MAX_DISK_NUM = Tools.toGB(request.getParameter("MAX_DISK_NUM")).trim();
TYPE = Tools.toGB(request.getParameter("TYPE")).trim();
DESK_NO = Tools.toGB(request.getParameter("DESK_NO")).trim();

sql = "update a_hardware set root = '" + ROOT + "',pwd = '" + PWD + "',sys_type = '" + SYS_TYPE + "',svr_type = '" + SVR_TYPE + "',cpu_size = '" + CPU_SIZE + "',mem_size = '" + MEM_SIZE + "',disk_count = '" + DISK_COUNT + "',disk_size = '" + DISK_SIZE + "',swap_size = '" + SWAP_SIZE + "',others = '" + OTHERS + "',max_mem_num = " + MAX_MEM_NUM + ",max_disk_num = " + MAX_DISK_NUM + ",type = '" + TYPE + "',desk_no = '" + DESK_NO + "' where mac_ip = '" + MAC_IP + "' and host_name = '" + HOST_NAME + "'";


i = db.execUpdate(sql);
//out.print(sql);
if(i==1){
	response.sendRedirect("hardware_info_query.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("hardware_info_query.jsp?info=Update Failed!");
}
%>


<jsp:include page="includes/copyright.jsp" /></body>
</html>
