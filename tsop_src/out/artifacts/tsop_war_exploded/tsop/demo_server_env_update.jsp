<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>服务器Dome环境更新</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;
sql = "select * from a_proj_env_svr where env_id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.MAC_IP.value==""){
		alert("请输入MAC IP");
		return;
	}
	if(form1.ENV_IP.value==""){
		alert("请输入环境IP");
		return;
	}
	//if(form1.PROJ_ENV.value==""){
		//alert("请输入项目环境名");
		//return;
	//}
	if(form1.WEB_INST_PATH.value==""){
		alert("请输入webServer实例路径");
		return;
	}
	if(form1.HTML_PATH.value==""){
		alert("请输入HTML路径");
		return;
	}
	if(form1.APP_NAME.value==""){
		alert("请输入appServer名称版本");
		return;
	}
	if(form1.APP_INST_PATH.value==""){
		alert("请输入appServer实例路径");
		return;
	}
	if(form1.APP_PORT.value==""){
		alert("请输入appServer绑定端口");
		return;
	}
	if(form1.DB_INFO.value==""){
		alert("请输入数据库连接信息");
		return;
	}
	if(form1.DB_USR.value==""){
		alert("请输入数据库连接用户");
		return;
	}
	if(form1.DB_PWD.value==""){
		alert("请输入数据库连接密码");
		return;
	}
	if(form1.ENV_USR.value==""){
		alert("请输入环境管理用户");
		return;
	}
	if(form1.ENV_PWD.value==""){
		alert("请输入环境管理密码");
		return;
	}
	if(form1.CON_USR.value==""){
		alert("请输入控制台管理用户");
		return;
	}
	if(form1.CON_PWD.value==""){
		alert("请输入控制台管理密码");
		return;
	}
	if(form1.FTP_USR.value==""){
		alert("请输入FTP登陆用户");
		return;
	}
	if(form1.FTP_PWD.value==""){
		alert("请输入FTP登陆密码");
		return;
	}
	if(form1.PROJ_GRP.value==""){
		alert("请输入环境项目属组");
		return;
	}
	//if(form1.PROJ_DNS.value==""){
		//alert("请输入环境域名");
		//return;
	//}
	if(form1.CREATER.value==""){
		alert("请输入环境创建人");
		return;
	}
	if(form1.CRT_DATE.value==""){
		alert("请输入环境创建日期");
		return;
	}
	if(form1.PROPOSER.value==""){
		alert("请输入环境申请人");
		return;
	}
	if(form1.ENV_STATE.value==""){
		alert("请输入环境运行状态");
		return;
	}
	if(form1.BACKUP_DIR.value==""){
		alert("请输入应用备份目录");
		return;
	}
	form1.submit();
}
function return_back(){
	window.location = "demo_server_env_list.jsp";
}
</script>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="demo_server_env_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">应用环境信息修改</span></strong></font>
</div>
<br><br>
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="70%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="MAC_IP" value="<%=rs.getString("MAC_IP")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="ENV_IP" value="<%=rs.getString("ENV_IP")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="30%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>项目环境名</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_ENV" value="<%=rs.getString("PROJ_ENV")%>" class="text" disabled="disabled">&nbsp;</font></td>
	</tr>
	<input type="hidden" name="PROJ_ENV" value="<%=rs.getString("PROJ_ENV")%>">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>webServer实例路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="WEB_INST_PATH" value="<%=rs.getString("WEB_INST_PATH")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>HTML路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="HTML_PATH" value="<%=rs.getString("HTML_PATH")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer名称版本</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <%
	  sql_temp = "select appsoft_ver from a_property where appsoft_ver is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	  <select name="APP_NAME">
	  	<option value="<%=rs.getString("APP_NAME")%>"><%=rs.getString("APP_NAME")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs.getString("APP_NAME").equals(rs_temp.getString("appsoft_ver"))){%>
			
			<%}else{%>
			<option value="<%=rs_temp.getString("appsoft_ver")%>"><%=rs_temp.getString("appsoft_ver")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;
	  <%rs_temp.close();%>
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer实例路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="APP_INST_PATH" value="<%=rs.getString("APP_INST_PATH")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer绑定端口</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="APP_PORT" value="<%=rs.getString("APP_PORT")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接信息</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_INFO" value="<%=rs.getString("DB_INFO")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_USR" value="<%=rs.getString("DB_USR")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_PWD" value="<%=rs.getString("DB_PWD")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境管理用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="ENV_USR" value="<%=rs.getString("ENV_USR")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境管理密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="ENV_PWD" value="<%=rs.getString("ENV_PWD")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>控制台管理用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CON_USR" value="<%=rs.getString("CON_USR")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>控制台管理密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CON_PWD" value="<%=rs.getString("CON_PWD")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>FTP登陆用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="FTP_USR" value="<%=rs.getString("FTP_USR")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>FTP登陆密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="FTP_PWD" value="<%=rs.getString("FTP_PWD")%>" class="text">&nbsp;</font></td>
	</tr>
	  <%
	  sql_temp = "select distinct proj_grp from a_env_name where proj_grp is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境项目属组</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="PROJ_GRP">
	  	<option value="<%=rs.getString("PROJ_GRP")%>"><%=rs.getString("PROJ_GRP")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs_temp.getString("PROJ_GRP").equals(rs.getString("PROJ_GRP"))){%>
			
			<%}else{%>
			<option value="<%=rs_temp.getString("PROJ_GRP")%>"><%=rs_temp.getString("PROJ_GRP")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>页面登陆地址</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_DNS" value="<%=rs.getString("PROJ_DNS")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境创建人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CREATER" value="<%=rs.getString("CREATER")%>" class="text">&nbsp;</font></td>
	  <input type="hidden" name="CREATER" value="<%=rs.getString("CREATER")%>">
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境创建日期</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CRT_DATE" value="<%=rs.getDate("CRT_DATE")%>" class="text" onFocus="show_cele_date(CRT_DATE,'','',CRT_DATE)">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境申请人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROPOSER" value="<%=rs.getString("PROPOSER")%>" class="text">&nbsp;</font></td>
	</tr>
	  <%
	  sql_temp = "select distinct proj_status from a_property where proj_status is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	  <select name="ENV_STATE">
	  	<option value="<%=rs.getString("ENV_STATE")%>"><%=rs.getString("ENV_STATE")%></option>
		<%while(rs_temp.next()){%>
			<%if(rs_temp.getString("proj_status").equals(rs.getString("ENV_STATE"))){%>
			
			<%}else{%>
			<option value="<%=rs_temp.getString("proj_status")%>"><%=rs_temp.getString("proj_status")%></option>
			<%}%>
		<%}%>
	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>项目代码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_CODE" value="<%=rs.getInt("PROJ_CODE")%>" class="text">&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>应用备份目录</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
      <textarea name="BACKUP_DIR" cols="30" rows="5"><%=Tools.msNull(rs.getString("BACKUP_DIR"))%></textarea>
      </td>
	</tr>
  	<tr> 
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>备注</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
	  <textarea name="NOTE" cols="30" rows="5"><%=Tools.msNull(rs.getString("NOTE"))%></textarea>
	  </td>
  	</tr>
	<input type="hidden" name="PROJ_CODE" value="<%=rs.getInt("PROJ_CODE")%>">
</table>
<input type="hidden" name="ENV_ID" value="<%=request.getParameter("id")%>">
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="but">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="but">&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="but" onClick="return_back()"></div>
<%}%>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
