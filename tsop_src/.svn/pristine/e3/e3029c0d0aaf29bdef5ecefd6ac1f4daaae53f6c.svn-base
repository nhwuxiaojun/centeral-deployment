<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>现场备份检查环境表修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_project_name.value==""&&form1.txt_env_name.value==""){
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
	if("".equals(request.getParameter("txt_project_name"))){
		if("".equals(request.getParameter("txt_env_name"))){
			sql="select * from a_env_bak order by project_name";
		}else{
			sql="select * from a_env_bak where upper(evn_name) like '%"+Tools.toGB(request.getParameter("txt_evn_name").toString()).toUpperCase()+"%' order by project_name";
		}
	}else{
		if("".equals(request.getParameter("txt_env_name"))){
			sql="select * from a_env_bak where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' order by project_name";
		}else{
			sql="select * from a_env_bak where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' and upper(env_name) like '%"+Tools.toGB(request.getParameter("txt_env_name").toString()).toUpperCase()+"%' order by project_name";
		}
	}
}else{
	sql="select * from a_env_bak where rownum<11 order by project_name";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">现场备份检查环境表修改</span></strong></font>
</div>
<form name="form1" action="" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
<div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		项目名称
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_project_name"))||request.getParameter("txt_project_name")==null){%>
			<input type="text" name="txt_project_name" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_project_name" value="<%=Tools.toGB(request.getParameter("txt_project_name"))%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		环境名称
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("txt_env_name"))||request.getParameter("txt_env_name")==null){%>
			<input type="text" name="txt_env_name" value="" class="en">
		<%}else{%>
			<input type="text" name="txt_env_name" value="<%=Tools.toGB(request.getParameter("txt_env_name"))%>" class="en">
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
	  <td align="center" class="en" width="34%"><font color="#3333cc"><strong>项目名称</strong></font></td>
	  <td align="center" class="en" width="34%"><font color="#3333cc"><strong>环境名称</strong></font></td>
	  <td align="center" class="en" width="16%"><font color="#3333cc"><strong>修改</strong></font></td>
	  <td align="center" class="en" width="16%"><font color="#3333cc"><strong>详细</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_name")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="scene_backup_env_update.jsp?project_name=<%=rs.getString("project_name")%>&env_name=<%=rs.getString("env_name")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <td align="center" class="en">&nbsp;<a href="scene_backup_env_detail.jsp?project_name=<%=rs.getString("project_name")%>&env_name=<%=rs.getString("env_name")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
  </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
