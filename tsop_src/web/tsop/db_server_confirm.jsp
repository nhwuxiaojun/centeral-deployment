<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>数据库表确认</title>
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
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
    border-right-color:Black;
}
.button1
{   
    height:14pt;
    width:30pt;
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
-->
</style>
</head>
<script language="JavaScript">
function add(){
	window.location="db_server_add.jsp";
}
</script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
ResultSet rs2;
sql="select * from a_db_svr_tmp order by db_sid,proj_env";
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库表确认</span></strong></font>
</div>
<%if(request.getParameter("info")==null||"".equals(request.getParameter("info"))){%>
	
<%}else{%>
	<br><div align="center"><font color="#FF0000"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<!--div align="center"><input type="button" name="button1" value="新增" class="button1" onClick="add()"></div-->
<form name="form1" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
<%rs2 = db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>数据库实例名 
</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>用户类型</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>修改</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>确认</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_TYPE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="db_server_detail_temp.jsp?id=<%=rs.getInt("DB_ID")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <td align="center" class="en">&nbsp;<a href="db_server_update_temp.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <td align="center" class="en">&nbsp;<a href="db_server_confirm_temp.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#3333cc">确认</font></a>&nbsp;</td>
	  <td align="center" class="en">&nbsp;<a href="db_server_del_temp.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#3333cc">删除</font></a>&nbsp;</td>
  	</tr>
	<%}%>
  <%}else{%>
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>用户类型</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#3333cc"><strong>修改</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_TYPE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="db_server_detail_temp.jsp?id=<%=rs.getInt("DB_ID")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <%if(rs.getString("CREATER").equals(session.getAttribute("username"))){%>
	  	<td align="center" class="en">&nbsp;<a href="db_server_update_temp.jsp?id=<%=rs.getInt("DB_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <%}else{%>
	  	<td align="center" class="en">&nbsp;</td>
	  <%}%>
  	</tr>
	<%}%>	
  <%}%>
<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
