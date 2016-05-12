<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>内部资产信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_proj_name.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
}

function add(){
	window.location = "pc_add.jsp";
}

</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql2 = new String();
ResultSet rs = null;
ResultSet rs2 = null;
String sql_user = new String();
ResultSet rs_user;
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_proj_name"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_pc_info where 1=1 order by host_ip";
		}else{
			sql="select * from a_pc_info where upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%' order by host_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_pc_info where upper(proj_name) like '%"+request.getParameter("txt_proj_name").toString().toUpperCase()+"%'  order by host_ip";
		}else{
			sql="select * from a_pc_info where upper(proj_name) like '%"+request.getParameter("txt_proj_name").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'  order by host_ip";
		}
	}
}else{
	sql="select * from a_pc_info where rownum<11 order by host_ip";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC机信息查询</span></strong></font>
</div>
<br><br>
<form name="form1" action="" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td align="center" class="en" width="15%">
		<select name="proj_name" class="en">
			<option value="项目名">项目名</option>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("txt_proj_name"))||request.getParameter("txt_proj_name")==null){%>
			<input type="text" name="txt_proj_name" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="txt_proj_name" value="<%=request.getParameter("txt_proj_name")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="15%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="host_ip">主机IP</option>
				<option value="status">使用状态</option>
				<option value="server_type">服务器类型</option>
			<%}else{%>
				<%if("host_ip".equals(request.getParameter("col_name"))){%>
				<option value="host_ip">主机IP</option>
				<option value="status">使用状态</option>
				<option value="server_type">服务器类型</option>
				<%}%>
				<%if("status".equals(request.getParameter("col_name"))){%>
				<option value="status">使用状态</option>
				<option value="host_ip">主机IP</option>
				<option value="server_type">服务器类型</option>
				<%}%>
				<%if("server_type".equals(request.getParameter("col_name"))){%>
				<option value="server_type">服务器类型</option>
				<option value="host_ip">主机IP</option>
				<option value="status">使用状态</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="10">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="10">
		<%}%>
		</td>
		<td align="center" class="en" width="30%"><input type="button" name="button1" value="查询" class="en" onClick="check()">
		<%sql2="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
		<%rs2=db.execSQL(sql2);%>
		<%while(rs2.next()){%>
  			<%if("2".equals(rs2.getString("valid"))){%>
				&nbsp;<input type="button" name="button2" value="新增" class="en" onClick="add()">&nbsp;
			<%}else{%>

			<%}%>
		<%}%>
        </td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<form name="form2" action="" method="post">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>主机IP</strong></font></td>
	  <td width="20%" align="center" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>使用状态</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>服务器类型</strong></font></td>
	  <td width="15%" align="center" class="en"><font color="#3333cc"><strong>项目名</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>CPU类型</strong></font></td>
	  <td width="10%" align="center" class="en"><font color="#3333cc"><strong>内存</strong></font></td>
      <td width="15%" align="center" class="en"><font color="#3333cc"><strong>详细</strong></font></td>
	  <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
	  <%rs_user = db.execSQL(sql_user);%>
	  <%while(rs_user.next()){%>
	  	<%if("2".equals(rs_user.getString("valid"))){%>
	  		<td width="10%" align="center" class="en"><font color="#3333cc"><strong>修改</strong></font></td>
			<td width="10%" align="center" class="en"><font color="#3333cc"><strong>删除</strong></font></td>
	  	<%}%>
	  <%}%>
    </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("host_ip")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("vm_mac_ip")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("server_type")%>&nbsp;</font></td>
	   <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_name")%>&nbsp;</font></td>
	 <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("cpu_size")%>&nbsp;</font></td>
	 <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("mem_size")%>G&nbsp;</font></td>
       <td align="center" >&nbsp;<a href="pc_detail.jsp?host_id=<%=rs.getInt("host_id")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
	  <%rs_user = db.execSQL(sql_user);%>
	  <%while(rs_user.next()){%>
	  	<%if("2".equals(rs_user.getString("valid"))){%>
		    <td align="center">&nbsp;<a href="pc_update.jsp?host_id=<%=rs.getInt("host_id")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  		<td align="center">&nbsp;<a href="pc_del.jsp?host_id=<%=rs.getInt("host_id")%>"><font color="#3333cc">删除</font></a>&nbsp;</td>
	  	<%}%>
	  <%}%>
	</tr>
	<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
