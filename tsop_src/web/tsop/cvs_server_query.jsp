<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>CVS环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_env_name.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
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
	if("".equals(request.getParameter("txt_env_name"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_cvs_svr order by env_name,repo_name order by mac_ip,env_name";
		}else{
			sql="select * from a_cvs_svr where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by mac_ip,env_name";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_cvs_svr where upper(env_name) like '%"+request.getParameter("txt_env_name").toString().toUpperCase()+"%'  order by mac_ip,env_name";
		}else{
			sql="select * from a_cvs_svr where upper(env_name) like '%"+request.getParameter("txt_env_name").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'  order by mac_ip,env_name";
		}
	}
}else{
	sql="select * from a_cvs_svr where rownum<11 order by mac_ip,env_name";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">CVS环境信息查询</span></strong></font>
</div>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="env_name" class="en">
			<option value="项目环境名">项目环境名</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_env_name"))||request.getParameter("txt_env_name")==null){%>
			<input type="text" name="txt_env_name" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_env_name" value="<%=request.getParameter("txt_env_name")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">物理IP</option>
				<option value="module_name">模块名称</option>
				<option value="module_state">模块运行状态</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="module_name">模块名称</option>
				<option value="module_state">模块运行状态</option>
				<%}%>
				<%if("module_name".equals(request.getParameter("col_name"))){%>
				<option value="module_name">模块名称</option>
				<option value="mac_ip">物理IP</option>
				<option value="module_state">模块运行状态</option>
				<%}%>
				<%if("module_state".equals(request.getParameter("col_name"))){%>
				<option value="module_state">模块运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="module_name">模块名称</option>
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
<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="18%" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="24%" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="26%"><font color="#3333cc"><strong>模块名称</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>属组名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>详细</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_NAME")%>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MODULE_NAME")%>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("GROUP_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="../ts_query/cvs_server_detail.jsp?repo_name=<%=rs.getString("REPO_NAME")%>&module_name=<%=rs.getString("MODULE_NAME")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	</tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
