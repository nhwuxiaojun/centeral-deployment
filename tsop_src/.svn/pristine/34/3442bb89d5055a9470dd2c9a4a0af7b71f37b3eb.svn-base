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
%>


<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境表提交</span></strong></font>
</div>
<form name="form1" action="env_info_submit_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境名</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_ENV" value="" readonly="true" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>webServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="WEB_INST_PATH" value="" class="en"   size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>HTML路径</strong></td>
    <td class="en" width="63%"><input type="text" name="HTML_PATH" value="/html" class="en"  size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_INST_PATH" value="" class="en"  size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer console端口</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_PORT" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer console url</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_CONSOLE" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接信息</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_INFO" value="" readonly="true" class="en" size="35"></td>
  </tr>
  
  
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接用户</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接密码</strong></td>
    <td class="en" width="63%"><input type="text" name="DB_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境管理用户</strong></td>
    <td class="en" width="63%"><input type="text" name="ENV_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境管理密码</strong></td>
    <td class="en" width="63%"><input type="text" name="ENV_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>控制台管理用户</strong></td>
    <td class="en" width="63%"><input type="text" name="CON_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>控制台管理密码</strong></td>
    <td class="en" width="63%"><input type="text" name="CON_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>页面登陆地址</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_DNS" value="http://" class="en" size="35"></td>
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
    <td class="en" width="63%">	
	</td>
	
  </tr>
  
    <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Print类型</strong></td>
    <td class="en" width="63%">	
	</select></td>
	
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
	<textarea name="startup_script" cols="30"  rows="3">sh  restart.sh</textarea>
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
<%
db.close();
%>
</body>
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

