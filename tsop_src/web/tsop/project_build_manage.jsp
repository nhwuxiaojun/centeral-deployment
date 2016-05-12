<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
    <title>环境搭建流程管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/spin.min.js"></script>
    <link href="scripts/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css">

    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .text {
            font-size: 9pt;
            color: black;
            vertical-align: middle;
            border-bottom-width: 1pt;
            border-bottom-color: Black;
            border-top-width: 0pt;
            border-top-color: Black;
            border-left-width: 0pt;
            border-left-color: Black;
            border-right-width: 0pt;
            border-right-color: Black;
        }

        .button1 {
            height: 14pt;
            width: 30pt;
            font-size: 9pt;
            color: black;
            vertical-align: middle;
            border-bottom-width: 1pt;
            border-bottom-color: Black;
            border-top-width: 1pt;
            border-top-color: Black;
            border-left-width: 1pt;
            border-left-color: Black;
            border-right-width: 1pt;
            border-right-color: Black;
        }

        -->
    </style>
</head>
<script language="JavaScript">
    function check() {
        if (form1.txt_new_env.value == "" && form1.txt_submit_datetime.value == "") {
            alert("请至少输入一项查询条件！");
            return;
        }
        form1.submit();
    }
    //function test_alert(){
    //alert("OK");
    //}
    function add() {
        window.location = "project_build_add.jsp";
    }
</script>
<script language="JavaScript" for="document" event="onkeypress">
    if (event.keyCode == 13) {
        check();
    }
</script>
<script src="js/calendar3.js"></script>
<body>
<%@include file="includes/head.html" %>
<br>
<%
    try {
        DBean db = new DBean();
        String sql = new String();
        String sql_user = new String();
        ResultSet rs;
        ResultSet rs_user;
        if ("y".equals(request.getParameter("flag"))) {
            if ("".equals(request.getParameter("txt_new_env"))) {
                if ("".equals(request.getParameter("txt_submit_datetime"))) {
                    sql = "select * from a_apply  where  apply_type is null order by id desc";
                } else {
                    sql = "select * from a_apply where  apply_type is null and sysdate - apply_time <= " + request.getParameter("txt_submit_datetime") + " order by id desc";
                }
            } else {
                if ("".equals(request.getParameter("txt_submit_datetime"))) {
                    sql = "select * from a_apply where  apply_type is null and upper(new_env) like '%" + Tools.toGB(request.getParameter("txt_new_env").toString().trim()).toUpperCase() + "%' order by id desc";
                } else {
                    sql = "select * from a_apply where  apply_type is null and upper(new_env) like '%" + Tools.toGB(request.getParameter("txt_new_env").toString().trim()).toUpperCase() + "%' and sysdate - apply_time <= " + request.getParameter("txt_submit_datetime") + " order by id desc";
                }
            }
        } else {
            sql = "select * from (select * from a_apply  where apply_type is null order by apply_time desc) where rownum < 11";
        }
        System.out.println(sql);
        rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong>
    <span class="s105">搭建申请</span></strong></font>
</div>
<form name="form1" action="" method="post">
    <%if ("".equals(request.getParameter("info"))) {%>

    <%} else {%>
    <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%>
    </font></div>
    <%}%>
    <br>
    <div align="center">
    <table align="center" cellpadding="0" cellspacing="0" border="0" width="60%">
        <tr>
            <td align="right" width="20%">
                新环境名称&nbsp;&nbsp;
            </td>
            <td align="left" width="20%">
                <%if ("".equals(request.getParameter("txt_new_env")) || request.getParameter("txt_new_env") == null) {%>
                <input type="text" name="txt_new_env" value="">
                <%} else {%>
                <input type="text" name="txt_new_env" value="<%=Tools.toGB(request.getParameter("txt_new_env"))%>">
                <%}%>
            </td>
            <td align="right" width="20%">
                提交日期&nbsp;&nbsp;
            </td>
            <td align="left" width="20%">
                <select name="txt_submit_datetime">
                    <%if ("".equals(request.getParameter("txt_submit_datetime")) || request.getParameter("txt_submit_datetime") == null) {%>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("1".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("2".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="2">近2天</option>
                    <option value="1">近1天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("3".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="3">近3天</option>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("7".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="7">近1周</option>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("14".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="14">近2周</option>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="30">近1月</option>
                    <option value="3650">全部</option>
                    <%} else if ("30".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="30">近1月</option>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="3650">全部</option>
                    <%} else if ("3650".equals(request.getParameter("txt_submit_datetime"))) {%>
                    <option value="3650">全部</option>
                    <option value="1">近1天</option>
                    <option value="2">近2天</option>
                    <option value="3">近3天</option>
                    <option value="7">近1周</option>
                    <option value="14">近2周</option>
                    <option value="30">近1月</option>
                    <%}%>
                </select>
            </td>
            <td align="center" width="20%">&nbsp;&nbsp;<input type="button" name="button1" value="查询" class="button1"
                                                              onClick="check()">&nbsp;&nbsp;<input type="button"
                                                                                                   name="button2"
                                                                                                   value="新增"
                                                                                                   class="button1"
                                                                                                   onClick="add()"></td>
        </tr>
    </table></div>
    <input type="hidden" name="flag" value="y">
</form>
<br>

<div align="center">
    <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF"
           align="center">
        <tr height="22" bgcolor="#D2D2D2">
            <td align="center" width="10%"><font color="#3333cc"><strong>新环境名称</strong></font></td>
            <td align="center" width="10%"><font color="#3333cc"><strong>源环境名称</strong></font></td>
            <td align="center" width="10%"><font color="#3333cc"><strong>申请提交时间</strong></font></td>
            <td align="center" width="8%"><font color="#3333cc"><strong>环境搭建人(TS)</strong></font></td>
            <td align="center" width="8%"><font color="#3333cc"><strong>环境申请人(DM)</strong></font></td>
            <td align="center" width="4%"><font color="#3333cc"><strong>状态</strong></font></td>
            <td align="center" width="4%"><font color="#3333cc"><strong>修改</strong></font></td>
            <td align="center" width="4%"><font color="#3333cc"><strong>详细</strong></font></td>
            <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
            <%rs_user = db.execSQL(sql_user);%>
            <%while (rs_user.next()) {%>
            <%if ("2".equals(rs_user.getString("valid"))) {%>
            <td align="center" width="4%"><font color="#3333cc"><strong>删除</strong></font></td>
            <%}%>
            <%}%>
        </tr>
        <%while (rs.next()) {%>
        <tr height="22" bgcolor="#FCFCFC">
            <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("new_env")%>&nbsp;</font></td>
            <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("src_env")%>&nbsp;</font></td>

            <td align="center"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>
                &nbsp;<%=rs.getTime("apply_time")%>
                &nbsp;</font></td>
            <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("env_creator")%>&nbsp;</font></td>
            <td align="center"><font color="#3333cc">&nbsp;<%=rs.getString("proj_proposer")%>&nbsp;</font></td>

            <%if ("DONE".equals(rs.getString("status").toUpperCase())) {%>
            <td align="center"><font color="#006600">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
            <%} else if ("DOING".equals(rs.getString("status").toUpperCase())) {%>
            <td align="center"><font color="#FF0000">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
            <%} else if ("TEMP".equals(rs.getString("status").toUpperCase())) {%>
            <td align="center"><font color="#0000FF">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
            <%} else {%>
            <td align="center"><font color="#000000">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
            <%}%>
            <%if (rs.getString("env_creator").equals(session.getAttribute("username"))) {%>
            <td align="center">&nbsp;<a href="project_build_update.jsp?id=<%=rs.getInt("id")%>"><font
                    color="#3333cc">修改</font></a>&nbsp;</td>
            <%} else {%>
            <td align="center">&nbsp;</td>
            <%}%>
            <td align="center">&nbsp;<a href="project_build_detail.jsp?id=<%=rs.getInt("id")%>" target="_blank"><font
                    color="#3333cc">详细</font></a>&nbsp;</td>
            <%sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";%>
            <%rs_user = db.execSQL(sql_user);%>
            <%while (rs_user.next()) {%>
            <%if ("2".equals(rs_user.getString("valid"))) {%>
            <td align="center">&nbsp;<a href="#"
                                        onclick="if (confirm('Confirm remove environment <%=rs.getString("new_env")%>?')) {  $(window.location).attr('href','project_build_del.jsp?id=<%=rs.getInt("id")%>'); }"><font
                    color="#3333cc">删除</font></a>&nbsp;</td>
            <%}%>
            <%}%>
        </tr>
        <%}%>
    </table>
</div>
<%
        db.close();
        rs.close();
        rs_user.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<jsp:include page="includes/copyright.jsp"/>
</body>
</html>

