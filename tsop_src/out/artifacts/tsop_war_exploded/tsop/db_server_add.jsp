<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>数据库表提交</title>
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
ResultSet rs1;
//ResultSet rs2;
ResultSet rs3;
ResultSet rs4;
ResultSet rs5;
String sql1 = new String();
//String sql2 = new String();
String sql3 = new String();
String sql4 = new String();
String sql5 = new String();
sql1="select distinct db_ip from ts_db";
//sql2="select distinct db_sid from a_db_sid";
sql3="select distinct proj_grp from a_env_name";
sql4="select distinct new_env from a_supply where db_status='DOING'";
sql5="select * from ts_db";
rs1 = db.execSQL(sql1);
//rs2 = db.execSQL(sql2);
rs3 = db.execSQL(sql3);
rs4 = db.execSQL(sql4);
rs5 = db.execSQL(sql5);
%>



<script type="text/javascript"> 

var onecount; 
onecount=0; 
subcat = [];
        <% 
        int count = 0; 
        while(rs5.next()){ 
        %> 
subcat[<%=count%>] = ["<%=rs5.getString("db_ip")%>","<%=rs5.getString("db_sid")%>"];
        <% 
        count++; 
        } 
        rs5.close(); 
        %> 
temp=<%=count%>; 


function change(team_id) 
    { 
    document.form1.DB_SID.length = 0; 
    var team_id=team_id; 
    var i; 
    for (i=0;i < temp ; i++) 
        { 
        	        	
            if (subcat[i][0] == team_id) 
            { 
            	  
                document.form1.DB_SID.options[document.form1.DB_SID.length] = new Option(subcat[i][1], subcat[i][1],false,false); 
          //  	window.alert(document.form1.DB_SID.length);
         //   	window.alert(subcat[i][1]);
            } 
     
        } 
            document.form1.DB_SID.options[0].selected = true;
//		window.alert(document.form1.DB_SID.options[document.form1.DB_SID.selectedIndex].value);
      
    }    
</script> 


<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库表提交</span></strong></font>
</div>
<form name="form1" action="db_server_add_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目环境名：</strong></td>
    <td class="en" width="66%">
	<select name="PROJ_ENV">
	  <option value="">请选择</option>
	  <%while(rs4.next()){%>
	    <option value="<%=rs4.getString("new_env")%>"><%=rs4.getString("new_env")%></option>
      <%}%>
	</select>	</td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境owner用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OWNER" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境owner用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OWNER_PASSWORD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境app用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_APP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境app用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_APP_PASSWORD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境read用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_READ" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境read用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_READ_PASSWORD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境oper用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OPER" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境oper用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OPER_PASSWORD" value="" class="en" size="35"></td>
  </tr>
  <!--<tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库环境创建日期：</strong></td>
    <td class="en" width="66%"><input type="text" name="CRT_DATE" value="" class="en" size="35" onFocus="show_cele_date(CRT_DATE,'','',CRT_DATE)"></td>
  </tr>-->
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库负责人：</strong></td>
    <td class="en" width="66%"><input type="text" name="DB_MANAGER" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
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
rs1.close();
//rs2.close();
rs3.close();
rs4.close();
rs5.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function check(){
	if(form1.PROJ_ENV.value==""){
		alert("请输入项目环境名");
		return;
	}
	if(form1.ENV_OWNER.value==""){
		alert("请输入环境owner用户");
		return;
	}
	if(form1.ENV_OWNER_PASSWORD.value==""){
		alert("请输入环境owner用户密码");
		return;
	}
	/*
	if(form1.CRT_DATE.value==""){
		alert("请输入数据库环境创建日期");
		return;
	}
	*/
	if(form1.DB_MANAGER.value==""){
		alert("请输入数据库负责人");
		return;
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
