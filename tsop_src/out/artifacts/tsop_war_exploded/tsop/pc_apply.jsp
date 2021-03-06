<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>PC机申请提交</title>
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
  <span class="s105">PC机申请（<font color="#FF0000">*</font>项为必填）</span></strong></font>
</div>

<form name="form1" action="pc_apply_finish.jsp" method="post" class="en">
<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境组：</strong></td>
	<%
	sql="select distinct proj_grp from a_env_name";
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
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目名(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<select name="proj_name" class="select7">
		<option value="">请选择</option>
		</SELECT> 
	</td>
  </tr
  
  ><tr> 
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
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>申请人(非TS Owner<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="proj_proposer" value="" class="text2">(请准确填写，方便出现故障时及时联系)
	</td>
  </tr>

  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>内存大小(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="mem_size" value="" class="text2">(单位:G)
	</td>
  </tr>
   <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>磁盘大小(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="disk_size" value="" class="text2">(单位:G)
	</td>
  </tr>
  
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>用途(<font color="#FF0000">*</font>)：</strong></td>
    <td width="78%" class="en">
	<textarea name="purpose" cols="56" rows="3"></textarea>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>备注：</strong></td>
    <td width="78%" class="en">
	<textarea name="note" cols="56" rows="3"></textarea>
	</td>
  </tr>
    <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
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
	if(form1.sys_type.value==""){
		alert("请选择系统平台");
		form1.sys_type.focus();
		return;
	}

	if(form1.proj_proposer.value==""){
		alert("请输入申请人");
		form1.proj_proposer.focus();
		return;
	}
	if(form1.mem_size.value==""){
		alert("请输入内存大小");
		form1.db_creator.focus();
		return;
	}
	if(form1.disk_size.value==""){
		alert("请输入磁盘空间大小");
		form1.disk_size.focus();
		return;
	}
	
	if(form1.purpose.value==""){
		alert("请输入用途");
		form1.purpose.focus();
		return;
	}
	if(isNumber(form1.mem_size.value)==false){
		alert("内存大小必须为数字");
		form1.db_size.focus();
		return false;
	}
	if(isNumber(form1.disk_size.value)==false){
		alert("内存磁盘空间大小必须为数字");
		form1.disk_size.focus();
		return false;
	}
	
   form1.submit();

}

function isNumber(oNum){
	var i,j,strTemp;
	strTemp="0123456789";
	if(oNum.length==0)
		return 0;
	for(i=0;i<oNum.length;i++){
		j=strTemp.indexOf(oNum.charAt(i)); 
		if(j==-1){
			return 0;
		}
	}
	return 1;
}
</script>
</html>
