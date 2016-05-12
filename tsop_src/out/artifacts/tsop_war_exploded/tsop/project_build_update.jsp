<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>环境搭建流程修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
{
    font-size:9pt;
    color:black;
	vertical-align:middle;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;
}
.button1
{   height:14pt;
    width:30pt;
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;	 
}
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;
sql = "select * from a_apply where id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.proj_proposer.value==""){
		alert("请输入环境搭建申请人");
		return false;
	}
	form1.submit();
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="project_build_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境搭建流程修改</span></strong></font>
</div>
<br><br>
<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>新环境名称</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="new_env" value="<%=rs.getString("new_env")%>" class="text"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目环境属组</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en">
	  <%
	  sql_temp = "select distinct proj_grp from a_env_name";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  <select name="proj_grp">
	  	<option value="<%=rs.getString("proj_grp")%>"><%=rs.getString("proj_grp")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("proj_grp").equals(rs_temp.getString("proj_grp"))){%>
				
			<%}else{%>
				<option value="<%=rs_temp.getString("proj_grp")%>"><%=rs_temp.getString("proj_grp")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>系统平台</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en">
	  <%
	  sql_temp = "select distinct sys_ver from a_property";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="sys_ver">
	  	<option value="<%=rs.getString("sys_ver")%>"><%=rs.getString("sys_ver")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("sys_ver").equals(rs_temp.getString("sys_ver"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("sys_ver")==null||"".equals(rs_temp.getString("sys_ver"))){%>
				
				<%}else{%>
					<option value="<%=rs_temp.getString("sys_ver")%>"><%=rs_temp.getString("sys_ver")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>应用中间件平台</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en">
	  <%
	  sql_temp = "select distinct appsoft_ver from a_property";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  <select name="app_soft">
	  	<option value="<%=rs.getString("app_soft")%>"><%=rs.getString("app_soft")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("app_soft").equals(rs_temp.getString("appsoft_ver"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("appsoft_ver")==null||"".equals(rs_temp.getString("appsoft_ver"))){%>
					
				<%}else{%>
					<option value="<%=rs_temp.getString("appsoft_ver")%>"><%=rs_temp.getString("appsoft_ver")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en">
	  <%
	  sql_temp = "select distinct db_ver from a_property";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  <select name="db_version">
	  	<option value="<%=rs.getString("db_version")%>"><%=rs.getString("db_version")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("db_version").equals(rs_temp.getString("db_ver"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("db_ver")==null||"".equals(rs_temp.getString("db_ver"))){%>

				<%}else{%>
					<option value="<%=rs_temp.getString("db_ver")%>"><%=rs_temp.getString("db_ver")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<%
	if(rs.getString("env_creator").equals(session.getAttribute("username"))){
	
	}else{
		response.sendRedirect("../index.jsp");
	}
	%>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境搭建人</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="env_creator" value="<%=rs.getString("env_creator")%>" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库搭建人</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="db_creator" value="<%=rs.getString("db_creator")%>" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境搭建申请人</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="proj_proposer" value="<%=rs.getString("proj_proposer")%>" class="text"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请提交时间</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="apply_time" value="<%=rs.getDate("apply_time")%>&nbsp;<%=rs.getTime("apply_time")%>" disabled="disabled" class="text"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请状态</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="status" value="<%=rs.getString("status")%>" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目代码</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="proj_code" value="<%=rs.getString("proj_code")%>" class="text" disabled="disabled"></td>
	</tr>
</table>
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="button1">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1"></div>
<%}%>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
