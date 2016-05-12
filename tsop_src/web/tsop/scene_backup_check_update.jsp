<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>现场备份检查项目表修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql="select * from a_pro_bak where project_name='"+Tools.toGB(request.getParameter("project_name"))+"'";
rs=db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.start_date.value==""){
		alert("请输入开始时间");
		return;
	}
	if(form1.end_date.value==""){
		alert("请输入结束时间");
		return;
	}
	if(form1.take_person.value==""){
		alert("请输入带回人员");
		return;
	}
	if(form1.take_date.value==""){
		alert("请输入带回时间");
		return;
	}
	if(form1.check_person.value==""){
		alert("请输入检查人员");
		return;
	}
	if(form1.check_date.value==""){
		alert("请输入检查时间");
		return;
	}
	if(form1.test_result.value==""){
		alert("请输入测试结果说明");
		return;
	}
	if(form1.sample_date.value==""){
		alert("请输入抽样时间");
		return;
	}
	form1.submit();
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="scene_backup_check_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">现场备份检查项目表修改</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目名称</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	  <input type="hidden" name="project_name" value="<%=rs.getString("project_name")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境个数</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_num")%>&nbsp;</font></td>
	  <input type="hidden" name="env_num" value="<%=rs.getString("env_num")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="start_date" value="<%=rs.getDate("start_date")%>" class="text" onFocus="show_cele_date(start_date,'','',start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="end_date" value="<%=rs.getDate("end_date")%>" class="text" onFocus="show_cele_date(end_date,'','',end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>带回人员</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="take_person" value="<%=rs.getString("take_person")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>带回时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="take_date" value="<%=rs.getDate("take_date")%>" class="text" onFocus="show_cele_date(take_date,'','',take_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>检查人员</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="check_person" value="<%=rs.getString("check_person")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>检查时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="check_date" value="<%=rs.getDate("check_date")%>" class="text" onFocus="show_cele_date(check_date,'','',check_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>测试结果说明</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="test_result" value="<%=rs.getString("test_result")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>抽样时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="sample_date" value="<%=rs.getDate("sample_date")%>" class="text" onFocus="show_cele_date(sample_date,'','',sample_date)">&nbsp;</font></td>
	</tr>
</table>
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="but">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="but"></div>
<%}%>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
