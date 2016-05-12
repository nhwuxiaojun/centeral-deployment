<%//@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目版本信息日志</title>
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
function quit(){
	window.location="../logout_qa.jsp";
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
ResultSet rs;
ResultSet rs_user;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user=db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_project_name"))){
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql="select * from a_qa_log order by id desc";
		}else{
			sql="select * from a_qa_log where date_time between to_date('"+request.getParameter("txt_submit_datetime")+" 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_date('"+request.getParameter("txt_submit_datetime")+" 23:59:59','yyyy-mm-dd hh24:mi:ss') order by id desc";
		}
	}else{
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql="select * from a_qa_log where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' order by id desc";
		}else{
			sql="select * from a_qa_log where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' and (date_time between to_date('"+request.getParameter("txt_submit_datetime")+" 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_date('"+request.getParameter("txt_submit_datetime")+" 23:59:59','yyyy-mm-dd hh24:mi:ss')) order by id desc";
		}
	}
}else{
	sql="select * from a_qa_log order by id desc";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目版本信息日志<br><font style="{font-size:9pt;}" color="#FF0000">（如要搜索各项目历史版本日志，请使用查询）</font></span></strong></font>
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
		操作时间
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_submit_datetime"))||request.getParameter("txt_submit_datetime")==null){%>
			<input type="text" name="txt_submit_datetime" value="" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}else{%>
			<input type="text" name="txt_submit_datetime" value="<%=request.getParameter("txt_submit_datetime")%>" onFocus="show_cele_date(txt_submit_datetime,'','',txt_submit_datetime)">
		<%}%>
		</td>
		<td align="center" width="20%"><input type="button" name="button1" value="查询" class="button1" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button3" value="退出" class="button1" onClick="quit()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="5%"><font color="#FF6600"><strong>ID</strong></font></td>
	  <td align="center" width="5%"><font color="#FF6600"><strong>员工</strong></font></td>
	  <td align="center" width="5%"><font color="#FF6600"><strong>操作</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>操作日期</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>项目版本</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>UAT_START_DATE（操作前）</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>PRODUCTION_START_DATE（操作前）</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>UAT_START_DATE（操作后）</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>PRODUCTION_START_DATE（操作后）</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#FF6600"><%=rs.getInt("id")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs.getString("usr")%></font></td>
	  <td align="center"><font color="#FF6600">
	  <%if("add".equals(rs.getString("operation"))){%>
	  	新增
	  <%}%>
	  <%if("del".equals(rs.getString("operation"))){%>
	  	删除
	  <%}%>
	  <%if("upd".equals(rs.getString("operation"))){%>
	  	修改
	  <%}%>
	  </font></td>
	  <td align="center"><font color="#FF6600"><%=rs.getDate("date_time")%><br><%=rs.getTime("date_time")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs.getString("project_name")%></font></td>
	  <td align="center"><font color="#FF6600"><%=rs.getString("project_version")%></font></td>
	  <td align="center"><font color="#FF6600">
	  <%if(rs.getDate("pre_uat_start_date")==null||"".equals(rs.getDate("pre_uat_start_date"))){%>
	  	&nbsp;
	  <%}else{%>
	  	<%=rs.getDate("pre_uat_start_date")%>
	  <%}%>
	  </font></td>
	  <td align="center"><font color="#FF6600">
	  <%if(rs.getDate("after_uat_start_date")==null||"".equals(rs.getDate("after_uat_start_date"))){%>
	  	&nbsp;
	  <%}else{%>
	  	<%=rs.getDate("after_uat_start_date")%>
	  <%}%>
	  </font></td>
	  <td align="center"><font color="#FF6600">
	  <%if(rs.getDate("pre_production_start_date")==null||"".equals(rs.getDate("pre_production_start_date"))){%>
	  	&nbsp;
	  <%}else{%>
	  	<%=rs.getDate("pre_production_start_date")%>
	  <%}%>
	  </font></td>
	  <td align="center"><font color="#FF6600">
	  <%if(rs.getDate("after_production_start_date")==null||"".equals(rs.getDate("after_production_start_date"))){%>
	  	&nbsp;
	  <%}else{%>
	  	<%=rs.getDate("after_production_start_date")%>
	  <%}%>
	  </font></td>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
</body>
</html>