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

	<title>DB Backup Query</title>
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
         "order": [[ 0, "desc" ]] 
        });
} );


	</script>
<style>
div.container {
        width: 99%;
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
<%

DBean db = new DBean();
DBean db2 = new DBean();

String sql = new String();
ResultSet rs;

sql="select * from ts_db_expdp order by backup_date desc";

System.out.println(sql);
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
			<h2>Database Logic Backup Query</h2>

<br>
			<table id="example" class="display compact" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>DB_IP</th>
						<th>DB_SID</th>
						<th>BACKUP_DATE</th>
						<th>SUCCESS</th>
					</tr>
				</thead>


				<tbody>
        <%while(rs.next()){%>
					<tr>
						<td><%=rs.getString("DB_IP")%></td>
						<td><%=rs.getString("DB_SID")%></td>
						<td><%=rs.getString("BACKUP_DATE")%></td>
        <td align="center" class="en"<% if ("N".equals(rs.getString("SUCCESS"))) { out.print("bgcolor=red"); } if ("warning".equals(rs.getString("SUCCESS"))) { out.print("bgcolor=purple"); } if ("Y".equals(rs.getString("SUCCESS"))) { out.print("bgcolor=green"); }%>>
        <font color="#dddddd"><%=rs.getString("SUCCESS")%></font>
        </td>
					</tr>
	<%}%>
				</tbody>
			</table>



</body>
</html>
