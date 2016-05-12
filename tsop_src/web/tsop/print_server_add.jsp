<!-- <%@ include file="../interface/check.jsp"%> -->
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>Add Print Server</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function change_proj(pname){
    form1.proj_name.value = pname.toUpperCase();
    alert(pname);
}
</script>
</head>
<body>
<%
try {
String tmpid=new String();
String sql = new String();
String sql1 = new String();
DBean db = new DBean();
ResultSet rs;
ResultSet rs3;
//tmpid=request.getParameter("id");
//System.out.println(tmpid);
//sql="select * from ts_print where print_id='"+tmpid+"'";
//rs= db.execSQL(sql);
//while(rs.next()){ 
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">New Print Server</span></strong></font>
</div>
<br><br>
<form name="form1" action="print_server_add_finish.jsp" method="post" class="en">
<table width="400" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td width="21%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>Project Name</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	<input type="hidden" value="" name="print_id">
	<input type="hidden" value="" name="proj_id">
        <select name="proj_name" onChange="change_proj(document.form1.proj_code.options[document.form1.proj_code.selectedIndex].innerHTML)">
                <option 
        	<% if ("".equals(request.getParameter("proj_name"))) {
                out.print("selected=selected ");
                } %>
                value="">Project Name</option>
                                <%
                                sql1="select * from ts_proj where valid=1 order by proj_name ";
                                System.out.println(sql1);
                                rs3 = db.execSQL(sql1);
                                while(rs3.next()){ %> 
		<option value="<%=rs3.getString("proj_name")%>"  ><%=rs3.getString("proj_name")%> -- <%=rs3.getString("proj_id")%></option>
        <%}%>
        </select>
	</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Account Name</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="PRINT_USER" value="administrator" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Account Password</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="PRINT_PWD" value="Ebaotech250" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="print_ip" value="" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>OS</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="OS_TYPE" value="Windows 2008" class="en" size="20"></td>
	</tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="Submit" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="reset1" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="close1" value="Close" onclick="window.close();">&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</form>
</body>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>
<script language="JavaScript">
function check(){
	if(form1.PRINT_USER.value==""){
		alert("Please input username");
		form1.PRINT_USER.focus();
		return false;
	}
        if(form1.PRINT_PWD.value==""){
                alert("Please input password");
                form1.PRINT_PWD.focus();
                return false;
        }
        if(form1.OS_TYPE.value==""){
                alert("Please input OS type");
                form1.OS_TYPE.focus();
                return false;
        }
        if(form1.print_ip.value==""){
                alert("Please input print server IP.");
                form1.print_ip.focus();
                return false;
        }
	form1.submit();
}
function isNumber(oNum){
	var i,j,strTemp;
	strTemp="0123456789.";
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
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
