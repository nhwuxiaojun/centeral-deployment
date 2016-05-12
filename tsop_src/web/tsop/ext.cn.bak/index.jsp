<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>TS成员信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location = "ts_member_add.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script language="JavaScript" for="window" event="onload">
        form1.col_value1.select();
</script>
<body><%@include file="includes/head.html" %>
<jsp:include page="menu.jsp" />
<%
DBean db = new DBean();
String sql = new String();
int sum = 0;
ResultSet rs;
ResultSet rs2;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))){
			sql = "select * from ts_member order by no";
	}else{
			sql = "select * from ts_member where upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' order by no";
	}
}else{
	sql = "select * from ts_member  order by no";
}
System.out.print(sql+"\n");
rs = db.execSQL(sql);
%>


<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
<form name="form1" action="" method="post" class="en">
<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="left" class="en" width="20%">&nbsp;<strong><font color="#3333cc" class="MenuBarItemSubmenu">成员信息查询</font></strong> &nbsp;&nbsp;
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="account">域帐号</option>
				<option value="no">工号</option>
				<option value="name">英文名</option>
				<option value="cname">中文名</option>
			<%}else{%>
				<option value="account">域帐号</option>
				<option value="no">工号</option>
				<option value="name">英文名</option>
				<option value="cname">中文名</option>
			<%}%>
		</select>
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
		<%}%><input type="button" name="button1" value="查询" class="en" onClick="check()">

		</td>
	</tr><input type="hidden" name="flag" value="y">
</form>
<tr><td>&nbsp;</td></tr>
</table>


<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">

	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="6%"><font color="#ffffff">工号</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">域帐号</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">英文名</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">中文名</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">手机号</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">分机</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">邮件</font></td>
      <td align="center" class="en" width="10%"><font color="#ffffff">支持项目</font></td>
	</tr>
	<%while(rs.next()){
		sum++;
		if ((sum%2)==1) {
			out.println("<tr bgcolor=#eeeeee height=20>");
		} else {
			out.println("<tr bgcolor=#ffffff height=20>");
		}
		%>
	  <td align="center" class="en"><%=rs.getLong("NO")%></td>
	  <td align="center" class="en"><%=rs.getString("ACCOUNT")%></td>
	  <td align="center" class="en"><%=rs.getString("NAME")%></td> 
	  <td align="center" class="en"><%=rs.getString("CNAME")%></td>
	  <td align="center" class="en"><%=rs.getLong("MOBILE1")%></td>
	  <td align="center" class="en"><%=rs.getLong("EXT")%></td>
	  <td align="center" class="en"><a href="mailto:<%=rs.getString("ACCOUNT")%>@ebaotech.com"><font color="#3333cc">发送</a></td>
	<td align="center" class="en"><a href="ts_project_support_query.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">查询</a></td>


	</tr>
	<%}%>
    
    
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
