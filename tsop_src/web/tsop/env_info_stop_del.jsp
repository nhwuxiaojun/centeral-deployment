<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>删除环境</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "db_server_main_add.jsp";
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
ResultSet rs2;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_db_svr where lower(db_status) = 'stopped' order by db_sid,db_user";
		}else{
			sql="select * from a_db_svr where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' and lower(db_status) = 'stopped' order by db_sid,db_user";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_db_svr where upper("+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%' and lower(db_status) = 'stopped' order by db_sid,db_user";
		}else{
			sql="select * from a_db_svr where upper("+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' and lower(db_status) = 'stopped' order by db_sid,db_user";
		}
	}
}else{
	sql="select * from a_db_svr where lower(db_status) = 'stopped' and rownum<11 order by db_sid,db_user";
}
//out.print(sql+"<br>");
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">删除环境</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="db_version">数据库版本</option>
				<option value="db_ip">数据库IP</option>
			<%}else{%>
				<%if("db_version".equals(request.getParameter("col_name1"))){%>
					<option value="db_version">数据库版本</option>
					<option value="db_ip">数据库IP</option>
				<%}else{%>
					<option value="db_ip">数据库IP</option>
					<option value="db_version">数据库版本</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
				<option value="db_user">数据库用户</option>
			<%}else{%>
				<%if("db_sid".equals(request.getParameter("col_name"))){%>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
				<option value="db_user">数据库用户</option>
				<%}%>
				<%if("db_status".equals(request.getParameter("col_name"))){%>
				<option value="db_status">数据库运行状态</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_user">数据库用户</option>
				<%}%>
				<%if("db_user".equals(request.getParameter("col_name"))){%>
				<option value="db_user">数据库用户</option>
				<option value="db_sid">数据库实例名</option>
				<option value="db_status">数据库运行状态</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="15">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="15">
		<%}%>
		</td>
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()">
		</td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td align="center" class="en" width="25%"><font color="#3333cc"><strong>数据库用户</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_IP")%></font></td>
	  <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_SID")%></font></td>
	  <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_VERSION")%></font></td> 
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_USER")%></font></td>
	  <td align="center" class="en"><font color="#3333cc"><%=rs.getString("DB_STATUS")%></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><a href="#" onClick="del('<%=rs.getInt("DB_ID")%>')"><font color="#3333cc">删除</font></a></td>
	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td align="center" class="en" width="40%"><font color="#3333cc"><strong>数据库用户</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_VERSION")%>&nbsp;</font></td> 
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_STATUS")%>&nbsp;</font></td>
	</tr>
	<%}%>
  <%}%>
<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function del(id){
	var a = confirm("确认要删除吗？");
	if(a==true){
		window.location = "env_info_stop_del_finish.jsp?id=" + id;
	}
}
</script>
</html>
