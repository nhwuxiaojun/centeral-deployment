<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Demo应用环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_env_ip.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "env_info_demo_add.jsp";
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
ResultSet rs;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_env_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql = "select * from a_proj_demo_svr order by mac_ip";
		}else{
			sql = "select * from a_proj_demo_svr where upper("+request.getParameter("col_name").toString()+") like '%" + request.getParameter("col_value").toString().toUpperCase() + "%' order by mac_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql = "select * from a_proj_demo_svr where upper(demo_app_ip) like '%" + request.getParameter("txt_env_ip").toString().toUpperCase() + "%' order by mac_ip";
		}else{
			sql = "select * from a_proj_demo_svr where upper(demo_app_ip) like '%" + request.getParameter("txt_env_ip").toString().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().toUpperCase() + "%' order by mac_ip";
		}
	}
}else{
	sql = "select * from a_proj_demo_svr where rownum<11 order by mac_ip";
}
//out.print(sql + "<br>");
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Demo应用环境信息查询</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="env_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_env_ip"))||request.getParameter("txt_env_ip")==null){%>
			<input type="text" name="txt_env_ip" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">主机IP</option>
				<option value="proj_name">项目环境名</option>
				<option value="demo_status">环境运行状态</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">主机IP</option>
				<option value="proj_name">项目环境名</option>
				<option value="demo_status">环境运行状态</option>
				<%}%>
				<%if("proj_name".equals(request.getParameter("col_name"))){%>
				<option value="proj_name">项目环境名</option>
				<option value="mac_ip">主机IP</option>
				<option value="demo_status">环境运行状态</option>
				<%}%>
				<%if("demo_status".equals(request.getParameter("col_name"))){%>
				<option value="demo_status">环境运行状态</option>
				<option value="mac_ip">主机IP</option>
				<option value="proj_name">项目环境名</option>
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
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()">&nbsp;&nbsp;<input type="button" name="button2" value="新增" class="en" onClick="add()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>主机IP</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>环境应用IP</strong></font></td>
	  <td width="20%" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>  
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>修改</strong></font></td> 
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_APP_IP")%>&nbsp;</font></td>
	  <%if(rs.getString("PROJ_NAME")==null||"".equals(rs.getString("PROJ_NAME"))){%>
	  	<td align="center" class="en"><font color="#3333cc">&nbsp;&nbsp;</font></td>
	  <%}else{%>
	  	<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_NAME")%>&nbsp;</font></td>
	  <%}%>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_STATUS")%>&nbsp;</font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="env_info_demo_detail.jsp?id=<%=rs.getInt("id")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <%if(rs.getString("demo_signer").equals(session.getAttribute("username").toString())){%>
	  	<td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="env_info_demo_del.jsp?id=<%=rs.getInt("id")%>"><font color="#3333cc">删除</font></a>&nbsp;</td>
	  <%}else{%>
	  	<td align="center" bgcolor="#FCFCFC" class="en">&nbsp;&nbsp;</td>
	  <%}%>
	  <%if(rs.getString("demo_signer").equals(session.getAttribute("username").toString())){%>
	  	<td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="env_info_demo_upd.jsp?id=<%=rs.getInt("id")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <%}else{%>
	  	<td align="center" bgcolor="#FCFCFC" class="en">&nbsp;&nbsp;</td>
	  <%}%>
  </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
