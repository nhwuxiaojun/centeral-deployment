<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>我的应用环境信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35589746-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
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

function execPLSQL (db_info,db_username,db_password ) {
  var arr=db_info.split(":");
  var db_sid=arr[2];
  var command;
    var shell = new ActiveXObject("WScript.Shell");
 // command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Allround Automations\\PL/SQL Developer\\InstallPath");//从注册表获得软件安装路径    
   command = "C:\\Program Files\\PLSQL Developer\\";//从注册表获得软件安装路径

  // alert(command);
    command = command + "plsqldev.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('命令' + window._command + ' 已经被用户禁止！');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_sid);
  window.onerror = window.oldOnError;
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
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by mac_ip,proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' order by proj_env,env_ip";
			}
		}
	}else{
		if("".equals(request.getParameter("txt_env_ip"))){
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' order by proj_env,env_ip";
			}
		}else{
			if("".equals(request.getParameter("col_value"))){
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' order by proj_env,env_ip";
			}else{
				sql="select * from a_proj_env_svr where upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "' order by proj_env,env_ip";
			}
		}
	}
}else{
	sql="select * from a_proj_env_svr where  lower(env_state)= 'running' and  upper(creater) = '" + session.getAttribute("username").toString().trim().toUpperCase() + "' order by proj_env,env_ip";
}
System.out.println(sql);
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">我的环境信息查询</span></strong></font>
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
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
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
	  <td align="center" class="en" width="13%"><font color="#3333cc"><strong>环境名&详细信息</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>运行状态</strong></font></td>
	  <td align="center" class="en" width="12%"><font color="#3333cc"><strong>SSH</strong></font></td>
          <td align="center" class="en" width="10%"><font color="#3333cc"><strong>URL</strong></font></td>
          <td align="center" class="en" width="10%"><font color="#3333cc"><strong>DB</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>Console</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>修改</strong></font></td>
      <%if(flag==1){%>
      <td align="center" class="en" width="10%"><font color="#3333cc"><strong>删除</strong></font></td>
      <%}%>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="left" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
          <td align="left" class="en"><a href="env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>" target="_blank"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%></a>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<a href="javascript:" onclick="execSecureCRT('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>')"><font color="#3333cc">SSH</font></a>&nbsp;</td>
          <td align="center" class="en"><font color="#3333cc"><a href=<%=rs.getString("PROJ_DNS")%> target=_blank>
<% if (rs.getString("PROJ_DNS")==null||"null".equals(rs.getString("PROJ_DNS"))) {out.println("<font color=#ddddee>Null</font>");} else { out.print("<font color=#3333cc>Open</font>"); } %>
        </a></td>
          <td align="center" class="en"><font color="#3333cc">&nbsp;<a href="javascript:" onclick="execPLSQL('<%=rs.getString("DB_INFO")%>','<%=rs.getString("DB_USR")%>','<%=rs.getString("DB_PWD")%>')"><font color="#3333cc">Open</font></a>&nbsp;</td>
          <td align="center" class="en"><font color="#3333cc"><a href=<%=rs.getString("APP_CONSOLE")%> target=_blank>
<% if (rs.getString("APP_CONSOLE")==null||"null".equals(rs.getString("APP_CONSOLE"))) {out.println("<font color=#ddddee>Null</font>");} else { out.print("<font color=#3333cc>Open</font>"); } %>
</a></td>
	  <%if(rs.getString("CREATER").equals(session.getAttribute("username"))){%>
	  	<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
	  <%}else{%>
      	<%if(flag==1){%>
	  		<td align="center" bgcolor="#FCFCFC" class="en" nowrap>&nbsp;<a href="env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>"><font color="#3333cc">修改</font></a>&nbsp;</td>
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
		window.location = "env_info_delete.jsp?id=" + id;
	}
}

function execSecureCRT (env_ip,env_username,env_password ) {    
  var command;    
    var shell = new ActiveXObject("WScript.Shell");     
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");//从注册表获得软件安装路径    
    command = command + "SecureCRT.exe";    
  window.oldOnError = window.onerror;    
  window._command = command;    
  window.onerror = function (err) {    
    if (err.indexOf('utomation') != -1) {    
      alert('命令' + window._command + ' 已经被用户禁止！');     
      return true;    
    }    
    else return false;    
  };    
  var wsh = new ActiveXObject('WScript.Shell');    
  if (wsh)    
    wsh.Run("\""+command+"\""+"/PASSWORD "+env_password+" "+env_username+"@"+env_ip);
  window.onerror = window.oldOnError;    
}   

</script>
</html>
