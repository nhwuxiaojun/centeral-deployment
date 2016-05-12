<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目人员修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
{
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
.select1
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 160px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.STYLE1 {color: #FF6600}
-->
</style>
</head>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<%
QADBean db = new QADBean();
String sql_member = new String();
String sql_user = new String();
String sql_project = new String();
String sql_start_date = new String();
String project_name = new String();
int start_year = 0;
int start_month = 0;
int start_date = 0;
ResultSet rs_member;
ResultSet rs_user;
ResultSet rs_project;
ResultSet rs_start_date;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
sql_member = "select * from a_project_member_info where id = " + request.getParameter("id") + " and booking_user = '" + session.getAttribute("username") + "'";
rs_member = db.execSQL(sql_member);
while(rs_member.next()){
%>
<br><br><br><br>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目人员修改</span></strong></font>
</div>
<br><br>
<form name="form1" action="project_member_upd_finish.jsp" method="post" class="en">
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目名称：</strong></td>
    <td class="en" width="60%" align="center">
	<%
	sql_project = "select * from a_project_user_info where user_name = '" + session.getAttribute("username") + "'";
	rs_project = db.execSQL(sql_project);
	%>
	<select name="project_name" class="select1" disabled="disabled">
	<%while(rs_project.next()){%>
		<%project_name = rs_project.getString("project_name");%>
		<option value="<%=rs_project.getString("project_name")%>"><%=rs_project.getString("project_name")%></option>
		<%//start_date = rs_project.getDate("start_date").toSting();%>
	<%}%>
	</select>
	<%rs_project.close();%>
	<%
	if(project_name==null||"".equals(project_name)){
		
	}else{
		sql_start_date = "select max(start_date) as max_date from a_project_member_info where project_name = '"+ project_name + "'";
		//out.print(sql_start_date);
		rs_start_date = db.execSQL(sql_start_date);
		while(rs_start_date.next()){
			start_year = rs_start_date.getDate("max_date").getYear() + 1900;
			start_month = rs_start_date.getDate("max_date").getMonth() + 1;
			start_date = rs_start_date.getDate("max_date").getDate();
		}
	}
	%>
	</td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>开始日期：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="start_date" value="<%=rs_member.getDate("start_date")%>" class="text" size="25" disabled="disabled"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>BA人数：</strong></td>
    <td class="en" width="60%" align="center"><input type="text" name="ba_member" value="<%=rs_member.getString("ba_member")%>" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DM人数：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="dm_member" value="<%=rs_member.getString("dm_member")%>" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>ST人数：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="st_member" value="<%=rs_member.getString("st_member")%>" class="text" size="25"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>总人数：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="total_member" value="<%=rs_member.getString("total_member")%>" class="text" size="25"></td>
  </tr>
</table>
<br><br>
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<div align="center">
<input type="button" name="button1" class="button1" value="修改" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="button1" onClick="return_back()">
</div>
</form>
<%}%>
<%db.close();%>
<%//rs_start_date.close();%>
</body>
<script language="JavaScript">
function check(){
	if(form1.project_name.value==""){
		alert("请输入项目名称");
		form1.project_name.focus();
		return;
	}
	if(form1.start_date.value==""){
		alert("请输入开始日期");
		form1.start_date.focus();
		return;
	}
	var today= new Date();
	var str_start_date;
	str_start_date = document.form1.start_date.value;
	var arr_start_date1;
	arr_start_date1 = str_start_date.split("-");
	var dateObj = new Date(arr_start_date1[0], arr_start_date1[1]-1, arr_start_date1[2], 23, 59, 59);
	/*
	if(today-dateObj>=0){
		alert("开始日期必须大于等于当前日期！");
		form1.start_date.focus();
		return;
	}
	*/
	<%if(start_year==0){%>
		var dateObj2 = new Date();		
	<%}else{%>
		var dateObj2 = new Date(<%=start_year%>, <%=start_month%>-1, <%=start_date%> , 23, 59, 59);
	<%}%>
	if(form1.ba_member.value==""){
		alert("请输入BA人数");
		form1.ba_member.focus();
		return;
	}
	if(form1.dm_member.value==""){
		alert("请输入DM人数");
		form1.dm_member.focus();
		return;
	}
	if(form1.st_member.value==""){
		alert("请输入ST人数");
		form1.st_member.focus();
		return;
	}
	if(form1.total_member.value==""){
		alert("请输入总人数");
		form1.total_member.focus();
		return;
	}
	if(dateObj2-dateObj>0){
		var a=confirm('提醒注意：系统已有大于该开始日期的项目人员信息记录，确定是否提交？');
		if(a==false){
			return;
		}
	}
	form1.submit();
}
function return_back(){
	window.location="project_version_manage2.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>