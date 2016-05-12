<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>单应用环境申请</title>
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
	sql="select * from ts_proj";
	rs=db.execSQL(sql);
	%>
<script type="text/javascript"> 

var onecount; 
onecount=0; 
subcat = [];
        <% 
        int count = 0; 
        while(rs.next()){ 
        %> 
subcat[<%=count%>] = ["<%=rs.getString("proj_grp").trim()%>","<%=rs.getString("proj_name").trim()%>"];
        <% 
        count++; 
        } 
        rs.close(); 
        %> 
temp=<%=count%>; 


function change(team_id) 
    { 
    document.form1.proj_name.length = 0; 
    var team_id=team_id; 
    var i; 
    for (i=0;i < temp ; i++) 
        { 
        	        	
            if (subcat[i][0] == team_id) 
            { 
            	  
                document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][1]); 
           
            }        
        } 
        document.form1.proj_name.options[0].selected = true;
        
    }    
</script> 

<body><%@include file="includes/head.html" %>
<br>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">单应用环境申请（<font color="#FF0000">*</font>项为必填）</span></strong></font>
</div>

<form name="form1" action="only_app_build_add_finish.jsp" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>
<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境组属：</strong></td>
	<%
	sql="select distinct proj_grp from ts_proj";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="78%">
    	
    	<SELECT name="proj_grp" onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	<option value="">请选择</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString("proj_grp")%>"><%=rs.getString("proj_grp")%></option>
	<%}%>
	</select>
	
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>新环境名称：</strong></td>
    <td class="en">
	<table width="95%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="bottom">项目名(<font color="#FF0000">*</font>)</td>
        <td align="center" valign="bottom">版本</td>
        <td align="center" valign="bottom">类型1</td>
        <td align="center" valign="bottom">类型2</td>
        <td align="center" valign="bottom">类型3</td>
      </tr>
      <tr>
        <td align="center">
		
		<select name="proj_name" class="select7">
		<option value="">请选择</option>
		</SELECT> 

		</td>
		<td align="center"><input type="text" name="ver" value="" class="text1" size="6"></td>
        <td>
    	<%
		sql="select distinct a_type_1 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_1" class="select3" id="select3">
		<option value="">请选择</option>
		<%while(rs.next()){%>
	  		<%if(rs.getString("a_type_1")!=null){%>
	    		<option value="<%=rs.getString("a_type_1")%>"><%=rs.getString("a_type_1")%></option>
	  		<%}%>
		<%}%>
		</select>
		</td>
        <td align="center">
    	<%
		sql="select distinct a_type_2 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_2" class="select4">
		<option value="">请选择</option>
		<%while(rs.next()){%>
	  		<%if(rs.getString("a_type_2")!=null){%>
	    		<option value="<%=rs.getString("a_type_2")%>"><%=rs.getString("a_type_2")%></option>
	  		<%}%>
		<%}%>
		</select>
		</td>
        <td align="center">
		<%
		sql="select distinct a_type_3 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_3" class="select2">
		<option value="">请选择</option>
		<%while(rs.next()){%>
			<%if(rs.getString("a_type_3")==null||"".equals(rs.getString("a_type_3"))){%>
			
			<%}else{%>
				<option value="<%=rs.getString("a_type_3")%>"><%=rs.getString("a_type_3")%></option>
			<%}%>
		<%}%>
		</select>
		</td>
      </tr>
    </table>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>系统平台：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct sys_ver from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="sys_ver" class="select6">
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
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用中间件平台：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct appsoft_ver from a_property";
	rs=db.execSQL(sql);
	%>
	<select name="appsoft_ver" class="select5">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<%if(rs.getString("appsoft_ver")!=null){%>
			<option value="<%=rs.getString("appsoft_ver")%>"><%=rs.getString("appsoft_ver")%></option>
		<%}%>
	<%}%>
	</select>
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用搭建人：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select account from ts_member where resign=0 order by account";
	rs=db.execSQL(sql);
	%>
	<select name="env_creator" class="select5">
	<option value="">请选择</option>
	<%while(rs.next()){%>
		<option value="<%=rs.getString("account")%>"><%=rs.getString("account")%></option>
	<%}%>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境搭建申请人：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_proposer" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否需要备份：</strong></td>
    <td width="78%" class="en">
	<input type="radio" name="backup_type" value="YES" checked="checked">是
	<input type="radio" name="backup_type" value="NO">否
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
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
</div>
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
	if(form1.proj_grp.value==""){
		alert("请选择项目环境组属");
		form1.proj_grp.focus();
		return;
	}
	if(form1.proj_name.value==""){
		alert("请选择项目名");
		form1.proj_name.focus();
		return;
	}

	var new_env = form1.proj_name.value+"_"+form1.ver.value+"_"+form1.type_1.value+"_"+form1.type_2.value+"_"+form1.type_3.value;
	if(new_env.length>20){
		alert("项目名称长度不能超过20个字符！");
		return;
	}
	if(form1.sys_ver.value==""){
		alert("请选择系统平台");
		form1.sys_ver.focus();
		return;
	}
	if(form1.env_creator.value==""){
		alert("请输入环境搭建人");
		form1.env_creator.focus();
		return;
	}
	if(form1.proj_proposer.value==""){
		alert("请输入环境搭建申请人");
		form1.proj_proposer.focus();
		return;
	}
   if(form1.appsoft_ver.value==""){
		alert("请选择应用中间件");
		form1.appsoft_ver.focus();
		return;
	}
	form1.submit();
}
function check1(){
	if(document.getElementById("proj_grp").value=="TS-PG1"){
		document.getElementById("select3").disabled = false;
	}else{
		document.getElementById("select3").disabled = true;
	}
}

</script>
</html>
