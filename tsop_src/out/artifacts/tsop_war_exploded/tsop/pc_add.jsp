<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>PC机新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text1
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
.text2
{
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
    border-right-color:Black;
}
.text3
{
    font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 19px;
	border: 1px solid #000000;
	padding-top:2px;
	font-family: Verdana;
}
.button1
{
    height:14pt;
    width:30pt;
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
.select1
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 70px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select2 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 100px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select3 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 60px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select4 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 80px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select5 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 140px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select6
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 360px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select7
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 120px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
%>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<%
	sql="select * from a_env_name";
	rs=db.execSQL(sql);
%>

<body><%@include file="includes/head.html" %>
<br>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC机新增（<font color="#FF0000">*</font>项为必填）</span></strong></font>
</div>

<form name="form1" action="pc_add_finish.jsp" method="post" class="en">
<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>主机IP(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="host_ip" value="" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>资产编号：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="asset" value="" class="text2">
	</td>
  </tr>  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>管理员用户名(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="admin_user" value="" class="text2">
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>管理员密码(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="pwd" value="" class="text2">
	</td>
  </tr>
    <!--tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目名称：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_name" value="" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目代码：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_code" value="" class="text2">
	</td>
  </tr>
    </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>用途：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="purpose" value="" class="text2">
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>TS Owner：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="ts_owner" value="" class="text2">
	</td>
  </tr>
    </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>申请人：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="apply_owner" value="" class="text2">
	</td>
  </tr-->
  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>系统平台(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct sys_ver from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="sys_type" class="select6">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("sys_ver")!=null){%>
			<option value="<%=rs.getString("sys_ver")%>"><%=rs.getString("sys_ver")%></option>
		<%}%>
	<%}%>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>CPU情况(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en"><input type="text" name="cpu_size" value="" size=50 class="text2"></td>
  </tr>  

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>内存(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="mem_size" value="" class="text2">G
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>磁盘大小(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="disk_size" value="" class="text2">G
	</td>
  </tr>    
 <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>虚拟机物理IP：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="vm_mac_ip" value="" class="text2">PC机不需要填写
	</td>
  </tr>  
 <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>所在位置：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="location" value="" class="text2">VM不需要填写
	</td>
  </tr>  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>状态(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct is_free from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="status" class="select6">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("is_free")!=null){%>
			<option value="<%=rs.getString("is_free")%>"><%=rs.getString("is_free")%></option>
		<%}%>
	<%}%>
	</select>
	</td>
  </tr>				
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>机器类型(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct svr_type from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="server_type" class="select6">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("svr_type")!=null){%>
			<option value="<%=rs.getString("svr_type")%>"><%=rs.getString("svr_type")%></option>
		<%}%>
	<%}%>
	</select>
	</td>
  </tr>	

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>备注：</strong></td>
    <td width="78%" class="en">
	<textarea name="note" cols="56" rows="3"></textarea>
	</td>
  </tr>
</table>
<br><br>
<div align="center">
<input type="button" name="button1" class="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="重置">
&nbsp;&nbsp;<input type="button" name="button2" value="返回" onClick="return_back()" class="button1"></div>
</form>
<%
db.close();
rs.close();
%>
</body>
<script language="JavaScript">
function IsNumber(str){
	for(i=0;i<str.length;i++){
       	if(str.charAt(i)<'0' || str.charAt(i)>'9')
            return false;
    }
    return true;
}
function check(){
	if(form1.host_ip.value==""){
		alert("请输入IP");
		form1.host_ip.focus();
		return;
	}
	if(form1.admin_user.value==""){
		alert("请输入管理员用户名");
		form1.admin_user.focus();
		return;
	}
	if(form1.pwd.value==""){
		alert("请输入管理员用户密码");
		form1.pwd.focus();
		return;
	}

	if(form1.sys_type.value==""){
		alert("请输入系统平台");
		form1.sys_type.focus();
		return;
	}
	if(form1.mem_size.value==""){
		alert("请输入内存大小");
		form1.mem_size.focus();
		return;
	}
	if(form1.disk_size.value==""){
		alert("请输入磁盘空间大小");
		form1.disk_size.focus();
		return;
	}
	if(form1.cpu_size.value==""){
		alert("请输入CPU情况");
		form1.cpu_size.focus();
		return;
	}
	
	if(form1.status.value==""){
		alert("请选择状态");
		form1.status.focus();
		return;
	}
	
   form1.submit();

}

function return_back(){
	window.location = "pc_list.jsp";
}

</script>
</html>
