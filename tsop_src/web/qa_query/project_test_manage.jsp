<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目外部测试用例执行情况</title>
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
	window.location="project_test_add.jsp";
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
ResultSet rs;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_project_name"))){
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql="select * from a_project_version_test order by test_date";
		}else{
			sql="select * from a_project_version_test where submit_datetime = to_date('"+request.getParameter("txt_submit_datetime")+"','yyyy-mm-dd') order by test_date";
		}
	}else{
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql="select * from a_project_version_test where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' order by test_date";
		}else{
			sql="select * from a_project_version_test where upper(project_name) like '%"+Tools.toGB(request.getParameter("txt_project_name").toString()).toUpperCase()+"%' and submit_datetime = to_date('"+request.getParameter("txt_submit_datetime")+"','yyyy-mm-dd') order by test_date";
		}
	}
}else{
	sql="select * from a_project_version_test where rownum<11 order by submit_datetime";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目外部测试用例执行情况</span></strong></font>
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
		提交日期
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
	  <td align="center" width="30%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>项目版本</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>Failed</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>Passed</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>测试日期</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>修改</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>详细</strong></font></td>
	  <td align="center" width="10%"><font color="#FF6600"><strong>删除</strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getString("project_version")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getInt("fail_num")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getInt("pass_num")%>&nbsp;</font></td>
	  <td align="center"><font color="#FF6600">&nbsp;<%=rs.getDate("test_date")%>&nbsp;</font></td>
	  <td align="center">&nbsp;<a href="project_test_update.jsp?id=<%=rs.getInt("id")%>"><font color="#FF6600">修改</font></a>&nbsp;</td>
	  <td align="center" >&nbsp;<a href="project_test_detail.jsp?id=<%=rs.getInt("id")%>" target="_blank"><font color="#FF6600">详细</font></a>&nbsp;</td>
	  <td align="center">&nbsp;<a href="project_test_del.jsp?id=<%=rs.getInt("id")%>"><font color="#FF6600">删除</font></a>&nbsp;</td>
  </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
</body>
</html>

