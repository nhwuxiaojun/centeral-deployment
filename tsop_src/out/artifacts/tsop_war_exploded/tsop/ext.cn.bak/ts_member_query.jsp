<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>TS��Ա��Ϣ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value==""){
		alert("����������һ���ѯ������");
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
		<td align="left" class="en" width="20%">&nbsp;<strong><font color="#3333cc" class="MenuBarItemSubmenu">��Ա��Ϣ��ѯ</font></strong> &nbsp;&nbsp;
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="account">���ʺ�</option>
				<option value="no">����</option>
				<option value="name">Ӣ����</option>
				<option value="cname">������</option>
			<%}else{%>
				<option value="account">���ʺ�</option>
				<option value="no">����</option>
				<option value="name">Ӣ����</option>
				<option value="cname">������</option>
			<%}%>
		</select>
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
		<%}%><input type="button" name="button1" value="��ѯ" class="en" onClick="check()">

		</td>
	</tr><input type="hidden" name="flag" value="y">
</form>
<tr><td>&nbsp;</td></tr>
</table>


<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">

	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="6%"><font color="#ffffff">����</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">���ʺ�</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">Ӣ����</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">������</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">�ֻ���</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">�ֻ�</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">�ʼ�</font></td>
      <td align="center" class="en" width="10%"><font color="#ffffff">֧����Ŀ</font></td>
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
	  <td align="center" class="en"><a href="mailto:<%=rs.getString("ACCOUNT")%>@ebaotech.com"><font color="#3333cc">����</a></td>
	<td align="center" class="en"><a href="ts_project_support_query.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">��ѯ</a></td>


	</tr>
	<%}%>
    
    
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
