<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>TS成员增加</title>
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
  <span class="s105">TS 成员信息增加</span></strong></font>
</div>
<form name="form1" action="ts_member_add_finish.jsp" method="post" class="en">
<table width="400" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="50" bgcolor="#D2D2D2" class="STYLE1 en"><strong>工号：</strong></td>
    <td class="en" width="180">
	<input type="text" name="ENV_NO" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td bgcolor="#D2D2D2" class="STYLE1 en"><strong>域帐号：</strong></td>
    <td class="en"><input type="text" name="ENV_ACCOUNT" value="<%=session.getAttribute("username")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td bgcolor="#D2D2D2" class="STYLE1 en"><strong>英文名：</strong></td>
    <td class="en"><input type="text" name="ENV_NAME" value="<%=session.getAttribute("username")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td bgcolor="#D2D2D2" class="STYLE1 en"><strong>手机号：</strong></td>
    <td class="en"><input type="text" name="ENV_MOBILE1" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>分机：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_EXT" value="" class="en" size="35"></td>
  </tr>

</table>
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;
<input type="reset" name="reset1" value="重置">
&nbsp;&nbsp;<input type="button" onClick="history.go(-1)" value="返回"></div>
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
	if(form1.ENV_NO.value==""){
		alert("请输入工号！");
		form1.ENV_NO.focus();
		return;
	}
	if(form1.ENV_ACCOUNT.value==""){
		alert("请输入域帐号！");
		form1.ENV_ACCOUNT.focus();
		return;
	}
	if(form1.ENV_NAME.value==""){
		alert("请输入英文名！");
		form1.ENV_NAME.focus();
		return;
	}
	if(form1.ENV_MOBILE1.value.length!=11){
		alert("请输入正确的手机号");
		form1.ENV_MOBILE1.focus();
		return;
	}
	if(form1.ENV_EXT.value==""){
		alert("请输入分机号!");
		form1.ENV_EXT.focus();
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
