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
<title>PC机新增提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();

String sql_temp = new String();
String sql = new String();

ResultSet rs;


String host_ip = Tools.toGB(request.getParameter("host_ip").trim());   
String asset = Tools.toGB(request.getParameter("asset").trim());     

//String proj_name = Tools.toGB(request.getParameter("proj_name").trim());     
//String proj_code = Tools.toGB(request.getParameter("proj_code").trim());  
  
//String purpose = Tools.toGB(request.getParameter("purpose").trim());    
//String ts_owner = Tools.toGB(request.getParameter("ts_owner").trim()); 

//String apply_owner  = Tools.toGB(request.getParameter("apply_owner").trim());   
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

   
int i = 0;     
int id = 0;  

  sql_temp = "select a_apply__id.nextval as id from dual";
  rs = db.execSQL(sql_temp);
  if(rs.next()){
	id = rs.getInt("id"); 
  }
  rs.close();

    sql= " insert into  a_pc_info(host_id,host_ip,admin_user,pwd,sys_type,cpu_size,mem_size,disk_size,vm_mac_ip,location,note,status,asset,server_type) values(" + id + ",'" + host_ip + "','"  + admin_user + "','" + pwd + "','" + sys_type + "','" +cpu_size+ "','" + mem_size + "','" + disk_size + "','" + vm_mac_ip + "','" + location +  "','" + note +  "','"+ status +  "','" + asset +"','"+server_type+"')";

	i = db.execUpdate(sql);

	if(i==1){
		response.sendRedirect("pc_list.jsp?info=Create Succeed!");
	}else{
		db.close();
		response.sendRedirect("pc_list.jsp?info=Create Failed!");
	}

%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
