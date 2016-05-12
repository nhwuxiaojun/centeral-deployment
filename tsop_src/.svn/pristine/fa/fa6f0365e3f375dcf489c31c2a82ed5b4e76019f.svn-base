<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>服务器硬件信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_mac_ip.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "hardware_info_add.jsp";
}
function del(){
	var id;
    var flag = 0;
	if(typeof(form2.hardware_num.length)=="undefined"){
		if(form2.hardware_num.checked){
			var a = confirm('确认要删除吗？');
			if(a==true){
				form2.action = "hardware_info_del.jsp";
				form2.submit();
			}
		}else{
        	alert("Please select!");
        	return false;
		}
	}else{
    	for(var i=0;i<form2.hardware_num.length;i++){
    		if(form2.hardware_num[i].checked==true){
				id = form2.hardware_num[i].value;
        		flag = 1;
        		break;
    		}
		}
    	if(!flag){
        	alert("Please select!");
        	return false;
    	}
		var a = confirm('确认要删除吗？');
		if(a==true){
			form2.action = "hardware_info_del.jsp";
			form2.submit();
		}
	}
}
function upd(){
	var id;
    var flag = 0;
	if(typeof(form2.hardware_num.length)=="undefined"){
		if(form2.hardware_num.checked){
			form2.action = "hardware_info_upd.jsp";
			form2.submit();
		}else{
        	alert("Please select!");
        	return false;
		}
	}else{
    	for(var i=0;i<form2.hardware_num.length;i++){
    		if(form2.hardware_num[i].checked==true){
				id = form2.hardware_num[i].value;
        		flag = 1;
        		break;
    		}
		}
    	if(!flag){
        	alert("Please select!");
        	return false;
    	}
		form2.action = "hardware_info_upd.jsp";
		form2.submit();
	}
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql2 = new String();
ResultSet rs;
ResultSet rs2;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_mac_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_hardware order by mac_ip,sys_type";
		}else{
			sql="select * from a_hardware where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,sys_type";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_hardware where upper(mac_ip) like '%"+request.getParameter("txt_mac_ip").toString().toUpperCase()+"%' order by mac_ip,sys_type";
		}else{
			sql="select * from a_hardware where upper(mac_ip) like '%"+request.getParameter("txt_mac_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,sys_type";
		}
	}
}else{
	sql="select * from a_hardware where rownum<7 order by mac_ip,sys_type";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">服务器硬件信息查询</span></strong></font>
</div>
<form name="form1" action="" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="15%">
		<select name="mac_ip" class="en">
			<option value="物理IP">物理IP</option>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("txt_mac_ip"))||request.getParameter("txt_mac_ip")==null){%>
			<input type="text" name="txt_mac_ip" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="txt_mac_ip" value="<%=request.getParameter("txt_mac_ip")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="15%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="sys_type">系统类型</option>
				<option value="svr_type">服务器类型</option>
				<option value="cpu_size">CPU大小</option>
				<option value="mem_size">内存大小</option>
				<option value="swap_size">SWAP大小</option>
			<%}else{%>
				<%if("sys_type".equals(request.getParameter("col_name"))){%>
				<option value="sys_type">系统类型</option>
				<option value="svr_type">服务器类型</option>
				<option value="cpu_size">CPU大小</option>
				<option value="mem_size">内存大小</option>
				<option value="swap_size">SWAP大小</option>
				<%}%>
				<%if("svr_type".equals(request.getParameter("col_name"))){%>
				<option value="svr_type">服务器类型</option>
				<option value="sys_type">系统类型</option>
				<option value="cpu_size">CPU大小</option>
				<option value="mem_size">内存大小</option>
				<option value="swap_size">SWAP大小</option>
				<%}%>
				<%if("cpu_size".equals(request.getParameter("col_name"))){%>
				<option value="cpu_size">CPU大小</option>
				<option value="sys_type">系统类型</option>
				<option value="svr_type">服务器类型</option>
				<option value="mem_size">内存大小</option>
				<option value="swap_size">SWAP大小</option>
				<%}%>
				<%if("mem_size".equals(request.getParameter("col_name"))){%>
				<option value="mem_size">内存大小</option>
				<option value="sys_type">系统类型</option>
				<option value="svr_type">服务器类型</option>
				<option value="cpu_size">CPU大小</option>
				<option value="swap_size">SWAP大小</option>
				<%}%>
				<%if("swap_size".equals(request.getParameter("col_name"))){%>
				<option value="swap_size">SWAP大小</option>
				<option value="sys_type">系统类型</option>
				<option value="svr_type">服务器类型</option>
				<option value="cpu_size">CPU大小</option>
				<option value="mem_size">内存大小</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="30%"><input type="button" name="button1" value="查询" class="en" onClick="check()">
		<%sql2="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
		<%rs2=db.execSQL(sql2);%>
		<%while(rs2.next()){%>
  			<%if("2".equals(rs2.getString("valid"))){%>
				&nbsp;<input type="button" name="button2" value="新增" class="en" onClick="add()">&nbsp;<input type="button" name="button3" value="删除" class="en" onClick="del()">&nbsp;<input type="button" name="button4" value="修改" class="en" onClick="upd()">
			<%}else{%>

			<%}%>
		<%}%>
        </td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<form name="form2" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="11%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>系统类型</strong></font></td>
	  <td align="center" class="en" width="22%"><font color="#3333cc"><strong>Cpu大小</strong></font></td>
	  <td align="center" class="en" width="7%"><font color="#3333cc"><strong>内存大小</strong></font></td>
	  <td align="center" class="en" width="16%"><font color="#3333cc"><strong>硬盘总大小</strong></font></td>
	  <td align="center" class="en" width="14%"><font color="#3333cc"><strong>详细</strong></font></td>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>操作</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("SYS_TYPE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("CPU_SIZE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MEM_SIZE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DISK_SIZE")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="hardware_detail.jsp?mac_ip=<%=rs.getString("MAC_IP")%>&host_name=<%=rs.getString("HOST_NAME")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
      <td align="center" class="en"><font color="#3333cc">&nbsp;<input type="radio" name="hardware_num" value="<%=rs.getString("MAC_IP")%>@<%=rs.getString("HOST_NAME")%>">&nbsp;</font></td>
	</tr>
	<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<%rs2.close();%>
</body>
</html>
