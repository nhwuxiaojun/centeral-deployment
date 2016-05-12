<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>环境登陆权限查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_app_ip.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
</script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
ResultSet rs2;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_app_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) order by staff_name,guest_ip,mac_ip,app_ip";
		}else{
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper(app_ip) like '%"+request.getParameter("txt_app_ip").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}else{
			sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where upper(app_ip) like '%"+request.getParameter("txt_app_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by staff_name,guest_ip,mac_ip,app_ip";
		}
	}
}else{
	sql="select * from (select b.staff_name,b.guest_ip,a.mac_ip,b.app_ip,b.privi_type from a_proj_env_svr a, a_env_access_privi b where trim(b.app_ip) = trim(a.env_ip) union select b.staff_name,b.guest_ip,null as mac_ip,b.app_ip,b.privi_type from a_env_access_privi b where not exists (select * from a_proj_env_svr a where trim(b.app_ip) = trim(a.env_ip))) where rownum<11 order by staff_name,guest_ip,mac_ip,app_ip";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境登陆权限查询</span></strong></font>
</div>
<br><br>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="app_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_app_ip"))||request.getParameter("txt_app_ip")==null){%>
			<input type="text" name="txt_app_ip" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_app_ip" value="<%=request.getParameter("txt_app_ip")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="staff_name">员工姓名</option>
				<option value="guest_ip">客户IP</option>
			<%}else{%>
				<%if("staff_name".equals(request.getParameter("col_name"))){%>
				<option value="staff_name">员工姓名</option>
				<option value="guest_ip">客户IP</option>
				<%}%>
				<%if("guest_ip".equals(request.getParameter("col_name"))){%>
				<option value="guest_ip">客户IP</option>
				<option value="staff_name">员工姓名</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql="select * from a_user where usr='test'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>员工姓名</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>客户IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>权限访问类型</strong></font></td>
  </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("STAFF_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("GUEST_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("APP_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PRIVI_TYPE")%>&nbsp;</font></td>
	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td width="25%" align="center" class="en"><font color="#3333cc"><strong>员工姓名</strong></font></td>
	  <td width="25%" align="center" class="en"><font color="#3333cc"><strong>客户IP</strong></font></td>
	  <td width="25%" align="center" class="en"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td width="25%" align="center" class="en"><font color="#3333cc"><strong>权限访问类型</strong></font></td>
  </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("STAFF_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("GUEST_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("APP_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PRIVI_TYPE")%>&nbsp;</font></td>
	</tr>
	<%}%>
  <%}%>
<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
