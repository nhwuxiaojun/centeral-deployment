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
String error_info = new String();


MAC_IP = request.getParameter("MAC_IP").trim();
HOST_NAME = request.getParameter("HOST_NAME").trim();
ROOT = request.getParameter("ROOT").trim();
PWD = request.getParameter("PWD").trim();
SYS_TYPE = request.getParameter("SYS_TYPE").trim();
SVR_TYPE = request.getParameter("SVR_TYPE").trim();
CPU_SIZE = request.getParameter("CPU_SIZE").trim();
MEM_SIZE = request.getParameter("MEM_SIZE").trim();
DISK_COUNT = request.getParameter("DISK_COUNT").trim();
DISK_SIZE = request.getParameter("DISK_SIZE").trim();
SWAP_SIZE = request.getParameter("SWAP_SIZE").trim();
OTHERS = request.getParameter("OTHERS").trim();
MAX_MEM_NUM = request.getParameter("MAX_MEM_NUM").trim();
MAX_DISK_NUM = request.getParameter("MAX_DISK_NUM").trim();
TYPE = request.getParameter("TYPE").trim();
DESK_NO = request.getParameter("DESK_NO").trim();
sql_temp = "select * from a_hardware where MAC_IP = '" + MAC_IP + "' and HOST_NAME = '" + HOST_NAME + "'";
System.out.print(sql_temp);
rs = db.execSQL(sql_temp);
%>

<%if(rs.next()){%>
	<script language="JavaScript">
		alert("服务器硬件已存在！");
		window.location = "hardware_info_query.jsp";
	</script>
<%}else{%>

<%
sql = "insert into a_hardware(mac_ip,host_name,root,pwd,sys_type,svr_type,cpu_size,mem_size,disk_count,disk_size,swap_size,others,max_mem_num,max_disk_num,type,desk_no) values('" + MAC_IP + "','" + HOST_NAME + "','" + ROOT + "','" + PWD + "','" + SYS_TYPE + "','" + SVR_TYPE + "','" + CPU_SIZE + "','" + MEM_SIZE + "','" + DISK_COUNT + "','" + DISK_SIZE + "','" + SWAP_SIZE + "','" + OTHERS + "'," + MAX_MEM_NUM + "," + MAX_DISK_NUM + ",'" + TYPE + "','" + DESK_NO + "')";
System.out.print(sql);
    try {
i = db.execUpdate(sql);
    } catch (Exception e) {  
        e.printStackTrace();
	error_info=e.toString();
    }
if(i==1){
	response.sendRedirect("hardware_info_query.jsp?info=Create Succeed!");
}else{
	response.sendRedirect("hardware_info_query.jsp?info=Create Failed!<br>"+error_info);
}
%>
<%}%>
<%
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
