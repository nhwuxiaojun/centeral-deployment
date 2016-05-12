<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>PC/WM申请修改</title>
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
.STYLE1 {color: #3333cc}
-->
</style>
</head>

<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;
sql = "select * from a_pc_apply where apply_id = " + request.getParameter("apply_id");
rs = db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.proj_proposer.value==""){
		alert("请输入申请人");
		return false;
	}
	form1.submit();
}
function return_back(){
	window.location = "pc_apply_list.jsp";
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="pc_apply_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC/WM申请修改</span></strong></font>
</div>
<br><br>
<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目名称</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="proj_name" value="<%=rs.getString("proj_name")%>" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>系统平台</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en">
	  
	  <%
	  sql_temp = "select distinct sys_ver from a_property";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  <select name="sys_type">
	  	<option value="<%=rs.getString("sys_type")%>"><%=rs.getString("sys_type")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("sys_type").equals(rs_temp.getString("sys_ver"))){%>
				
			<%}else{%>
				<%if(rs_temp.getString("sys_ver")==null||"".equals(rs_temp.getString("sys_ver"))){%>
				
				<%}else{%>
					<option value="<%=rs_temp.getString("sys_ver")%>"><%=rs_temp.getString("sys_ver")%></option>
				<%}%>
			<%}%>
		<%}%>
	  </select>
	  </td>

	</tr>

	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请人</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="proj_proposer" value="<%=rs.getString("proj_proposer")%>" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>内存大小(<font color="#FF0000">*</font>)：</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="mem_size" value="<%=rs.getInt("mem_size")%>G" class="text" disabled="disabled"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>磁盘大小(<font color="#FF0000">*</font>)：</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="disk_size" value="<%=rs.getInt("disk_size")%>G" class="text"></td>
	</tr>

	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请提交时间</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="apply_time" value="<%=rs.getDate("apply_time")%>&nbsp;<%=rs.getTime("apply_time")%>" disabled="disabled" class="text"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请状态</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="status" value="<%=rs.getString("status")%>" class="text" disabled="disabled"></td>
	</tr>

	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目代码</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="proj_code" value="<%=rs.getString("proj_code")%>" class="text" disabled="disabled"></td>
	</tr>
	  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="en"><strong>用途(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<textarea name="purpose" cols="56" rows="3"><%=rs.getString("purpose")%></textarea>
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="en"><strong>备注：</strong></td>
    <td width="78%" class="en">
	<textarea name="note" cols="56" rows="3"><%=rs.getString("note")%></textarea>
	</td>
  </tr>
</table>
<input type="hidden" name="apply_id" value="<%=request.getParameter("apply_id")%>">
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="button1">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1">&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="button1" onClick="return_back()"></div>
<%}%>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
