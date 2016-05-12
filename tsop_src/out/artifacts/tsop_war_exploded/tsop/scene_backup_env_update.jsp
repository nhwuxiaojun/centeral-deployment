<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>现场备份检查环境表修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_env_bak where project_name= '" + Tools.toGB(request.getParameter("project_name")) + "' and env_name = '" + Tools.toGB(request.getParameter("env_name")) + "'";
//out.print(sql + "<br>");
rs=db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.env_td_start_date.value==""){
		alert("请输入环境TD开始时间");
		return;
	}
	if(form1.env_td_end_date.value==""){
		alert("请输入环境TD结束时间");
		return;
	}
	if(form1.cvs_dev_start_date.value==""){
		alert("请输入CVS开发开始时间");
		return;
	}
	if(form1.cvs_dev_end_date.value==""){
		alert("请输入CVS开发结束时间");
		return;
	}
	if(form1.cvs_test_start_date.value==""){
		alert("请输入CVS测试开始时间");
		return;
	}
	if(form1.cvs_test_end_date.value==""){
		alert("请输入CVS测试结束时间");
		return;
	}
	if(form1.cvs_pub_start_date.value==""){
		alert("请输入CVS发布开始时间");
		return;
	}
	if(form1.cvs_pub_end_date.value==""){
		alert("请输入CVS发布结束时间");
		return;
	}
	if(form1.j2ee_dev_start_date.value==""){
		alert("请输入J2EE开发开始时间");
		return;
	}
	if(form1.j2ee_dev_end_date.value==""){
		alert("请输入J2EE开发结束时间");
		return;
	}
	if(form1.j2ee_test_start_date.value==""){
		alert("请输入J2EE测试开始时间");
		return;
	}
	if(form1.j2ee_test_end_date.value==""){
		alert("请输入J2EE测试结束时间");
		return;
	}
	if(form1.j2ee_pub_start_date.value==""){
		alert("请输入J2EE发布开始时间");
		return;
	}
	if(form1.j2ee_pub_end_date.value==""){
		alert("请输入J2EE发布结束时间");
		return;
	}
	if(form1.data_td_start_date.value==""){
		alert("请输入数据库TD开始时间");
		return;
	}
	if(form1.data_td_end_date.value==""){
		alert("请输入数据库TD结束时间");
		return;
	}
	if(form1.data_rts_start_date.value==""){
		alert("请输入数据库RTS开始时间");
		return;
	}
	if(form1.data_rts_end_date.value==""){
		alert("请输入数据库RTS结束时间");
		return;
	}
	if(form1.data_jira_start_date.value==""){
		alert("请输入数据库JIRA开始时间");
		return;
	}
	if(form1.data_jira_end_date.value==""){
		alert("请输入数据库JIRA结束时间");
		return;
	}
	if(form1.data_cccq_start_date.value==""){
		alert("请输入数据库CCCQ开始时间");
		return;
	}
	if(form1.data_cccq_end_date.value==""){
		alert("请输入数据库CCCQ结束时间");
		return;
	}
	if(form1.data_dev_start_date.value==""){
		alert("请输入数据库开发开始时间");
		return;
	}
	if(form1.data_dev_end_date.value==""){
		alert("请输入数据库开发结束时间");
		return;
	}
	if(form1.data_test_start_date.value==""){
		alert("请输入数据库测试开始时间");
		return;
	}
	if(form1.data_test_end_date.value==""){
		alert("请输入数据库测试结束时间");
		return;
	}
	if(form1.data_pub_start_date.value==""){
		alert("请输入数据库发布开始时间");
		return;
	}
	if(form1.data_pub_end_date.value==""){
		alert("请输入数据库发布结束时间");
		return;
	}
	form1.submit();
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="scene_backup_env_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">现场备份检查环境表修改</span></strong></font>
</div>
<br><br>
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>项目名称</strong></font></td>
	  <td width="70%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	  <input type="hidden" name="project_name" value="<%=rs.getString("project_name")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境名称</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_name")%>&nbsp;</font></td>
	  <input type="hidden" name="env_name" value="<%=rs.getString("env_name")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境TD开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="env_td_start_date" value="<%=rs.getDate("env_td_start_date")%>" class="text" onFocus="show_cele_date(env_td_start_date,'','',env_td_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境TD结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="env_td_end_date" value="<%=rs.getDate("env_td_end_date")%>" class="text" onFocus="show_cele_date(env_td_end_date,'','',env_td_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境TD备注</strong></font></td>
	  <%if(rs.getString("env_td_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="env_td_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="env_td_remark" value="<%=rs.getString("env_td_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC开发开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_dev_start_date" value="<%=rs.getDate("cvs_dev_start_date")%>" class="text" onFocus="show_cele_date(cvs_dev_start_date,'','',cvs_dev_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC开发结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_dev_end_date" value="<%=rs.getDate("cvs_dev_end_date")%>" class="text" onFocus="show_cele_date(cvs_dev_end_date,'','',cvs_dev_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC开发备注</strong></font></td>
	  <%if(rs.getString("cvs_dev_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_dev_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_dev_remark" value="<%=rs.getString("cvs_dev_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC测试开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_test_start_date" value="<%=rs.getDate("cvs_test_start_date")%>" class="text" onFocus="show_cele_date(cvs_test_start_date,'','',cvs_test_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC测试结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_test_end_date" value="<%=rs.getDate("cvs_test_end_date")%>" class="text" onFocus="show_cele_date(cvs_test_end_date,'','',cvs_test_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC测试备注</strong></font></td>
	  <%if(rs.getString("cvs_test_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_test_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_test_remark" value="<%=rs.getString("cvs_test_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC发布开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_pub_start_date" value="<%=rs.getDate("cvs_pub_start_date")%>" class="text" onFocus="show_cele_date(cvs_pub_start_date,'','',cvs_pub_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC发布结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_pub_end_date" value="<%=rs.getDate("cvs_pub_end_date")%>" class="text" onFocus="show_cele_date(cvs_pub_end_date,'','',cvs_pub_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>CVS/CC发布备注</strong></font></td>
	  <%if(rs.getString("cvs_pub_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_pub_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="cvs_pub_remark" value="<%=rs.getString("cvs_pub_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE开发开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_dev_start_date" value="<%=rs.getDate("j2ee_dev_start_date")%>" class="text" onFocus="show_cele_date(j2ee_dev_start_date,'','',j2ee_dev_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE开发结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_dev_end_date" value="<%=rs.getDate("j2ee_dev_end_date")%>" class="text" onFocus="show_cele_date(j2ee_dev_end_date,'','',j2ee_dev_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE开发备注</strong></font></td>
	  <%if(rs.getString("j2ee_dev_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_dev_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_dev_remark" value="<%=rs.getString("j2ee_dev_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE测试开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_test_start_date" value="<%=rs.getDate("j2ee_test_start_date")%>" class="text" onFocus="show_cele_date(j2ee_test_start_date,'','',j2ee_test_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE测试结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_test_end_date" value="<%=rs.getDate("j2ee_test_end_date")%>" class="text" onFocus="show_cele_date(j2ee_test_end_date,'','',j2ee_test_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE测试备注</strong></font></td>
	  <%if(rs.getString("j2ee_test_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_test_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_test_remark" value="<%=rs.getString("j2ee_test_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE发布开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_pub_start_date" value="<%=rs.getDate("j2ee_pub_start_date")%>" class="text" onFocus="show_cele_date(j2ee_pub_start_date,'','',j2ee_pub_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE发布结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_pub_end_date" value="<%=rs.getDate("j2ee_pub_end_date")%>" class="text" onFocus="show_cele_date(j2ee_pub_end_date,'','',j2ee_pub_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>J2EE发布备注</strong></font></td>
	  <%if(rs.getString("j2ee_pub_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_pub_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="j2ee_pub_remark" value="<%=rs.getString("j2ee_pub_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库TD开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_td_start_date" value="<%=rs.getDate("data_td_start_date")%>" class="text" onFocus="show_cele_date(data_td_start_date,'','',data_td_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库TD结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_td_end_date" value="<%=rs.getDate("data_td_end_date")%>" class="text" onFocus="show_cele_date(data_td_end_date,'','',data_td_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库TD备注</strong></font></td>
	  <%if(rs.getString("data_td_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_td_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_td_remark" value="<%=rs.getString("data_td_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库RTS开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_rts_start_date" value="<%=rs.getDate("data_rts_start_date")%>" class="text" onFocus="show_cele_date(data_rts_start_date,'','',data_rts_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库RTS结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_rts_end_date" value="<%=rs.getDate("data_rts_end_date")%>" class="text" onFocus="show_cele_date(data_rts_end_date,'','',data_rts_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库RTS备注</strong></font></td>
	  <%if(rs.getString("data_rts_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_rts_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_rts_remark" value="<%=rs.getString("data_rts_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库JIRA开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_jira_start_date" value="<%=rs.getDate("data_jira_start_date")%>" class="text" onFocus="show_cele_date(data_jira_start_date,'','',data_jira_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库JIRA结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_jira_end_date" value="<%=rs.getDate("data_jira_end_date")%>" class="text" onFocus="show_cele_date(data_jira_end_date,'','',data_jira_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库JIRA备注</strong></font></td>
	  <%if(rs.getString("data_jira_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_jira_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_jira_remark" value="<%=rs.getString("data_jira_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库CCCQ开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_cccq_start_date" value="<%=rs.getDate("data_cccq_start_date")%>" class="text" onFocus="show_cele_date(data_cccq_start_date,'','',data_cccq_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库CCCQ结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_cccq_end_date" value="<%=rs.getDate("data_cccq_end_date")%>" class="text" onFocus="show_cele_date(data_cccq_end_date,'','',data_cccq_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库CCCQ备注</strong></font></td>
	  <%if(rs.getString("data_cccq_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_cccq_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_cccq_remark" value="<%=rs.getString("data_cccq_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库开发开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_dev_start_date" value="<%=rs.getDate("data_dev_start_date")%>" class="text" onFocus="show_cele_date(data_dev_start_date,'','',data_dev_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库开发结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_dev_end_date" value="<%=rs.getDate("data_dev_end_date")%>" class="text" onFocus="show_cele_date(data_dev_end_date,'','',data_dev_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库开发备注</strong></font></td>
	  <%if(rs.getString("data_dev_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_dev_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_dev_remark" value="<%=rs.getString("data_dev_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库测试开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_test_start_date" value="<%=rs.getDate("data_test_start_date")%>" class="text" onFocus="show_cele_date(data_test_start_date,'','',data_test_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库测试结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_test_end_date" value="<%=rs.getDate("data_test_end_date")%>" class="text" onFocus="show_cele_date(data_test_end_date,'','',data_test_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库测试备注</strong></font></td>
	  <%if(rs.getString("data_test_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_test_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_test_remark" value="<%=rs.getString("data_test_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库发布开始时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_pub_start_date" value="<%=rs.getDate("data_pub_start_date")%>" class="text" onFocus="show_cele_date(data_pub_start_date,'','',data_pub_start_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库发布结束时间</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_pub_end_date" value="<%=rs.getDate("data_pub_end_date")%>" class="text" onFocus="show_cele_date(data_pub_end_date,'','',data_pub_end_date)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库发布备注</strong></font></td>
	  <%if(rs.getString("data_pub_remark")==null){%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_pub_remark" value="" class="text">&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="data_pub_remark" value="<%=rs.getString("data_pub_remark")%>" class="text">&nbsp;</font></td>
	  <%}%>
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
