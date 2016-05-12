<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>PC/VM申请管理</title>
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
	if(form1.txt_ts_owner.value==""&&form1.txt_submit_datetime.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}
//function test_alert(){
	//alert("OK");
//}
function add(){
	window.location="pc_apply.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script src="js/calendar3.js"></script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql_user = new String();
ResultSet rs;
ResultSet rs_user;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_ts_owner"))){
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_pc_apply order by apply_id desc";
		}else{
			sql = "select * from a_pc_apply where sysdate - apply_time <= " + request.getParameter("txt_submit_datetime") + " order by apply_id desc";
		}
	}else{
		if("".equals(request.getParameter("txt_submit_datetime"))){
			sql = "select * from a_pc_apply where upper(ts_owner) like '%" + Tools.toGB(request.getParameter("txt_ts_owner").toString().trim()).toUpperCase() + "%' order by apply_id desc";
		}else{
			sql = "select * from a_pc_apply where upper(ts_owner) like '%" + Tools.toGB(request.getParameter("txt_ts_owner").toString().trim()).toUpperCase() + "%' and sysdate - apply_time <= " + request.getParameter("txt_submit_datetime") + " order by apply_id desc";
		}
	}
}else{
	sql = "select * from (select * from a_pc_apply order by apply_time desc) where rownum < 11";
}
//System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC/VM申请</span></strong></font>
</div>
<form name="form1" action="" method="post">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td align="center" width="20%">
		TS OWNER
		</td>
		<td align="center" width="20%">
		<%if("".equals(request.getParameter("txt_ts_owner"))||request.getParameter("txt_ts_owner")==null){%>
			<input type="text" name="txt_ts_owner" value="">
		<%}else{%>
			<input type="text" name="txt_ts_owner" value="<%=Tools.toGB(request.getParameter("txt_ts_owner"))%>">
		<%}%>
		</td>
		<td align="center" width="20%">
		提交日期
		</td>
		<td align="center" width="20%">
			<select name="txt_submit_datetime">
            <%if("".equals(request.getParameter("txt_submit_datetime"))||request.getParameter("txt_submit_datetime")==null){%>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("1".equals(request.getParameter("txt_submit_datetime"))){%>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("2".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="2">近2天</option>
            	<option value="1">近1天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("3".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="3">近3天</option>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("7".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="7">近1周</option>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("14".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="14">近2周</option>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="30">近1月</option>
                <option value="3650">全部</option>
            <%}else if("30".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="30">近1月</option>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="3650">全部</option>
            <%}else if("3650".equals(request.getParameter("txt_submit_datetime"))){%>
                <option value="3650">全部</option>
            	<option value="1">近1天</option>
                <option value="2">近2天</option>
                <option value="3">近3天</option>
                <option value="7">近1周</option>
                <option value="14">近2周</option>
                <option value="30">近1月</option> 
            <%}%>
            </select>
		</td>
		<td align="center" width="20%">&nbsp;&nbsp;<input type="button" name="button1" value="查询" class="button1" onClick="check()">&nbsp;&nbsp;<input type="button" name="button2" value="新增" class="button1" onClick="add()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" width="18%"><font color="#3333cc"><strong>TS</strong></font></td>
	  <td align="center" width="18%"><font color="#3333cc"><strong>项目组</strong></font></td>
	  <td align="center" width="15%"><font color="#3333cc"><strong>申请提交时间</strong></font></td>
	  	  <td align="center" width="15%"><font color="#3333cc"><strong>内存大小</strong></font></td>
	  <td align="center" width="15%"><font color="#3333cc"><strong>状态</strong></font></td>
	
	  <td align="center" width="10%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
	  <%rs_user = db.execSQL(sql_user);%>
	  <%while(rs_user.next()){%>
	  	<%if("2".equals(rs_user.getString("valid"))){%>
	  		<td align="center" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>
	  	<%}%>
	  <%}%>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("ts_owner")%>&nbsp;</font></td>
	   <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("proj_name")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>&nbsp;</font></td>
	  <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("mem_size")%>G&nbsp;</font></td>
	  <%if("DONE".equals(rs.getString("status").toUpperCase())){%>
      	<td align="center"><font color="#006600">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
      <%}else if("DOING".equals(rs.getString("status").toUpperCase())){%>
      	<td align="center"><font color="#FF0000">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
      <%}else if("TEMP".equals(rs.getString("status").toUpperCase())){%>
      	<td align="center"><font color="#0000FF">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
      <%}else{%>
      	<td align="center"><font color="#000000">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
      <%}%>
	  <td align="center" >&nbsp;<a href="pc_apply_detail.jsp?apply_id=<%=rs.getInt("apply_id")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
	  <%rs_user = db.execSQL(sql_user);%>
	  <%while(rs_user.next()){%>
	  	<%if("2".equals(rs_user.getString("valid"))){%>
	  		<td align="center">&nbsp;<a href="pc_apply_del.jsp?apply_id=<%=rs.getInt("apply_id")%>"><font color="#3333cc">删除</font></a>&nbsp;</td>
	  	<%}%>
	  <%}%>
    </tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<%rs_user.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>

