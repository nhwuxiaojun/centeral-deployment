<%@ include file="../interface/check_non_ts.jsp" %>
<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.DBADBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
    <script type="text/javascript" src="../includes/common.js"></script>
</head>
<body>
<%
    DBean db = new DBean();
    String sql = new String();
    String sql2 = new String();
    String sql3 = new String();
    String db_str = new String();
    ResultSet rs;
    ResultSet rs2;
    ResultSet rs3;
    int i;

//sql="delete from ts_my_favorite_env where user_name='"+session.getAttribute("username")+"' and env_id="+request.getParameter("id");
    sql = "delete from ts_my_favorite_env where user_name='" + session.getAttribute("username") + "' and env_id in (select env_id from ts_env where env_name='" + request.getParameter("env_name") + "')";
    System.out.println(sql);
    try {
        i = db.execUpdate(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script type="text/javascript">
    alert("Remove favorite environment successfully!");
    window.close();
</script>
</body>
</html>
