
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>现场备份检查环境表详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_env_bak where project_name = '" + Tools.toGB(request.getParameter("project_name")) + "' and env_name = '" + Tools.toGB(request.getParameter("env_name")) + "'";
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">现场备份检查环境表详细</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>项目名称</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>环境名称</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>环境TD时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("env_td_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("env_td_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>环境TD备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en" colspan="3"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("env_td_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("env_td_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC开发时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("cvs_dev_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("cvs_dev_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC开发备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("cvs_dev_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("cvs_dev_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC测试时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("cvs_test_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("cvs_test_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC测试备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("cvs_test_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("cvs_test_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC发布时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("cvs_pub_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("cvs_pub_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>CVS/CC发布备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("cvs_pub_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("cvs_pub_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE开发时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("j2ee_dev_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("j2ee_dev_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE开发备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("j2ee_dev_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("j2ee_dev_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE测试时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("j2ee_test_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("j2ee_test_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE测试备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("j2ee_test_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("j2ee_test_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE发布时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("j2ee_pub_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("j2ee_pub_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>J2EE发布备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("j2ee_pub_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("j2ee_pub_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库TD时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_td_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_td_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库TD备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_td_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_td_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库RTS时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_rts_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_rts_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库RTS备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_rts_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_rts_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库JIRA时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_jira_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_jira_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库JIRA备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_jira_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_jira_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库CCCQ时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_cccq_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_cccq_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库CCCQ备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_cccq_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_cccq_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库开发时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_dev_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_dev_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库开发备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_dev_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_dev_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库测试时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_test_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_test_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库测试备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_test_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_test_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库发布时间</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("data_pub_start_date")%>&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;<%=rs.getDate("data_pub_end_date")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="15%"><font color="#3333cc"><strong>数据库发布备注</strong></font></td>
	  <td width="33%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;
	  <%if(rs.getString("data_pub_remark")==null){%>
	    &nbsp;
	  <%}else{%>
	    <%=rs.getString("data_pub_remark")%>
	  <%}%>
	  &nbsp;</font></td>
	</tr>
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
