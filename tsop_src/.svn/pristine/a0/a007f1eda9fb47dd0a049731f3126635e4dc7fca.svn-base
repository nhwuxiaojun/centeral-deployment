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
ResultSet rs_temp;
String sql = new String();
String sql_temp = new String();
sql = "select distinct new_env from a_supply where env_status='DOING'";
rs = db.execSQL(sql);
%>

<script language="javascript">
var onecount;
onecount = 0;
subcat = [];
<%
sql_temp = "select distinct t1.*,t2.db_port_num from a_supply t1, a_db_svr_main t2 where env_status='DOING' and upper(t1.db_sid)=upper(t2.db_sid)";
rs_temp = db.execSQL(sql_temp);
int count = 0;
while(rs_temp.next()){
%>
subcat[<%=count%>] = ["<%=rs_temp.getString("new_env")%>","<%=rs_temp.getString("db_ip")%>:<%=rs_temp.getString("db_port_num")%>:<%=rs_temp.getString("db_sid")%>"];
<%
count++;
}
rs_temp.close();
%>
temp = <%=count%>;


function change(team_id){
    document.form1.DB_INFO.length = 0;
    var team_id = team_id;
    var i;
    for (i=0;i<temp;i++){
		if (subcat[i][0] == team_id){
			document.form1.DB_INFO.options[document.form1.DB_INFO.length] = new Option(subcat[i][1], subcat[i][1],false,false);
            //window.alert(document.form1.db_sid.length);
         	//window.alert(subcat[i][1]);
		}
    }
    document.form1.DB_INFO.options[0].selected = true;
	//window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
}
</script>


<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">环境表提交</span></strong></font>
</div>
<form name="form1" action="env_info_add_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境名</strong></td>
    <td class="en" width="63%">
	<select name="PROJ_ENV" onChange="change(document.form1.PROJ_ENV.options[document.form1.PROJ_ENV.selectedIndex].value)">
	  <option value="">请选择</option>
	  <%while(rs.next()){%>
	    <option value="<%=rs.getString("new_env")%>"><%=rs.getString("new_env")%></option>
      <%}%>
	</select>	</td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>webServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="WEB_INST_PATH" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>HTML路径</strong></td>
    <td class="en" width="63%"><input type="text" name="HTML_PATH" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer实例路径</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_INST_PATH" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>appServer console端口</strong></td>
    <td class="en" width="63%"><input type="text" name="APP_PORT" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库连接信息</strong></td>
    <td class="en" width="63%">
	<select name="DB_INFO">
		<option value="">请选择</option>
	</select>
	</td>
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
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>FTP登陆用户</strong></td>
    <td class="en" width="63%"><input type="text" name="FTP_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>FTP登陆密码</strong></td>
    <td class="en" width="63%"><input type="text" name="FTP_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>页面登陆地址</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_DNS" value="http://" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用备份目录</strong></td>
    <td class="en" width="63%">
    <textarea name="BACKUP_DIR" cols="30" rows="5"></textarea>
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
	<textarea name="startup_script" cols="30" rows="3"></textarea>
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
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">
</div>
</form>
<%
db.close();
rs.close();
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
	if(form1.BACKUP_DIR.value==""){
		alert("请输入备份目录检查");
		return;
	}
	form1.submit();
}
</script>
</html>
