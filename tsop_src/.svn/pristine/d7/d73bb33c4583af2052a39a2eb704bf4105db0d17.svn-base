<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>change password</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="media.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}
.text
{
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
.button1
{   height:16pt;
    width:35pt;
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
.style1 {
	font-size: 9px;
	color: #000000;
}
.style3 {color: #000000; font-size: 12px; }
.style5 {color: #000000; font-size: 14px; }
-->
</style></head>
<body class="style3">
<%
if("Y".equals(request.getParameter("flag"))){
  DBean db = new DBean();
  ResultSet rs;
  String sql1 = new String();
  String sql2 = new String();
  int i=0;
  String username = new String();
  String oldpassword = new String();
  String newpassword1 = new String();
  String newpassword2 = new String();
  username = request.getParameter("username");
  oldpassword = request.getParameter("oldpassword");
  newpassword1 = request.getParameter("newpassword1");
  newpassword2 = request.getParameter("newpassword2");
  sql1="select * from a_user where usr = '" + username + "' and pwd = '" + oldpassword + "'";
  rs=db.execSQL(sql1);
  while(rs.next()){
    sql2="update a_user set pwd = '" + newpassword1 + "' where usr = '" + username + "'";
    i=db.execUpdate(sql2);
  }
  db.close();
  rs.close();
  if(i==1){
    out.print("<br><div align=\"center\" class=\"style3\"><font color=\"red\" size=\"2\">密码修改成功！</font></div>");
  }else{
    out.print("<br><div align=\"center\" class=\"style3\"><font color=\"red\" size=\"2\">密码修改失败！</font></div>");
  }
}
%>
<br>
<div align="center" class="style5">密码修改</div>
<br>
<table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
<form name="form1" action="" method="post">
<tr><td width="30%" align="center" class="style3">用户名</td>
<td width="70%" align="center"><input type="text" class="text" name="username" value=""></td></tr>
<tr><td align="center" class="style3">原密码</td>
<td align="center"><input type="password" class="text" name="oldpassword" value=""></td></tr>
<tr><td align="center" class="style3">新密码（至少六位）</td>
<td align="center"><input type="password" class="text" name="newpassword1" value=""></td></tr>
<tr><td align="center" class="style3">新密码确认</td>
<td align="center"><input type="password" class="text" name="newpassword2" value=""></td></tr>
</table>
<br>
<input type="hidden" name="flag" value="Y">
<div align="center">
<input type="button" name="button1" value="确定" class="button1" onClick="check_form()">
<input type="button" name="button2" value="关闭" class="button1" onClick="close_window()">
</div>
</form>
</body>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check_form();
	}
</script>
<script language="javascript">
function check_form(){
	if(form1.username.value==""){
		alert("用户名不能为空！");
		form1.username.focus();
		return;
	}
	if(form1.oldpassword.value==""){
		alert("原密码不能为空！");
		form1.oldpassword.focus();
		return;
	}
	if(form1.newpassword1.value==""){
		alert("新密码不能为空！");
		form1.newpassword1.focus();
		return;
	}
	if(form1.newpassword1.value.length<=5){
		alert("新密码至少六位！");
		form1.newpassword1.focus();
		return;
	}
	if(form1.newpassword2.value==""){
		alert("新密码确认不能为空！");
		form1.newpassword2.focus();
		return;
	}
	if(form1.newpassword1.value!=form1.newpassword2.value){
		alert("新密码和新密码确认不一致！");
		form1.newpassword2.focus();
		return;
	}
	form1.submit();
}
function close_window(){
	window.close();
}
</script>
</html>
