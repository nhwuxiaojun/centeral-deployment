<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

    <title><%=request.getParameter("env_name")%> Deployment History Records</title>
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
        $(document).ready(function () {
            $('#example').DataTable({
                "order": [[4, "desc"]]
            });
        });
    </script>
    <style>
        div.container {
            width: 99%;
        }
    </style>
</head>
<script language="JavaScript">
    function delete_ftp(ftp_id, proj_name) {
        if (confirm('Please confirm delete ' + proj_name + ' FTP account?')) {
            // var form11 = document.getElementById("form1");
            form1.action = "/tsop/ftp_info_delete_finish.jsp?ftp_id=" + ftp_id;
            form1.submit();
        }
    }

</script>

<body class="dt-example">
<%
try {
    DBean db = new DBean();
    DBean db2 = new DBean();
    String sql = new String();
    ResultSet rs;

    if ("y".equals(request.getParameter("all"))) {
        sql = "select a.env_name, c.no, c.version, c.start_time, c.end_time, c.deployer, c.result from ts_env a, ts_env_app b, ts_deploy_log c where a.env_id=b.env_id and a.env_id=c.env_id and a.env_id=" + request.getParameter("env_id") + " order by c.start_time desc";
    } else {
        sql = "select a.env_name, c.no, c.version, c.start_time, c.end_time, c.deployer, c.result from ts_env a, ts_env_app b, ts_deploy_log c where a.env_id=b.env_id and a.env_id=c.env_id and c.start_time > sysdate -7 and a.env_id=" + request.getParameter("env_id") + " order by c.start_time desc";
    }
    System.out.print(sql);
    rs = db.execSQL(sql);

    String sql2 = new String();
    ResultSet rs2;

    sql2 = "select * from a_user where usr='" + session.getAttribute("username") + "'";
    System.out.print(sql2);
    rs2 = db2.execSQL(sql2);
%>
<br>

<div class="container">
    <section>
        <h2><font color="red"><%=request.getParameter("env_name")%></font> Deployment Records</h2>
        [<a href="<%=request.getRequestURI()+"?"+request.getQueryString()+"&all=y"%>">All Records</a>]
        <button onclick="window.close()">Close</button>
        <br>
        <br>
        <table id="example" class="display compact" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Verion</th>
                <th>Result</th>
                <th>Log</th>
                <th>Start Time</th>
                <th>Finish Time</th>
                <th>Deployer</th>
            </tr>
            </thead>


            <tbody>
            <%while (rs.next()) {%>
            <tr>
                <td><%=rs.getString("VERSION")%>
                </td>
                <td align="center" class="en"<% if ("failed".equals(rs.getString("result"))) {
                    out.print("bgcolor=red");
                }
                    if ("warning".equals(rs.getString("result"))) {
                        out.print("bgcolor=purple");
                    }
                    if ("succeed".equals(rs.getString("result"))) {
                        out.print("bgcolor=green");
                    }%>>
                    <font color="#dddddd"><%=rs.getString("result")%>
                    </font>
                </td>
                <td>
                    <a href="/tsop/show_log.jsp?filename=<%=request.getParameter("env_name")%>_<%=rs.getString("VERSION")%>.log"
                       target="_blank">Log</a></td>
                <td><%=rs.getString("START_TIME")%>
                </td>
                <td><%=rs.getString("END_TIME")%>
                </td>
                <td><%=rs.getString("DEPLOYER")%>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
<% } catch (Exception e) {
    e.printStackTrace();
}%>

</body>
</html>
