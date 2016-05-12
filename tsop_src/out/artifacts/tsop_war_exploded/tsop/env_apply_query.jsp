<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>环境申请表查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_proj_env.value==""&&form1.col_value.value==""){
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
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_proj_env"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_name order by proj_env,proj_grp";
		}else{
			sql="select * from a_proj_env_name where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by proj_env,proj_grp";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_name where upper(proj_env) like '%"+request.getParameter("txt_proj_env").toString().toUpperCase()+"%' order by proj_env,proj_grp";
		}else{
			sql="select * from a_proj_env_name where upper(proj_env) like '%"+request.getParameter("txt_proj_env").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by proj_env,proj_grp";
		}
	}
}else{
	sql="select * from a_proj_env_name where rownum<11 order by proj_env,proj_grp";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境申请表查询</span></strong></font>
</div>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="proj_env" class="en">
			<option value="项目环境名">项目环境名</option>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_proj_env"))||request.getParameter("txt_proj_env")==null){%>
			<input type="text" name="txt_proj_env" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_proj_env" value="<%=request.getParameter("txt_proj_env")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
			<%}else{%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">环境运行状态</option>
				<option value="proj_grp">项目环境属组</option>
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
	<tr bgcolor="#D2D2D2">
	  <td width="17%" align="center" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td width="20%" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>环境项目属组</strong></font></td>
	  <td width="22%" align="center" class="en"><font color="#3333cc"><strong>环境申请人</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td width="21%" align="center" class="en"><font color="#3333cc"><strong>详细</strong></font></td>
  </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_GRP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROPOSER")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="../ts_query/env_apply_detail.jsp?proj_env=<%=rs.getString("PROJ_ENV")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
  	</tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
