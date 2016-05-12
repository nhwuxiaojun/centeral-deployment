<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>环境表提交</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
ResultSet rs;
ResultSet rs2;
ResultSet rs3;
String sql = new String();
String sql2 = new String();
String sql3 = new String();
String appSoft= new String();
String db_port="";
String app_port = "";
String app_path="";
String app_console="";
String con_user="";
String con_pwd="";


sql="select * from a_supply where id = " + request.getParameter("id");
rs=db.execSQL(sql);
while(rs.next()){

    String new_env=rs.getString("new_env");
    String owner_name=rs.getString("owner_name");
    String app_user=rs.getString("app_user");
	String app_dir=rs.getString("app_dir");
    if (!"".equals(new_env) && new_env != null) {  new_env=new_env.toLowerCase(); }
    if (!"".equals(owner_name) && owner_name != null) {  owner_name=owner_name.toLowerCase(); }
    if (!"".equals(app_user) && app_user != null) {  app_user=app_user.toLowerCase(); }
    if (!"".equals(app_dir) && app_dir != null) {  app_dir=app_dir.toLowerCase(); }
	
  	sql2 = "select * from a_apply where new_env = '" + rs.getString("new_env") + "'";
 	 rs2 = db.execSQL(sql2);
 	while(rs2.next()){
		appSoft = rs2.getString("app_soft");
		//proj_grp = rs2.getString("proj_grp");
		//proj_code = rs2.getInt("proj_code");
	 }
		 if (!"".equals(appSoft) && appSoft != null) {
				String appSoftLow = appSoft.toLowerCase();
				if (appSoftLow.indexOf("weblogic") == 0) {
					app_port = "7001";
					app_path = "/weblogic";
					con_user="weblogic";
					con_pwd="weblogic";
				} else if (appSoftLow.indexOf("tomcat") == 0) {
					app_port = "8080";
					app_path = "/tomcat";
					con_user="tomcat";
					con_pwd="tomcat";
				} else if (appSoftLow.indexOf("jues") == 0) {
					app_port = "9900";
					app_path = "/jues";
					con_user="jues";
					con_pwd="jues";					
				} else if (appSoftLow.indexOf("jboss") == 0) {
					app_port = "8093";
					app_path = "/jboss";
					con_user="admin";
					con_pwd="admin";					
				} else if (appSoftLow.indexOf("websphere") == 0) {
					app_port = "9043";
					app_path = "/websphere";
					con_user="admin";
					con_pwd="admin";					
				} else if (appSoftLow.indexOf("ias") == 0) {
					app_port = "6003";
					app_path = "/ias";
					con_user="ias10g";
					con_pwd="ias10g";	
				}
				//System.out.print(" app_port=" + app_port);
				//System.out.print(" app_path=" + app_path);

			}


%>

<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境表提交</span></strong></font>
</div>
<form name="form1" action="env_info_submit_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境名</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_ENV" value="<%=rs.getString("new_env")%>" readonly="true" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>webServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="WEB_INST_PATH" value="<%=app_dir%>/apache" class="en"   size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>HTML路径</strong></td>
    <td class="en" width="63%"><input type="text" name="HTML_PATH" value="<%=app_dir%>/html" class="en"  size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_INST_PATH" value="<%=app_dir+app_path%>" class="en"  size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer console端口</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_PORT" value="<%=app_port%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer console url</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_CONSOLE" value="<%=app_console%>" class="en" size="35"></td>
  </tr>
  	<%
	sql3 = " select distinct db_port_num from a_db_svr_main where db_sid = '" +rs.getString("db_sid") + "'";
    rs3 = db.execSQL(sql3);
    if(rs3.next()){
	  db_port = String.valueOf(rs3.getInt("db_port_num"));
    }
	%>
  
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接信息</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_INFO" value="<%=rs.getString("db_ip")+":"+db_port+":"+rs.getString("db_sid")%>" readonly="true" class="en" size="35"></td>
  </tr>
  
  
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接用户</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_USR" value="<%=owner_name%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接密码</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_PWD" value="<%=owner_name+"pwd"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境管理用户</strong></td>
    <td class="en" width="63%"><input type="text" name="ENV_USR" value="<%=app_user%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境管理密码</strong></td>
    <td class="en" width="63%"><input type="text" name="ENV_PWD" value="<%=app_user%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>控制台管理用户</strong></td>
    <td class="en" width="63%"><input type="text" name="CON_USR" value="<%=con_user%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>控制台管理密码</strong></td>
    <td class="en" width="63%"><input type="text" name="CON_PWD" value="<%=con_pwd%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>FTP登陆用户</strong></td>
    <td class="en" width="63%"><input type="text" name="FTP_USR" value="<%=app_user%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>FTP登陆密码</strong></td>
    <td class="en" width="63%"><input type="text" name="FTP_PWD" value="<%=app_user%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>页面登陆地址</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_DNS" value="http://<%=rs.getString("env_ip")%>" class="en" size="35"></td>
  </tr>
  
    <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>打印IP</strong></td>
    <td class="en" width="63%"><input type="text" name="print_ip"  class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>打印用户</strong></td>
    <td class="en" width="63%"><input type="text" name="print_user"  class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>打印密码</strong></td>
    <td class="en" width="63%"><input type="text" name="print_pwd"  class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>打印目录</strong></td>
    <td class="en" width="63%"><input type="text" name="print_dir" class="en" size="35"></td>
  </tr>
  
  
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DMS类型</strong></td>
    <td class="en" width="63%">	<%
	sql="select distinct dms_type from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="DMS_TYPE" class="select5">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("dms_type")!=null){%>
			<option value="<%=rs.getString("dms_type")%>"><%=rs.getString("dms_type")%></option>
		<%}%>
	<%}%>
	</select></td>
	
  </tr>
  
    <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Print类型</strong></td>
    <td class="en" width="63%">	<%
	sql="select distinct print_type from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="PRINT_TYPE" class="select5">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("print_type")!=null){%>
			<option value="<%=rs.getString("print_type")%>"><%=rs.getString("print_type")%></option>
		<%}%>
	<%}%>
	</select></td>
	
  </tr>
  
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用备份目录</strong></td>
    <td class="en" width="63%">
    <textarea name="BACKUP_DIR" cols="30"  rows="5"><%=app_dir%></textarea>
    </td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>rc.local启动脚本：</strong></td>
    <td width="78%" class="en">                  
	<textarea name="startup_script" cols="30"  rows="3">sh  <%=app_dir%>/restart.sh</textarea>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>备注：</strong></td>
    <td width="78%" class="en">
	<textarea name="NOTE" cols="30" rows="4"></textarea>
	</td>
  </tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">&nbsp;&nbsp;<input type="button" name="button1" value="返回" onClick="history.go(-1);">

</div>
</form>
<%}%>
<%
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function check(){
	if(form1.PROJ_ENV.value==""){
		alert("请输入项目环境名");
		return;
	}
	if(form1.WEB_INST_PATH.value==""){
		alert("请输入webServer实例路径");
		return;
	}
	if(form1.HTML_PATH.value==""){
		alert("请输入HTML路径");
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
	if(form1.APP_CONSOLE.value==""){
		alert("请输入appServer console URL");
		form1.APP_CONSOLE.focus();
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
	if(form1.BACKUP_DIR.value==""){
		alert("请输入备份目录检查");
		return;
	}
	if (confirm("确认提交？")) {
		form1.submit();
	}
}

function  showBackupDir(){
 // var WEB_INST_PATH = document.getElementById('WEB_INST_PATH').value;
 // var HTML_PATH =document.getElementById('HTML_PATH').value;
 // var APP_INST_PATH =document.getElementById('APP_INST_PATH').value;
 // document.getElementById('BACKUP_DIR').value=WEB_INST_PATH+";"+HTML_PATH+";"+APP_INST_PATH;

}
</script>


</html>

