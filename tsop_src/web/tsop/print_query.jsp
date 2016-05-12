<%@ include file="/tsop/interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page  import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ebao.ts.*"  %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

	<title>Print Server Query</title>
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
//	 "ordering": false
         "order": [[ 0, "desc" ]]
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
function delete_row(id, proj_name){
        if (confirm('Please confirm delete '+proj_name+' print server?')) {
		window.location="print_query.jsp?act=delete&id="+id;
        }
}

</script>

<body class="dt-example">
<%@include file="/tsop/includes/head.html" %>
<%
Socket s=null;
DBean db = new DBean();
DBean db2 = new DBean();

String sql = new String();
ResultSet rs;

String tmpact=request.getParameter("act");
String tmpid=request.getParameter("id");

if ("delete".equals(tmpact)) {
        String delete_sql="delete from ts_print where print_id="+tmpid;
        System.out.println(session.getAttribute("username")+":"+delete_sql);
        try {
        	db.execUpdate(delete_sql);
        	out.print("<center>Print server "+tmpid+" was removed successfully!</center>");
        } catch (Exception e){
                out.print("<center>Remove failed!</center>");
                //out.print("<script javascript><!-- alert('test'); --></script>");
		e.printStackTrace();
        }
}


sql = "select * from ts_print";

System.out.print(sql);
rs = db.execSQL(sql);

try {
String sql2=new String();
ResultSet rs2;

sql2="select * from a_user where usr='"+session.getAttribute("username")+"'";
System.out.print(sql2);
	rs2=db2.execSQL(sql2);
%>
<br>
<div class="container">
	<section>
	<h2>Print Server Query</h2>
<%
while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))||"1".equals(rs2.getString("valid"))){%>
               <br> <input type="button" name="button1" value="Create" class="en" onClick="open_win('print_server_add.jsp',500,350)">
               &nbsp; <input type="button" name="button1" value="Refresh" class="en" onClick="window.location.reload();"><br>
<%} } rs2=db2.execSQL(sql2); 

%>
<br>
<table id="example" class="display compact" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>ID</th>
			<th>Username</th>
			<th>Password</th>
			<th>IP</th>
			<th>Project Name</th>
			<th>OS Type</th>
			<th>Status</th>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))||"1".equals(rs2.getString("valid"))){%>
			<th>Update</th>
			<th>Delete</th>
<%} } rs2=db2.execSQL(sql2); %>
			</tr>
	</thead>


	<tbody>
        <%while(rs.next()){%>
	<tr>
		<td align="center"><%=rs.getString("print_id")%></td>
		<td align="center"><%=rs.getString("print_user")%></td>
		<td align="center"><%=rs.getString("print_pwd")%></td>
		<td align="center"><a href="#" onclick="execRDP('<%=rs.getString("print_ip")%>')"><%=rs.getString("print_ip")%></a></td>
		<td align="center"><%=rs.getString("proj_name")%></td>
		<td align="center"><%=rs.getString("os_type")%></td>
		<td align="center">
      <%
           try{
                InetAddress theAddress = InetAddress.getByName(rs.getString("print_ip"));
                InetSocketAddress inetSocketAddress = new InetSocketAddress(theAddress, 3389);
                s=new Socket();
                s.connect(inetSocketAddress, 1000);
                out.print("<font color=green>Alive</font>");
                                 //System.out.println(" Alive!\n");
           }
           catch(IOException e){
                 out.print("<font color=red>Dead</font>");
                                 System.out.println("Host "+rs.getString("print_ip")+" unreachable.\n");
           }finally{
                try{s.close();}catch(Exception e){}
           }
          %>
		</td>
<%while(rs2.next()){%>
  <%if("2".equals(rs2.getString("valid"))||"1".equals(rs2.getString("valid"))){%>
		<td><a href=# onClick="open_win('print_server_update.jsp?id=<%=rs.getInt("PRINT_ID")%>',500,350);">Update</a></td>
		<td><a href=# onClick="delete_row('<%=rs.getString("print_id")%>','<%=rs.getString("proj_name")%>')">Delete</a></td>
<%} } rs2=db2.execSQL(sql2); 

%>
	</tr>
<%}	// end of while
} catch (Exception e) {
	e.printStackTrace();
}
%>
</tbody>
</table>

</body>
</html>
