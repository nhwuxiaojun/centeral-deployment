<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>证书管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
int flag = 0;
ResultSet rs;
sql = "select * from a_user where usr = '" + request.getParameter("usr") + "'";
//out.print(sql+"<br>");
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">证书修改</span></strong></font>
</div>
<br><br>
<hr>
<form name="form1" action="" method="post">
<%while(rs.next()){%>
<table width="80%" style="table-layout: fixed" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#FCFCFC">
	  <td width="50%" align="center" class="en"><font color="#3333cc"><strong>用户名</strong></font></td>
	  <td width="50%" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("usr")%>&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc"><strong>姓名</strong></font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("name")%>&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc"><strong>证书</strong></font></td>
      <td align="center" class="en"><input type="text" name="certificate" value="<%=rs.getString("certificate")%>"></td>
	</tr>
</table>
<%}%>
<br>
<div align="center">
<input type="button" name="button1" value="修改" onClick="upd()">
<input type="button" name="button2" value="返回" onClick="return_back()">
</div>
<input type="hidden" name="usr" value="<%=request.getParameter("usr")%>">
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function upd(){
	form1.action = "certificate_do_upd_finish.jsp";
	form1.submit();
}
function return_back(){
	window.location = "certificate_do.jsp";
}
</script>
</html>
