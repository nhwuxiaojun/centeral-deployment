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
String sql_user = new String();
int flag = 0;
ResultSet rs;
ResultSet rs_user;
sql = "select * from a_user";
sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
//out.print(sql+"<br>");
rs=db.execSQL(sql);
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		flag = 2;
	}
}
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">证书管理</span></strong></font>
</div>
<br>
<%if(request.getParameter("info")==null||"".equals(request.getParameter("info"))){%>
	
<%}else{%>
	<div align="center"><font color="#FF0000"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<br>
<hr>
<table width="98%" style="table-layout: fixed" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<%if(flag==2){%>
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>用户名</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>姓名</strong></font></td>
	  <td width="50%" align="center" class="en"><font color="#3333cc"><strong>证书</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>操作</strong></font></td> 
	</tr>
    <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>用户名</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>姓名</strong></font></td>
	  <td width="60%" align="center" class="en"><font color="#3333cc"><strong>证书</strong></font></td>
	</tr>
    <%}%>
    <%if(flag==2){%>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("usr")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("name")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("certificate")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc"><input type="button" name="button1" value="修改" onClick="upd('<%=rs.getString("usr")%>')"></td>
	</tr>
	<%}%>
    <%}else{%>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("usr")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("name")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">**********</font></td>
	</tr>
	<%}%>
    <%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function upd(id){
	window.location = "certificate_do_upd.jsp?usr="+id;
}
</script>
</html>
