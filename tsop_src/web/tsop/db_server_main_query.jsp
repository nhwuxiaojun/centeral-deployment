<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>数据库环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
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
			sql = "select * from a_db_svr_main order by db_sid,db_user";
		}else{
			sql = "select * from a_db_svr_main where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by db_sid,db_user";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql = "select * from a_db_svr_main where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' order by db_sid,db_user";
		}else{
			sql = "select * from a_db_svr_main where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' and upper("+request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by db_sid,db_user";
		}
	}
}else{
	sql = "select * from a_db_svr_main where rownum<11 order by db_sid,db_user";
}
System.out.println(sql);
try {
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105"> 数据库信息查询与管理(锁, AWR, Session管理)</span></strong></font>
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
				<option value="db_ip">数据库IP</option>
				<option value="db_version">数据库版本</option>
				<option value="db_type">数据库类型</option>
			<%}else{%>
				<%if("db_version".equals(request.getParameter("col_name1"))){%>
					<option value="db_version">数据库版本</option>
					<option value="db_ip">数据库IP</option>
					<option value="db_type">数据库类型</option>
				<%}else if ("db_type".equals(request.getParameter("col_name1"))){%>
					<option value="db_type">数据库类型</option>
					<option value="db_ip">数据库IP</option>
					<option value="db_version">数据库版本</option>
				<%}else{%>
					<option value="db_ip">数据库IP</option>
					<option value="db_version">数据库版本</option>
					<option value="db_type">数据库类型</option>
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
		<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
		<%rs2=db.execSQL(sql);%>
		<%while(rs2.next()){%>
  			<%if("2".equals(rs2.getString("valid"))){%>
				&nbsp;&nbsp;<input type="button" name="button2" value="新增" class="en" onClick="add()">
			<%}else{%>

			<%}%>
		<%}%>
		</td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<br>
<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%
sql="select * from a_user where usr='"+session.getAttribute("username")+"'";
System.out.println(sql);
%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>TNSNAME</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库IP&Port</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>DB Type</strong></font></td>
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>Session Query</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>Lock Query</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>AWR Report</strong></font></td>
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>修改</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_LDAP_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>:<%=rs.getString("DB_PORT_NUM")%></font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_VERSION")%>&nbsp;</font></td> 
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_STATUS")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_TYPE")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="db_server_main_detail.jsp?id=<%=rs.getString("DB_ID")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <td align="center" class="en"><a href="#" onClick="open_win('ts_db_sess_query.jsp?db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>',1150,650);"><font color=red>Query</font></a></td>
	  <td align="center" class="en"><a href="#" onClick="open_win('ts_db_lock_query.jsp?db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>',850,650);"><font color=purple>Query</font></a></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong><a href="extract_awr.jsp?env_name=empty&db_sid=<%=rs.getString("DB_SID")%>&db_ldap_name=<%=rs.getString("DB_LDAP_NAME")%>" target="_blank">Generate</a></strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">&nbsp;<a href="db_server_main_update.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>TNSNAME</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>DB Type</strong></font></td>
	  <td align="center" class="en" width="6%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>TopSQL</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>Lock</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#3333cc"><strong>AWR Report</strong></font></td>
	</tr>
	<%while(rs.next()){%>
			<tr bgcolor="#FCFCFC">
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_LDAP_NAME")%>&nbsp;</font></td>
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>&nbsp;</font></td>
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_VERSION")%>&nbsp;</font></td> 
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_STATUS")%>&nbsp;</font></td>
	  			<td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_TYPE")%>&nbsp;</font></td>
	  			<td align="center" class="en">&nbsp;<a href="db_server_main_detail.jsp?id=<%=rs.getInt("DB_ID")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <td align="center" class="en"><a href="#" onClick="open_win('ts_db_session_query.jsp?db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>',1050,650);"><font color=red>TopSQL</font></a></td>
	  <td align="center" class="en"><a href="#" onClick="open_win('ts_db_lock_query.jsp?db_sid=<%=rs.getString("DB_SID")%>&db_ip=<%=rs.getString("DB_IP")%>&db_port=<%=rs.getString("DB_PORT_NUM")%>',850,650);"><font color=purple>Lock</font></a></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong><a href="extract_awr.jsp?env_name=empty&db_sid=<%=rs.getString("DB_SID")%>&db_ldap_name=<%=rs.getString("DB_LDAP_NAME")%>" target="_blank">Generate</a></strong></font></td>
			</tr>
	<%} // end of while %>
  <%} // end of if-else %>
<%} // end of while %>
</table>
<%db.close();%>
<%rs.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
