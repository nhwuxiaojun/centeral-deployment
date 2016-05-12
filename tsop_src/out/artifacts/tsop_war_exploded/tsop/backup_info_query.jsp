<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>环境备份信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value.value==""){
		alert("请输入查询条件！");
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
if("y".equals(request.getParameter("flag"))){
	if("mac_ip".equals(request.getParameter("col_name"))){
		sql = "select * from (select e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path,max(trim(f.bk_path)) bk_tape_path from (select a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type,max(trim(d.bk_path)) bk_path from (select mac_ip,env_ip,proj_env,web_inst_path path,'web' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,html_path path, 'html' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,app_inst_path path, 'app' path_type from a_proj_env_svr where LOWER(env_state)='running') a left outer join a_bk_policy d on a.path like trim(d.bk_path)||'%' and a.mac_ip = d.svr_ip and d.bk_style='DISK_BK' group by a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type) e left outer join a_bk_policy f on e.path like trim(f.bk_path)||'%' and e.mac_ip = f.svr_ip and f.bk_style='TAPE_BK' group by e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path) g where mac_ip like '%" + request.getParameter("col_value") + "%' order by g.mac_ip,g.env_ip,g.proj_env";
	}
	if("env_ip".equals(request.getParameter("col_name"))){
		sql = "select * from (select e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path,max(trim(f.bk_path)) bk_tape_path from (select a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type,max(trim(d.bk_path)) bk_path from (select mac_ip,env_ip,proj_env,web_inst_path path,'web' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,html_path path, 'html' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,app_inst_path path, 'app' path_type from a_proj_env_svr where LOWER(env_state)='running') a left outer join a_bk_policy d on a.path like trim(d.bk_path)||'%' and a.mac_ip = d.svr_ip and d.bk_style='DISK_BK' group by a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type) e left outer join a_bk_policy f on e.path like trim(f.bk_path)||'%' and e.mac_ip = f.svr_ip and f.bk_style='TAPE_BK' group by e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path) g where env_ip like '%" + request.getParameter("col_value") + "%' order by g.mac_ip,g.env_ip,g.proj_env";
	}
	if("proj_env".equals(request.getParameter("col_name"))){
		sql = "select * from (select e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path,max(trim(f.bk_path)) bk_tape_path from (select a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type,max(trim(d.bk_path)) bk_path from (select mac_ip,env_ip,proj_env,web_inst_path path,'web' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,html_path path, 'html' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,app_inst_path path, 'app' path_type from a_proj_env_svr where LOWER(env_state)='running') a left outer join a_bk_policy d on a.path like trim(d.bk_path)||'%' and a.mac_ip = d.svr_ip and d.bk_style='DISK_BK' group by a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type) e left outer join a_bk_policy f on e.path like trim(f.bk_path)||'%' and e.mac_ip = f.svr_ip and f.bk_style='TAPE_BK' group by e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path) g where upper(g.proj_env) like '%" + request.getParameter("col_value").toString().toUpperCase() + "%' order by g.mac_ip,g.env_ip,g.proj_env";
	}
}else{
	sql = "select * from (select e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path,max(trim(f.bk_path)) bk_tape_path from (select a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type,max(trim(d.bk_path)) bk_path from (select mac_ip,env_ip,proj_env,web_inst_path path,'web' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,html_path path, 'html' path_type from a_proj_env_svr where LOWER(env_state)='running' union select mac_ip,env_ip,proj_env,app_inst_path path, 'app' path_type from a_proj_env_svr where LOWER(env_state)='running') a left outer join a_bk_policy d on a.path like trim(d.bk_path)||'%' and a.mac_ip = d.svr_ip and d.bk_style='DISK_BK' group by a.mac_ip,a.env_ip,a.proj_env,a.path,a.path_type) e left outer join a_bk_policy f on e.path like trim(f.bk_path)||'%' and e.mac_ip = f.svr_ip and f.bk_style='TAPE_BK' group by e.mac_ip,e.env_ip,e.proj_env,e.path,e.path_type,e.bk_path) g where rownum <= 10 order by g.mac_ip,g.env_ip,g.proj_env";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong>
  <span class="s105">环境备份信息查询</span></strong></font>
</div>
<form name="form1" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="mac_ip">物理IP</option>
				<option value="env_ip">环境IP</option>
				<option value="proj_env">项目环境名</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="mac_ip">物理IP</option>
				<option value="env_ip">环境IP</option>
				<option value="proj_env">项目环境名</option>
				<%}%>
				<%if("env_ip".equals(request.getParameter("col_name"))){%>
				<option value="env_ip">环境IP</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="env_ip">环境IP</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="en">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="20%"><input type="button" name="button1" value="查询" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<hr>
<table width="98%" style="table-layout: fixed" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr bgcolor="#D2D2D2">
	  <td width="18%" align="center" class="en"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="18%" align="center" class="en"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td width="40%" align="center" class="en"><font color="#3333cc"><strong>环境名称</strong></font></td>
	  <td width="8%" align="center" class="en"><font color="#3333cc"><strong>备份类型</strong></font></td>
	  <td width="8%" align="center" class="en"><font color="#3333cc"><strong>磁盘备份</strong></font></td>
	  <td width="8%" align="center" class="en"><font color="#3333cc"><strong>磁带备份</strong></font></td> 
  </tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("mac_ip")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_ip")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_env")%></font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("path_type")%></font></td>
	  <%if("".equals(rs.getString("bk_path"))||rs.getString("bk_path")==null){%>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;no&nbsp;</font></td>
	  <%}else{%>
	  <td align="center" class="en" title="<%=rs.getString("bk_path")%>"><font color="#3333cc">&nbsp;yes&nbsp;</font></td>
	  <%}%>
	  <%if("".equals(rs.getString("bk_tape_path"))||rs.getString("bk_tape_path")==null){%>
	  <td width="114" align="center" class="en"><font color="#3333cc">&nbsp;no&nbsp;</font></td>
	  <%}else{%>
	  <td width="140" align="center" class="en" title="<%=rs.getString("bk_tape_path")%>"><font color="#3333cc">&nbsp;yes&nbsp;</font></td>
	  <%}%>
	</tr>
	<%}%>
</table>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
