<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
    <title>环境搭建流程详细</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
    DBean db = new DBean();
    String sql = new String();
    ResultSet rs;
    sql = "select * from a_apply where id = " + request.getParameter("id");
    rs = db.execSQL(sql);
%>
<body>
<%@include file="includes/head.html" %>
<%while (rs.next()) {%>
<div align="center"><font color="#3333cc"><strong><br>
    <span class="s105">环境搭建流程详细</span></strong></font>
</div>
<br><div align="center">
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF"
       align="center">
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>新环境名称</strong></font>
        </td>
        <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
            &nbsp;<%=rs.getString("new_env")%>&nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>源环境名称</strong></font>
        </td>
        <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
            &nbsp;<%=rs.getString("src_env")%>&nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目环境属组</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_grp")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font
                color="#3333cc"><strong>系统平台</strong></font></td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("sys_ver")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font
                color="#3333cc"><strong>应用中间件平台</strong></font></td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
            &nbsp;<%=Tools.msNull(rs.getString("app_soft"))%>&nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库版本</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
            &nbsp;<%=Tools.msNull(rs.getString("db_version"))%>&nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境搭建人</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_creator")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库搭建人</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("db_creator")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font
                color="#3333cc"><strong>环境搭建申请人</strong></font></td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_proposer")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请提交时间</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>
            &nbsp;<%=rs.getTime("apply_time")%>&nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>申请状态</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("status")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目代码</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getInt("proj_code")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>表空间大小</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getInt("db_size")%>
            &nbsp;</font></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>备注</strong></font>
        </td>
        <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
            &nbsp;<%=Tools.StrReplace(Tools.msNull(rs.getString("note")).replace('^', '\''), "\n", "<br>")%>
            &nbsp;</font></td>
    </tr>
</table></div>
<%}%>
<jsp:include page="includes/copyright.jsp"/>
</body>
<%db.close();%>
<%rs.close();%>
</html>
