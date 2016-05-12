<%@ include file="/tsop/interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page  import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

	<title>FTP Info Query</title>
	<link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css">
	<link rel="stylesheet" type="text/css" href="../resources/demo.css">
	<style type="text/css" class="init">

	</style>
<script type="text/javascript" src="includes/common.js"></script>
	<script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
	<script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
	<script type="text/javascript" language="javascript" class="init">


$(document).ready(function() {
	$('#example').DataTable({
	 "ordering": false
	});
} );


	</script>
<style>
div.container {
        width: 90%;
    }
</style>
</head>
<script language="JavaScript">
function delete_ftp(ftp_id, proj_name){
        if (confirm('Please confirm delete '+proj_name+' FTP account?')) {
               // var form11 = document.getElementById("form1");
                form1.action="/tsop/ftp_info_delete_finish.jsp?ftp_id="+ftp_id;
                form1.submit();
        }
}

</script>

<body class="dt-example">
<%@include file="/tsop/includes/head.html" %>
<%

DBean db = new DBean();
DBean db2 = new DBean();

String sql = new String();
ResultSet rs;

sql = "select * from a_ftp_info";

System.out.print(sql);
rs = db.execSQL(sql);

String sql2=new String();
ResultSet rs2;

sql2="select * from a_user where usr='"+session.getAttribute("username")+"'";
System.out.print(sql2);
rs2=db2.execSQL(sql2);


%>
<br>
	<div class="container">
		<section>
			<h2>FTP Info Query</h2>

<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
               <br> <input type="button" name="button1" value="Create" class="en" onClick="open_win('ftp_info_add.jsp',500,350)"><br>
<%} } rs2=db2.execSQL(sql2); %>
<br>
			<table id="example" class="display compact" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Project Name</th>
						<th>Username</th>
						<th>Password</th>
						<th>Type</th>
						<th>FTP Path</th>
						<th>FTP</th>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
						<th>Modify</th>
						<th>Delete</th>
<%} } rs2=db2.execSQL(sql2); %>
					</tr>
				</thead>


				<tbody>
        <%while(rs.next()){%>
					<tr>
						<td><%=rs.getString("proj_name")%></td>
						<td><%=rs.getString("username")%></td>
						<td><%=rs.getString("ftp_password")%></td>
						<td><%=rs.getString("ftp_type")%></td>
						<td><%=rs.getString("ftp_dir")%></td>
						<td><a href="javascript:" onClick="execFileZilla('ftp.ebaotech.com','<%=rs.getString("username")%>','<%=rs.getString("ftp_password")%>','/','<%=rs.getString("ftp_type").toLowerCase()%>')">FileZilla</a></td>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))){%>
						<td><a href=# onClick="open_win('ftp_info_update.jsp?id=<%=rs.getInt("FTP_ID")%>',500,350);">Modify</a></td>
						<td><a href=# onClick="delete_ftp('<%=rs.getString("ftp_id")%>','<%=rs.getString("proj_name")%>')">Delete</a></td>
<%} } rs2=db2.execSQL(sql2); %>
					</tr>
	<%}%>
				</tbody>
			</table>



</body>
</html>
