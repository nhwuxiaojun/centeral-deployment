<%@ include file="../interface/check_qa.jsp" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.QADBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>项目人员信息列表</title>
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
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
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
-->
</style>
</head>
<%
QADBean db = new QADBean();
String sql = new String();
String sql_user = new String();
ResultSet rs_user;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user=db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
ResultSet rs_proj;



if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_project_name"))){
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_project_user_info a,a_project_member_info b where a.user_name = '" + session.getAttribute("username") + "' and a.project_name = b.project_name";
		}else{
			sql = "select * from a_project_user_info a,a_project_member_info b where a.user_name = '" + session.getAttribute("username") + "' and a.project_name = b.project_name and booking_date = to_date('" + request.getParameter("txt_submit_datetime") + "','yyyy-mm-dd')";
		}
	}else{
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_project_user_info a,a_project_member_info b where a.user_name = '" + session.getAttribute("username") + "' and a.project_name = b.project_name and upper(a.project_name) = '" + Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase() + "'";
		}else{
			sql = "select * from a_project_user_info a,a_project_member_info b where a.user_name = '" + session.getAttribute("username") + "' and a.project_name = b.project_name and booking_date = to_date('" + request.getParameter("txt_submit_datetime") + "','yyyy-mm-dd') and upper(a.project_name) = '" + Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase() + "'";
		}
	}
}else{
	sql = "select * from a_project_user_info a,a_project_member_info b where a.user_name = '" + session.getAttribute("username") + "' and a.project_name = b.project_name and rownum<20";
}
//out.print(sql+"<br>");
rs_proj = db.execSQL(sql);
%>
<script language="JavaScript">
function check(){
	if(form1.txt_project_name.value==""&&form1.txt_submit_datetime.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function quit(){
	window.location="../logout_qa.jsp";
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
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<br>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目人员信息<br><font style="{font-size:9pt;}" color="#FF0000">（如要搜索各项目历史人员信息，请使用查询）</font></span></strong></font>
</div>

<form name="form1" action="" method="post">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div><br>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" width="20%">
		项目名称
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_project_name"))||request.getParameter("txt_project_name")==null){%>
			<input type="text" name="txt_project_name" value="">
		<%}else{%>
			<input type="text" name="txt_project_name" value="<%=Tools.toGB(request.getParameter("txt_project_name"))%>">
		<%}%>
		</td>
		<td align="center" width="20%">
		开始日期
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_submit_datetime"))||request.getParameter("txt_submit_datetime")==null){%>
			<input type="text" name="txt_submit_datetime" value="" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}else{%>
			<input type="text" name="txt_submit_datetime" value="<%=request.getParameter("txt_submit_datetime")%>" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}%>
		</td>
		<td align="center" width="20%"><input type="button" name="button1" value="查询" class="button1" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="button1" onClick="return_back()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button3" value="退出" class="button1" onClick="quit()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="20%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>开始日期</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>BA人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>DM人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>ST人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>总人数</strong></font></td>
	  <td align="center" width="15%"><font color="#FF6600"><strong>登记人员</strong></font></td>
	  <td align="center" width="15%"><font color="#FF6600"><strong>登记日期</strong></font></td>
	</tr>
	<%while(rs_proj.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("project_name")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getDate("start_date")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("ba_member")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("dm_member")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("st_member")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("total_member")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getString("booking_user")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs_proj.getDate("booking_date")%>&nbsp;<%=rs_proj.getTime("booking_date")%></font></td>
	</tr>
	<%}%>
</table>
</body>
<%db.close();%>
<%rs_proj.close();%>
</html>
