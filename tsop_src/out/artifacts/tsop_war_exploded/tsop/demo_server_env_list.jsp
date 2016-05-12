<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>服务器Dome环境查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.txt_env_ip.value==""&&form1.col_value.value==""){
		alert("请至少输入一项查询条件！");
		return;
	}
	form1.submit();
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
ResultSet rs;
int flag = 0;
sql = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
rs = db.execSQL(sql);
while(rs.next()){
	if("2".equals(rs.getString("valid"))){
		flag = 1;
	}else{
		flag = 0;
	}
}
if("y".equals(request.getParameter("flag"))){
	if(request.getParameter("txt_env_state")==null||"".equals(request.getParameter("txt_env_state"))){
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(proj_env) like '%DEMO%'  or  upper(proj_env) like '%MOT%'  or  upper(proj_env) like '%POC%' order by mac_ip,proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%') order by mac_ip,proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%')  order by mac_ip,proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%') order by mac_ip,proj_env,env_ip";
			}
		}
	}else{
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(proj_env) like '%DEMO%'  or  upper(proj_env) like '%MOT%'  or  upper(proj_env) like '%POC%' order by mac_ip,proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%') order by mac_ip,proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%') order by mac_ip,proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' and (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%')  order by mac_ip,proj_env,env_ip";
			}
		}
	}
}else{
	sql="select * from a_proj_env_svr where (upper(proj_env) like '%DEMO%' or upper(proj_env) like '%MOT%' or upper(proj_env) like '%POC%')  and rownum<11 order by mac_ip,proj_env,env_ip";
}
System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">服务器Dome环境查询</span></strong></font>
</div>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td align="center" class="en">
		<select name="env_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en">
		<%if("".equals(request.getParameter("txt_env_ip"))||request.getParameter("txt_env_ip")==null){%>
			<input type="text" name="txt_env_ip" value="" class="en" size="8">
		<%}else{%>
			<input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="en" size="8">
		<%}%>
		</td>
		<td align="center" class="en">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="env_state">环境运行状态</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
                <option value="app_name">中间件类型</option>
				<%}%>
				<%if("app_name".equals(request.getParameter("col_name"))){%>
                <option value="app_name">中间件类型</option>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en" size="8">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en" size="8">
		<%}%>
		</td>
		<td align="center" class="en">
		<select name="env_state" class="en">
			<option value="环境运行状态">环境运行状态</option>
		</select>
        </td>
        <td align="center" class="en">
		<select name="txt_env_state" class="en">
        	<%if("".equals(request.getParameter("txt_env_state"))||request.getParameter("txt_env_state")==null){%>
			<option value="">all</option>
            <option value="running">running</option>
            <option value="stopped">stopped</option>
            <%}else{%>
            	<%if("running".equals(request.getParameter("txt_env_state"))){%>
            	<option value="running">running</option>
            	<option value="stopped">stopped</option>
                <option value="">all</option>
                <%}%>
            	<%if("stopped".equals(request.getParameter("txt_env_state"))){%>
            	<option value="stopped">stopped</option>
            	<option value="running">running</option>
                <option value="">all</option>
                <%}%>
            <%}%>
		</select>        
        </td>
		<td align="center" class="en"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td width="17%" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>详细</strong></font></td>
	  <td align="center" class="en" width="14%"><font color="#3333cc"><strong>修改</strong></font></td>
      <%if(flag==1){%>
      <td align="center" class="en" width="14%"><font color="#3333cc"><strong>删除</strong></font></td>
      <%}%>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank"><font color="#3333cc">详细</font></a>&nbsp;</td>
	  <%if(rs.getString("CREATER").toLowerCase().equals(session.getAttribute("username").toString().toLowerCase())){%>
	  	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="demo_server_env_detail.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <%}else{%>
      	<%if(flag==1){%>
	  		<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="demo_server_env_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
        <%}else{%>
        	<td width="1%" align="center" bgcolor="#FCFCFC" class="en">&nbsp;</td>
        <%}%>
	  <%}%>
      <%if(flag==1){%>
      	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="#" onClick="del(<%=rs.getInt("ENV_ID")%>)"><font color="#3333cc">删除</font></a>&nbsp;</td>
      <%}%>
    </tr>
	<%}%>
</table>

<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="javascript">
function del(id){
	var a = confirm("确认要删除吗？");
	if(a==true){
		window.location = "demo_server_env_delete.jsp?id=" + id;
	}
}
</script>
</html>
