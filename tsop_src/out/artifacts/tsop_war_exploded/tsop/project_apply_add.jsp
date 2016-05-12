<%@ include file="../interface/check.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
    <title>搭建申请答复提交</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <script src="calendar.js" language="javascript" type="text/javascript"></script>
    <script src="include/common.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.2/jquery-ui.js"></script>
    <script src="scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="scripts/uploadify/uploadify.css">
    <link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/theme.css" rel="stylesheet" type="text/css">
    <style type=text/css>
        div.ui-dialog-titlebar {
            font-size: 10px;
        }

        div.ui-dialog-content {
            font-size: 15px;
            font-family: georgia;
            font-style: italic;
        }
    </style>
    <script type="text/javascript">

        $(function () {

            $("#new_env").change(function () {
                //alert("xxx");
                if (form1.new_env.value == "") {
                    form1.app_user.value = "";
                    form1.app_dir.value = "";
                    form1.owner_name.value = "";
                } else {
                    form1.app_user.value = form1.new_env.value.toLowerCase();
                    form1.owner_name.value = form1.new_env.value.toLowerCase();
                    form1.app_dir.value = "/usr/local/" + form1.new_env.value.toLowerCase();
                    var i;
                    //alert(document.form1.print_ip.length);
                    for (i = 1; i < document.form1.print_ip.length; i++) {
                        project_name = $("#print_ip").get(0).options[i].text;
                        j = project_name.lastIndexOf("-");

                        project_name = $("#print_ip").get(0).options[i].text.substring(0, j);
                        //	alert(i+project_name);
                        xxx = project_name.toLowerCase();
                        tmpxxx = $("#app_user").val().substring(0, j).toLowerCase();
                        if (xxx == tmpxxx) {
                            //      alert(xxx+tmpxxx);
                            $("#print_ip").get(0).selectedIndex = i;
                            return 0;
                        }
                        $("#print_ip").get(0).selectedIndex = 0;
                    }
                }
            });

        });
    </script>
    <%
        DBean db = new DBean();
        String sql = new String();
        String sql_temp = new String();
        String sql5 = new String();
        sql5 = "select distinct db_ip,db_sid,db_ldap_name,db_version from a_db_svr_main order by db_ip, db_sid";
        System.out.println(sql5);
        ResultSet rs5;
        ResultSet rs;
        ResultSet rs_temp;
    %>

    <script type="text/javascript">
        var onecount;
        onecount = 0;
        subcat = [];
        <%
        rs5 = db.execSQL(sql5);
        int count = 0;
        while(rs5.next()){
        %>
        subcat[<%=count%>] = ["<%=rs5.getString("db_ip").trim()%>", "<%=rs5.getString("db_sid").trim()%>", "<%=rs5.getString("db_ldap_name").trim()%>", "<%=rs5.getString("db_version").trim()%>"];
        <%
        count++;
        }
        rs5.close();
        %>
        temp = <%=count%>;
        function change(team_id) {
            document.form1.db_sid.length = 0;
            var team_id = team_id;
            var i;
            var current;
            for (i = 0; i < temp; i++) {
                if (subcat[i][0] == team_id) {
                    document.form1.db_sid.options[document.form1.db_sid.length] = new Option(subcat[i][1], subcat[i][1], false, false);
                    document.form1.db_ldap_name.value = "";
                    document.form1.db_ldap_name.value = subcat[i][2];
                    //	alert(subcat[i][0]+subcat[i][1]+subcat[i][2]);
                    //	window.alert(document.form1.db_sid.length);
                    //	window.alert(subcat[i][1]);
                    current = i;
                }
            }
            document.form1.db_sid.options[0].selected = true;
            document.form1.db_sid.value = subcat[current][1];
            document.form1.db_ldap_name.value = subcat[current][2];
            //window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
            $('#db_version').html(subcat[current][3]);
        }

        function change_sid(sid) {
            var i;
            for (i = 0; i < temp; i++) {
                if (subcat[i][1] == sid) {
//			alert(sid+subcat[i][1]+subcat[i][2]);
                    document.form1.db_ldap_name.value = subcat[i][2];
                    $('#db_version').html(subcat[i][3]);
                }
            }
        }

    </script>
</head>

<body>
<%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><font color="#3333cc"><br>
    <span class="s105">申请答复</span></strong></font>
</div>

<form name="form1" action="project_apply_add_finish.jsp" method="post" class="en">
    <%if ("".equals(request.getParameter("info"))) {%>

    <%} else {%>
    <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%>
    </font></div>
    <%}%>

    <center>
        <br>
        <table width="960" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
               bordercolordark="#EFEFEF" align="center">
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">新环境名称：</strong></td>
                <%
                    sql = "select  new_env,app_soft,db_version,num_cpu,num_ram,num_disk from a_apply where status='DOING'  and apply_type is null order by new_env";
                    System.out.println(sql);
                    rs = db.execSQL(sql);
                %>
                <td class="en" width="78%">
                    <select id="new_env" name="new_env" class="select1">
                        <option value="">请选择</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("new_env")%>"><%=rs.getString("new_env")%>
                            _______CPU=<%=rs.getString("NUM_CPU")%>_RAM=<%=rs.getString("NUM_RAM")%>
                            G_DISK=<%=rs.getString("NUM_DISK")%>G
                        </option>
                        <%}%>
                    </select>
                    <font color=red>*请按照要求分配VM资源</font>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">是否客户或外部环境：</strong>
                </td>
                <td width="78%" class="en"><input type="checkbox" id="onsite_env" name="onsite_env" value="1"
                                                  onClick="check_onsite_env()">
                    Note: 若客户或其他外部环境以下信息可不填
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">搭建环境服务器：</strong></td>
                <%
                    sql = "select distinct mac_ip from a_hardware";
                    rs = db.execSQL(sql);
                %>
                <td class="en" width="78%">
                    <select name="mac_ip" class="select2">
                        <option value="">请选择</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("mac_ip")%>"><%=rs.getString("mac_ip")%>
                        </option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">应用使用IP：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct ip_list from a_ip where ip_status='NO'";
                        rs = db.execSQL(sql);
                    %>
                    <div style="position:relative;">
                        <select name="env_ip" class="select2"
                                onchange="document.getElementById('env_ip_input').value=this.value">
                            <option value="">请选择</option>
                            <%while (rs.next()) {%>
                            <option value="<%=rs.getString("ip_list")%>"><%=rs.getString("ip_list")%>
                            </option>
                            <%}%>
                        </select>
                        <input id="env_ip_input" name="env_ip_input" placeholder="x.x.x.x" required
                               pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$"
                               style="position:absolute;width:92px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
                    </div>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">数据库服务器：</strong></td>
                <td width="78%" class="en">
                    <%
                        sql = "select distinct db_ip from a_db_svr_main";
                        rs = db.execSQL(sql);
                    %>
                    <select name="db_ip"
                            onChange="change(document.form1.db_ip.options[document.form1.db_ip.selectedIndex].value)">
                        <option value="">请选择</option>
                        <%while (rs.next()) {%>
                        <option value="<%=rs.getString("db_ip")%>"><%=rs.getString("db_ip")%>
                        </option>
                        <%}%>
                    </select>
                    <a href="db_server_main_query.jsp" target="_blank">[New DB]</a> &nbsp;&nbsp;
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">数据库SID：</strong></td>
                <td width="78%" class="en">
                    <select name="db_sid" onChange="change_sid(this.value)">
                        <option value="">请选择</option>
                    </select>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">DB Version</strong>
                </td>
                <td width="78%" class="en">
                    <div id="db_version"></div>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">数据库TNSNAME：</strong>
                </td>
                <td width="78%" class="en"><input name="db_ldap_name" size=30> <a href="#"
                                                                                  onClick="exectnsping(this.value)">tnsping</a>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">数据库用户名称：</strong></td>
                <td width="78%" class="en">
                    <input type="text" name="owner_name" value='' class="text2">
                </td>
            </tr>
            <tr height="25">
                <td bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong><font color="#3333cc">打印服务器:</strong></font>
                </td>
                <td bgcolor="#FCFCFC" class="en"><font color="#3333cc">
                    <select id="print_ip" name="print_ip" class="select5">
                        <option value="">Please-Choose</option>
                        <%
                            sql_temp = "select * from ts_print a, ts_proj b where a.proj_id=b.proj_id(+)";
                            rs_temp = db.execSQL(sql_temp);
                            System.out.println(sql_temp);
                        %>
                        <%
                            while (rs_temp.next()) {
                                if (rs_temp.getString("print_ip") != null) {
                                    out.println("<option value=" + rs_temp.getString("print_ip") + ">" + rs_temp.getString("proj_name") + "-" + rs_temp.getString("print_ip") + "</option>");
                                }
                            }
                        %>
                    </select>
                    <a href="print_query.jsp" target="_blank">[New Print]</a>
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">DATAFILE文件目录：</strong>
                </td>
                <td width="78%" class="en">
                    <input type="text" name="file_dir" value="" class="text2">
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">应用环境用户名：</strong></td>
                <td width="78%" class="en">
                    <input type="text" id="app_user" name="app_user" value="" class="text2">
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">应用环境目录：</strong></td>
                <td width="78%" class="en">
                    <input type="text" name="app_dir" value="" class="text2">
                </td>
            </tr>
            <tr height="25">
                <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc">是否邮件通知：</strong></td>
                <td width="78%" class="en">
                    <input type="checkbox" name="send_email" checked="checked" value="1">
                </td>
            </tr>
        </table>
    </center>
    <br><br>

    <div align="center">
        <input type="button" name="button1" class="button1" value="刷新" onClick="location.reload()">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="button1" class="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" name="reset1" class="button1" value="重置">
    </div>
</form>
<%
    db.close();
    rs.close();
    rs5.close();
%>
<script language="JavaScript">

    function check() {
        if (form1.new_env.value == "") {
            alert("请选择新环境名称");
            form1.new_env.focus();
            return;
        }
        if (form1.onsite_env.checked) {
            alert("新增客户环境！");
        } else {
            if (form1.mac_ip.value == "") {
                alert("请选择物理IP");
                form1.mac_ip.focus();
                return;
            }
            if (form1.env_ip.value == "" && form1.env_ip_input.value == "") {
                alert("请选择环境或输入环境IP");
                form1.env_ip.focus();
                return;
            }
            if (form1.env_ip.value == "") {
                form1.env_ip.value = form1.env_ip_input.value;
            }
            if (form1.db_sid.value == "") {
                alert("请选择数据库SID");
                form1.db_sid.focus();
                return;
            }
            if (form1.db_ip.value == "") {
                alert("请选择数据库服务器");
                form1.db_ip.focus();
                return;
            }
        }
        if (form1.owner_name.value.length > 20) {
            var num_char = form1.owner_name.value.length - 20;
            alert("数据库用户名长度超过20个字符！请删除" + num_char + "字符,如下划线,或与TS OWNER协商，否则read,app用户无法创建！");
            form1.owner_name.focus();
            return;
        }

        if (form1.env_ip.value == "") {
            form1.env_ip.value = form1.env_ip_input.value;
        }
        form1.submit();
    }
</script>
<script language="JavaScript" for="document" event="onkeypress">
    if (event.keyCode == 13) {
        check();
    }
</script>
</body>
</html>
