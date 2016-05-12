<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>环境提交列表</title>
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
function check(){
	if(form1.txt_new_env.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location="project_apply_add.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<%
response.setHeader( "Pragma", "no-cache" );
response.addHeader( "Cache-Control", "must-revalidate" );
response.addHeader( "Cache-Control", "no-cache" );
response.addHeader( "Cache-Control", "no-store" );
response.setDateHeader("Expires", 0);
DBean db = new DBean();
String sql = new String();
String sql_user = new String();
ResultSet rs;
ResultSet rs_user;
String userSql = new String();
String username=(String)session.getAttribute("username");
sql_user = "select * from a_user where usr = '" + username + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next())
 {
   if("2".equals(rs_user.getString("valid"))){
     userSql="";
   }else{
    userSql=" and env_creator='"+username+"'";
   }
 }



if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_new_env"))){
			sql = "select * from a_supply where env_status='DOING' and  (apply_type ='APP' or apply_type is null)   order by id desc";	
	}else{
		
		sql = "select * from a_supply where   (apply_type ='APP' or apply_type is null)   and upper(new_env) like '%" + Tools.toGB(request.getParameter("txt_new_env").toString().trim()).toUpperCase() + "%' and env_status='DOING' order by id desc";
		
	}
}else{
	sql = "select * from a_supply where   (apply_type ='APP' or apply_type is null)  and env_status='DOING' "+userSql+" order by id desc";
}
System.out.print(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境提交</span></strong></font>
</div>
<form name="form1" action="" method="post">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td align="center" width="20%">
		新环境名称
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_new_env"))||request.getParameter("txt_new_env")==null){%>
			<input type="text" name="txt_new_env" value="">
		<%}else{%>
			<input type="text" name="txt_new_env" value="<%=Tools.toGB(request.getParameter("txt_new_env"))%>">
		<%}%>
		</td>
		<td align="center" width="20%">&nbsp;&nbsp;<input type="button" name="button1" value="查询" class="button1" onClick="check()">
		</td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="20%"><font color="#3333cc"><strong>环境名称</strong></font></td>
	  <td width="20%" align="center" bgcolor="#D2D2D2"><font color="#3333cc"><strong>申请提交时间</strong></font></td>
	  <td align="center" width="15%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" width="15%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td align="center" width="15%"><font color="#3333cc"><strong>Owner</strong></font></td>
	  <td align="center" width="10%"><font color="#3333cc"><strong>提交</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("new_env")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("mac_ip")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("env_ip")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("env_creator")%>&nbsp;</font></td>
	  <td align="center" >&nbsp;<a href="env_info_submit.jsp?id=<%=rs.getInt("id")%>" ><font color="#3333cc">提交</font></a>&nbsp;</td>
    </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<%rs_user.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
