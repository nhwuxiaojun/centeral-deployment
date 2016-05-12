<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>申请答复流程修改处理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%@include file="includes/head.html" %>
<%
    DBean db = new DBean();
    String sql = new String();

    int i = 0;
    String id = new String();
    String mac_ip = new String();
    String env_ip = new String();
    String db_ip = new String();
    String db_sid = new String();
    String env_status = new String();
    String db_status = new String();

    id = request.getParameter("id");
    mac_ip = request.getParameter("mac_ip");
    env_ip = request.getParameter("env_ip");
    db_ip = request.getParameter("db_ip");
    db_sid = request.getParameter("db_sid");
    env_status = request.getParameter("env_status");
    db_status = request.getParameter("db_status");

    sql = "update a_supply set mac_ip = '" + request.getParameter("mac_ip") + "',env_ip = '" + request.getParameter("env_ip") + "',db_ip = '" + request.getParameter("db_ip") + "',db_sid = '" + request.getParameter("db_sid") + "',env_status = '" + request.getParameter("env_status") + "',db_status = '" + db_status + "' where id = " + id;

//out.println(sql + "<br>");

    i = db.execUpdate(sql);

//out.println(i + "<br>");
    db.close();
    if (i == 1) {
        response.sendRedirect("project_apply_manage.jsp?info=Update Succeed!");
    } else {
        response.sendRedirect("project_apply_manage.jsp?info=Update Failed!");
    }
%>
<jsp:include page="includes/copyright.jsp"/>
</body>
</html>
