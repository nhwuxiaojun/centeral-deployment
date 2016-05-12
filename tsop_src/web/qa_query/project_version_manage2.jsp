<%@ include file="../interface/check_qa.jsp" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.QADBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>项目信息管理</title>
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
<script language="JavaScript">
function check(){
	if(form1.txt_project_name.value==""&&form1.txt_submit_datetime.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
function add(){
	window.location="project_version_add.jsp";
}
function quit(){
	window.location="../logout_qa.jsp";
}
function add_member(){
	window.location="project_member_add.jsp";
}
function member_detail(){
	window.location="project_member_detail.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<%
QADBean db = new QADBean();
String sql = new String();
String sql_user = new String();
String sql_proj = new String();
ResultSet rs;
ResultSet rs_user;
ResultSet rs_proj;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_project_name"))){
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_project_version_info order by submit_datetime";
		}else{
			sql = "select * from a_project_version_info where submit_datetime = to_date('" + request.getParameter("txt_submit_datetime") + "','yyyy-mm-dd') order by submit_datetime";
		}
	}else{
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_project_version_info where upper(project_name) like '%" + Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase() + "%' order by submit_datetime";
		}else{
			sql = "select * from a_project_version_info where upper(project_name) like '%" + Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase() + "%' and submit_datetime = to_date('" + request.getParameter("txt_submit_datetime") + "','yyyy-mm-dd') order by submit_datetime";
		}
	}
}else{
	sql="select a.* from a_project_version_info a,(select a.project_name b1,max(a.project_version) b2 from a_project_version_info a group by a.project_name) b where a.project_name = b.b1 and a.project_version = b.b2";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<table border="0" align="center" width="98%">
<tr>
<td align="center" width="80%"><font color="#FF6600"><strong><br>
  <span class="s105">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目人员信息</span></strong></font></td>
<td align="center" width="20%" valign="bottom">&nbsp;<input type="button" name="button1" value="新增" class="button1" onClick="add_member()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="详细" class="button1" onClick="member_detail()"></td>
</tr>
</table>

<%if("".equals(request.getParameter("info2"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info2"))%></font></div><br>
<%}%>

<%
sql_proj = "select a.* from a_project_member_info a,(select a.project_name b1,max(a.start_date) b2 from a_project_member_info a group by a.project_name) b,a_project_user_info c where a.project_name = b.b1 and a.start_date = b.b2 and c.user_name = '" + session.getAttribute("username") + "' and c.project_name = a.project_name";
rs_proj = db.execSQL(sql_proj);
%>
<br>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="10%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>开始日期</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>BA人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>DM人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>ST人数</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>总人数</strong></font></td>
	  <td align="center" width="15%"><font color="#FF6600"><strong>登记人员</strong></font></td>
  	  <td align="center" width="15%"><font color="#FF6600"><strong>登记日期</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>修改</strong></font></td>
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
	  <td align="center"><a href="project_member_upd.jsp?id=<%=rs_proj.getString("id")%>"><font color="#FF6600">修改</font></a></td>
	</tr>
	<%}%>
</table>

<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目版本信息<br><font style="{font-size:9pt;}" color="#FF0000">（如要搜索各项目历史版本信息，请使用查询）</font></span></strong></font>
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
		提交时间
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_submit_datetime"))||request.getParameter("txt_submit_datetime")==null){%>
			<input type="text" name="txt_submit_datetime" value="" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}else{%>
			<input type="text" name="txt_submit_datetime" value="<%=request.getParameter("txt_submit_datetime")%>" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}%>
		</td>
		<td align="center" width="20%"><input type="button" name="button1" value="查询" class="button1" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="新增" class="button1" onClick="add()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button3" value="退出" class="button1" onClick="quit()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="17%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>项目版本</strong></font></td>
	  <td align="center" width="16%"><font color="#FF6600"><strong>UAT开始日期</strong></font></td>
	  <td align="center" width="21%"><font color="#FF6600"><strong>Production开始日期</strong></font></td>
	  <td align="center" width="12%"><font color="#FF6600"><strong>修改</strong></font></td>
	  <td align="center" width="12%"><font color="#FF6600"><strong>详细</strong></font></td>
	  <td align="center" width="12%"><font color="#FF6600"><strong>删除</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getString("project_version")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getDate("uat_start_date")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getDate("production_start_date")%>&nbsp;</font></td>
	  <%if("admin".equals(session.getAttribute("username"))){%>
	    <td align="center">&nbsp;<a href="project_version_update.jsp?project_name=<%=rs.getString("project_name")%>&project_version=<%=rs.getString("project_version")%>"><font color="#FF6600">修改</font></a>&nbsp;</td>
	  <%}else{%>
	    <%if(rs.getString("user_name").equals(session.getAttribute("username"))){%>
	      <td align="center">&nbsp;<a href="project_version_update.jsp?project_name=<%=rs.getString("project_name")%>&project_version=<%=rs.getString("project_version")%>"><font color="#FF6600">修改</font></a>&nbsp;</td>
	    <%}else{%>
	      <td align="center">&nbsp;</td>
	    <%}%>
	  <%}%>
	  <td align="center" >&nbsp;<a href="project_version_detail.jsp?project_name=<%=rs.getString("project_name")%>&project_version=<%=rs.getString("project_version")%>" target="_blank"><font color="#FF6600">详细</font></a>&nbsp;</td>
	  <%if("admin".equals(session.getAttribute("username"))){%>
	    <td align="center">&nbsp;<a href="project_version_del.jsp?project_name=<%=rs.getString("project_name")%>&project_version=<%=rs.getString("project_version")%>"><font color="#FF6600">删除</font></a>&nbsp;</td>
	  <%}else{%>
	    <%if(rs.getString("user_name").equals(session.getAttribute("username"))){%>
	      <td align="center">&nbsp;<a href="project_version_del.jsp?project_name=<%=rs.getString("project_name")%>&project_version=<%=rs.getString("project_version")%>"><font color="#FF6600">删除</font></a>&nbsp;</td>
	    <%}else{%>
	      <td align="center">&nbsp;</td>
	    <%}%>
	  <%}%>
  </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<%rs_proj.close();%>
</body>
</html>