<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>搭建申请答复提交</title>
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
	width:400
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
	width: 170px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select2 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 120px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select3 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 100px;
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
	width: 100px;
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
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar.js" language="javascript" type="text/javascript"></script>

<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
String sql5 = new String();
sql5 = "select * from ts_db order by db_ip,db_sid";
ResultSet rs5;
ResultSet rs;
ResultSet rs_temp;
%>

<script type="text/javascript">
var onecount;
onecount = 0;
subcat = [];
<%
rs5 = db.execSQL(sql5);
int count = 0;
while(rs5.next()){
%>
subcat[<%=count%>] = ["<%=rs5.getString("db_ip").trim()%>","<%=rs5.getString("db_sid").trim()%>"];
<%
count++;
}
rs5.close();
%>
temp = <%=count%>;
function change(team_id){
    document.form1.db_sid.length = 0;
    var team_id=team_id;
    var i;
    for (i=0;i<temp;i++){
		if (subcat[i][0]==team_id){
			document.form1.db_sid.options[document.form1.db_sid.length] = new Option(subcat[i][1], subcat[i][1],false,false);
            //window.alert(document.form1.db_sid.length);
         	//window.alert(subcat[i][1]);
        }
    }
	document.form1.db_sid.options[0].selected = true;
	//window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
}
</script>

<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">申请答复</span></strong></font>
</div>

<form name="form1" action="project_apply_add_finish.jsp" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>

<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>新环境名称：</strong></td>
	<%
	sql=" select  new_env from a_apply where status='DOING'  and apply_type is null order by new_env";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="78%">
	<select name="new_env" class="select1" onChange="change_env()">
	<option value="">请选择</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString("new_env")%>"><%=rs.getString("new_env")%></option>
	<%}%>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>搭建环境服务器：</strong></td>
	<%
	sql="select distinct mac_ip from a_hardware";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="78%">
<div style="position:relative;">
  <select name="mac_ip" style="width:120px;" onchange="document.getElementById('input1').value=this.value">
	<option value="">请选择</option>
        <%while(rs.next()){%>
                <option value="<%=rs.getString("mac_ip")%>"><%=rs.getString("mac_ip")%></option>
        <%}%>
  </select>
  <input id="input1" name="input1" style="position:absolute;width:99px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
</div>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用使用IP：</strong></td>
    <td width="78%" class="en">
<div style="position:relative;">
        <%
        sql="select distinct ip_list from a_ip where ip_status='NO'";
        rs=db.execSQL(sql);
        %>
  <select name="env_ip" style="width:120px;" onchange="document.getElementById('input').value=this.value">
	<option value="">请选择</option>
        <%while(rs.next()){%>
                <option value="<%=rs.getString("ip_list")%>"><%=rs.getString("ip_list")%></option>
        <%}%>
  </select>
  <input id="input" name="input" style="position:absolute;width:99px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
</div>

	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库服务器：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct db_ip from ts_db";
	rs=db.execSQL(sql);
	%>
	<select name="db_ip" onChange="change(document.form1.db_ip.options[document.form1.db_ip.selectedIndex].value)" > 
	  <option value="">请选择</option>
	  <%while(rs.next()){%>
	    <option value="<%=rs.getString("db_ip")%>"><%=rs.getString("db_ip")%></option>
      <%}%>
	</select>	
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库SID：</strong></td>
    <td width="78%" class="en">
	<select name="db_sid">
	  <option value="">请选择</option>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库用户名称：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="owner_name" value='' class="text2">
	</td>
  </tr>
        <tr>
          <td bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>打印IP</strong></font></td>
          <td bgcolor="#FCFCFC" class="en"><font color="#3333cc">
        <select name="print_ip" class="select5">
        <%
        sql_temp="select distinct print_ip from ts_print";
        rs_temp=db.execSQL(sql_temp);
        %>
        <%while(rs_temp.next()){
                if(rs_temp.getString("print_ip")!=null){
                       out.println("<option value="+rs_temp.getString("print_ip")+">"+rs_temp.getString("print_ip")+"</option>");
                }
        }%>
        </select>
<a href="ts_print_query.jsp" target="_blank">Add Print Server</a>
        </td>
        </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DATAFILE文件目录：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="file_dir" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用环境用户名：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="app_user" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用环境目录：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="app_dir" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否客户环境：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="onsite_env" value="1" onClick="disable_all()">
	</td>
  </tr>
</table>
<br><br>
<div align="center">
<input type="button" name="button1" class="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="重置">
</div>
</form>
<%
db.close();
rs.close();
rs5.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function disable_all(){
    if (document.getElementById("onsite_env").checked) {
	document.getElementById("app_dir").disabled = true; 
	document.getElementById("file_dir").disabled = true; 
	document.getElementById("app_user").disabled = true; 
	document.getElementById("send_email").disabled = true; 
	document.getElementById("env_ip").disabled = true; 
	document.getElementById("mac_ip").disabled = true; 
	document.getElementById("db_ip").disabled = true; 
	document.getElementById("db_sid").disabled = true; 
	document.getElementById("owner_name").disabled = true; 
	document.getElementById("print_ip").disabled = true; 
    } else {
	document.getElementById("app_dir").disabled = false; 
	document.getElementById("file_dir").disabled = false; 
	document.getElementById("app_user").disabled = false; 
	document.getElementById("send_email").disabled = false; 
	document.getElementById("env_ip").disabled = false; 
	document.getElementById("mac_ip").disabled = false; 
	document.getElementById("db_ip").disabled = false; 
	document.getElementById("db_sid").disabled = false; 
	document.getElementById("owner_name").disabled = false; 
	document.getElementById("print_ip").disabled = false; 
   }
}

function change_env(){
	if(form1.new_env.value==""){
		form1.app_user.value = "";
		form1.app_dir.value = "";
		form1.owner_name.value = "";
	}else{
		form1.app_user.value = form1.new_env.value;
		form1.owner_name.value = form1.new_env.value;
		form1.app_dir.value = "/usr/local/" + form1.new_env.value;
	}
}
function check(){
	if(form1.new_env.value==""){
		alert("请选择新环境名称");
		form1.new_env.focus();
		return;
	}
	if (form1.onsite_env.checked) {
		alert("新增客户环境！");	
	} else {
	
	if(form1.mac_ip.value==""){
		alert("请选择物理IP");
		form1.mac_ip.focus();
		return;
	}
	if(form1.env_ip.value==""){
		alert("请选择环境IP");
		form1.env_ip.focus();
		return;
	}
	if(form1.db_sid.value==""){
		alert("请选择数据库SID");
		form1.db_sid.focus();
		return;
	}
	if(form1.db_ip.value==""){
		alert("请选择数据库服务器");
		form1.db_ip.focus();
		return;
	}
	
	}
	form1.submit();
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
