<!-- <%@ include file="../interface/check.jsp"%> -->
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>Modify FTP Account</title>
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
String ftp_id=new String();
String sql = new String();
String sql1 = new String();
DBean db = new DBean();
ResultSet rs;
ResultSet rs3;
ftp_id=request.getParameter("id");
System.out.println(ftp_id);
sql="select * from a_ftp_info where ftp_id='"+ftp_id+"'";
rs= db.execSQL(sql);
while(rs.next()){ 
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Modify FTP/SFTP Info</span></strong></font>
</div>
<br><br>
<form name="form1" action="ftp_info_update_finish.jsp" method="post" class="en">
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td width="21%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>Project Name</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en">
	<input type="hidden" value="<%=ftp_id%>" name="ftp_id">
	<input type="hidden" value="<%=rs.getString("proj_name")%>" name="proj_name">
        <select name="proj_code" onChange="change_proj(document.form1.proj_code.options[document.form1.proj_code.selectedIndex].inner;
HTML)">
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
		<option <% if (rs3.getString("proj_id").equals(rs.getString("proj_code"))) { out.print("selected=selected "); } %>
        value="<%=rs3.getString("proj_id")%>"  ><%=rs3.getString("proj_name")%></option>
        <%}%>
        </select>
	</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Account Name</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="FTP_USER" value="<%=rs.getString("USERNAME")%>" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Account Password</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="FTP_PASSWD" value="<%=rs.getString("FTP_PASSWORD")%>" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Type</strong></font></td>
	<td align="center">
	<select name="FTP_TYPE">
	    <option value="<%=rs.getString("FTP_TYPE")%>"><%=rs.getString("FTP_TYPE")%></option>
            <option value="SFTP">SFTP</option>
            <option value="FTP">FTP</option>
        </select>
      </td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>FTP PATH</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="FTP_DIR" value="<%=rs.getString("FTP_DIR")%>" class="en" size="20"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>Comments</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="COMMENTS" value="<%=rs.getString("COMMENTS")%>" class="en" size="20"></td>
	</tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="Update" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="Reset">
</div>
</form>
</body>
<%}%>
<script language="JavaScript">
function check(){
	if(form1.FTP_USER.value==""){
		alert("Please input ftp account name");
		form1.FTP_USER.focus();
		return false;
	}
        if(form1.FTP_PASSWD.value==""){
                alert("Please input ftp password");
                form1.FTP_PASSWD.focus();
                return false;
        }
        if(form1.FTP_TYPE.value==""){
                alert("Please input ftp type");
                form1.FTP_TYPE.focus();
                return false;
        }
        if(form1.FTP_DIR.value==""){
                alert("Please input ftp path");
                form1.FTP_DIR.focus();
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
