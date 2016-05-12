<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.net.*" %>
<%@ include file="../interface/check.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
    <title>TSOP - Environment Info Query</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/ebao.css" rel="stylesheet" type="text/css">
    <link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="includes/common.js"></script>
    <script src="scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(":text").focus(function () {
                $(this).css("background", "yellow");
            }).blur(function () {
                $(this).css("background", "#fff");
            });
            $("select").focus(function () {
                $(this).css("background", "yellow");
            }).blur(function () {
                $(this).css("background", "#fff");
            });
            $("#maintable tbody tr").hover(function () {
                $(this).addClass("yellow");
            }, function () {
                $(this).removeClass("yellow");
            });
            $('#env_name_input').autocomplete({source: ["deploy", "upgrade", "inc_deploy", "fully_deploy", "full_deploy"]});
        });
    </script>
    <style>
        .yellow {
            background: #ffff00;
        }
    </style>
</head>
<%
    DBean db = new DBean();
    String sql = new String();
    ResultSet rs;

    String sql1 = new String();
    ResultSet rs1;

    String sql2 = new String();
    ResultSet rs2;
    ResultSet rs3;

    String sql_tmp = new String();
    ResultSet rs_tmp;

    sql1 = "select * from ts_proj order by proj_grp,proj_name";
    rs1 = db.execSQL(sql1);
%>
<script language="JavaScript" for="window" event="onload">
    form1.txt_env_ip.select();
</script>

<script language="JavaScript" for="document" event="onkeypress">
    if (event.keyCode == 13) {
        check();
    }
</script>

<script type="text/javascript">

    var subcat = [];
    subcat.length = 0;
    <%
         int count = 0;
         while(rs1.next()){
     %>
    subcat[<%=count%>] = ["<%=rs1.getString("proj_grp").trim()%>", "<%=rs1.getString("proj_name").trim()%>", "<%=rs1.getString("proj_id").trim()%>"];
    <% 
        count++; 
        } 
       rs1.close(); 
    %>


    function change(team_id) {
        document.form1.proj_name.length = 0;
        document.form1.proj_name.options[0] = new Option('请选择', '');
        var team_id = team_id;
        for (i = 0; i < subcat.length; i++) {
            if (subcat[i][0] == team_id) {
                document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][2]);
            }
        }
        // document.form1.proj_name.options[0].selected = true;
    }

    function check() {
        if (form1.txt_env_ip.value == "" && form1.col_value.value == "" && form1.proj_name.value == "") {
            alert("请至少输入一项查询条件！");
            return;
        }
        form1.submit();
    }


</script>


<body>
<%@include file="includes/head.html" %>
<%
    String common_sql = new String();
    common_sql = "select a.app_inst_path,a.mac_ip,a.env_ip,b.db_ip,a.env_id,c.db_id,d.env_name,a.env_state,a.env_usr,a.env_pwd,a.app_url,c.db_user,c.db_user_passwd,c.db_ldap_name,a.app_console,a.creater,a.app_version from ts_env_app a, ts_db b, ts_env_db c, ts_env d where c.db_ldap_name=b.LDAP_NAME(+) and a.env_id=c.env_id(+) and a.env_id=d.env_id(+) ";
//common_sql="select a.mac_ip,a.env_ip,b.db_ip,a.env_id,c.db_id,d.env_name,a.env_state,a.env_usr,a.env_pwd,a.app_url,c.db_user,c.db_user_passwd,c.db_ldap_name,a.app_console,a.creater from ts_env_app a, ts_db b, ts_env_db c, ts_env d where c.db_ldap_name=b.LDAP_NAME(+) and a.env_id=c.env_id(+) and a.env_id=d.env_id(+)  ";

    int flag = 0;
    sql = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
    rs = db.execSQL(sql);
    while (rs.next()) {
        if ("2".equals(rs.getString("valid"))) {
            flag = 1;
        } else {
            flag = 0;
        }
    }

//query by procode
    String proj_code_sql = "";
    String proj_name = (String) request.getParameter("proj_name");
    if (proj_name != null && !"".equals(proj_name)) {
        proj_code_sql = " and  proj_id= " + proj_name.trim() + "  ";
    }


    if ("y".equals(request.getParameter("flag"))) {
        if (request.getParameter("txt_env_state") == null || "%".equals(request.getParameter("txt_env_state"))) {
            if ("".equals(request.getParameter("txt_env_ip"))) {
                if ("".equals(request.getParameter("col_value"))) {
                    sql = common_sql + "and lower(env_state) like '%' " + proj_code_sql + " order by env_name,env_ip";
                } else {
                    sql = common_sql + "and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'  " + proj_code_sql + " order by env_name,env_ip";
                }
            } else {
                if ("".equals(request.getParameter("col_value"))) {
                    sql = common_sql + "and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%'  " + proj_code_sql + " order by env_name,env_ip";
                } else {
                    sql = common_sql + "and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%'    " + proj_code_sql + "  order by env_name,env_ip";
                }
            }
        } else {
            if ("".equals(request.getParameter("txt_env_ip"))) {
                if ("".equals(request.getParameter("col_value"))) {
                    sql = common_sql + "and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  " + proj_code_sql + "  order by env_name,env_ip";
                } else {
                    sql = common_sql + "and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'   " + proj_code_sql + " order by env_name,env_ip";
                }
            } else {
                if ("".equals(request.getParameter("col_value"))) {
                    sql = common_sql + "and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  " + proj_code_sql + "  order by env_name,env_ip";
                } else {
                    sql = common_sql + "and upper(env_ip) like '%" + request.getParameter("txt_env_ip").toString().trim().toUpperCase() + "%' and upper(" + request.getParameter("col_name").toString() + ") like '%" + request.getParameter("col_value").toString().trim().toUpperCase() + "%' and upper(env_state) = '" + request.getParameter("txt_env_state").toUpperCase().trim() + "'  " + proj_code_sql + "  order by env_name,env_ip";
                }
            }
        }
    } else {
        //sql=common_sql+" and lower(a.env_state)= 'running' and  rownum<13  "+proj_code_sql+"  order by d.env_name,a.env_ip";
        sql = "select * from (" + common_sql + " and lower(a.env_state)= 'running'  " + proj_code_sql + "  order by a.create_date desc) where rownum<13";
    }
    System.out.println(sql);
    rs = db.execSQL(sql);
%>
<div align="center"><font color="#0000EE"><strong><br>
    <span class="s105">应用环境信息查询</span></strong></font>
</div>
<%if ("".equals(request.getParameter("info"))) {%>

<%} else {%>
<br>

<div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%>
</font></div>
<%}%>
<form name="form1" action="" method="post" class="en">
    <table cellpadding="0" cellspacing="0" border="0" width="90%">
        <tr>
            <td align="center" class="en">
                <select name="env_ip" class="en">
                    <option value="环境IP">环境IP</option>
                </select>
            </td>
            <td align="left" class="en">
                <%if ("".equals(request.getParameter("txt_env_ip")) || request.getParameter("txt_env_ip") == null) {%>
                <input type="text" name="txt_env_ip" value="" class="en" size="20">
                <%} else {%>
                <input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="en"
                       size="20">
                <%}%>
            </td>
            <td align="center" class="en">
                <select name="col_name" class="en">
                    <%if ("".equals(request.getParameter("col_name")) || request.getParameter("col_name") == null) {%>
                    <option value="env_name">项目环境名</option>
                    <option value="mac_ip">物理IP</option>
                    <option value="proj_grp">项目环境属组</option>
                    <option value="env_state">环境运行状态</option>
                    <option value="app_name">中间件类型</option>
                    <%} else {%>
                    <%if ("mac_ip".equals(request.getParameter("col_name"))) {%>
                    <option value="mac_ip">物理IP</option>
                    <option value="env_name">项目环境名</option>
                    <option value="proj_grp">项目环境属组</option>
                    <option value="env_state">环境运行状态</option>
                    <option value="app_name">中间件类型</option>
                    <%}%>
                    <%if ("env_name".equals(request.getParameter("col_name"))) {%>
                    <option value="env_name">项目环境名</option>
                    <option value="mac_ip">物理IP</option>
                    <option value="proj_grp">项目环境属组</option>
                    <option value="env_state">环境运行状态</option>
                    <option value="app_name">中间件类型</option>
                    <%}%>
                    <%if ("proj_grp".equals(request.getParameter("col_name"))) {%>
                    <option value="proj_grp">项目环境属组</option>
                    <option value="mac_ip">物理IP</option>
                    <option value="env_name">项目环境名</option>
                    <option value="env_state">环境运行状态</option>
                    <option value="app_name">中间件类型</option>
                    <%}%>
                    <%if ("env_state".equals(request.getParameter("col_name"))) {%>
                    <option value="env_state">环境运行状态</option>
                    <option value="mac_ip">物理IP</option>
                    <option value="env_name">项目环境名</option>
                    <option value="proj_grp">项目环境属组</option>
                    <option value="app_name">中间件类型</option>
                    <%}%>
                    <%if ("app_name".equals(request.getParameter("col_name"))) {%>
                    <option value="app_name">中间件类型</option>
                    <option value="env_state">环境运行状态</option>
                    <option value="mac_ip">物理IP</option>
                    <option value="env_name">项目环境名</option>
                    <option value="proj_grp">项目环境属组</option>
                    <%}%>
                    <%}%>
                </select>
            </td>
            <td align="left" class="en">
                <%if ("".equals(request.getParameter("col_value")) || request.getParameter("col_value") == null) {%>
                <input type="text" id="env_name_input" name="col_value" value="" size="20">
                <%} else {%>
                <input type="text" id="env_name_input" name="col_value" value="<%=request.getParameter("col_value")%>"
                       size="20">
                <%}%>
            </td>
            <td align="center" class="en">
                <select name="env_state" class="en">
                    <option value="环境运行状态">状态</option>
                </select>
            </td>
            <td align="center" class="en">
                <select name="txt_env_state" class="en">
                    <%if ("%".equals(request.getParameter("txt_env_state"))) {%>
                    <option value="%" selected="selected">all</option>
                    <option value="running">running</option>
                    <option value="stopped">stopped</option>
                    <%} else {%>
                    <%if ("running".equals(request.getParameter("txt_env_state")) || request.getParameter("txt_env_state") == null) {%>
                    <option value="running" selected="selected">running</option>
                    <option value="stopped">stopped</option>
                    <option value="%">all</option>
                    <%}%>
                    <%if ("stopped".equals(request.getParameter("txt_env_state"))) {%>
                    <option value="stopped" selected="selected">stopped</option>
                    <option value="running">running</option>
                    <option value="%">all</option>
                    <%}%>
                    <%}%>
                </select>
            </td>

            <td align="center" class="en">&nbsp;</td>
            <%
                sql2 = "select distinct proj_grp from ts_proj";
                rs2 = db.execSQL(sql2);
                System.out.println(sql2);
            %>
            <td class="en" align="center">
                <SELECT name="proj_grp"
                        onChange="change(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)">
                    <option value="">项目属组</option>
                    <%if (null != request.getParameter("proj_grp")) {%>
                    <option value="<%=request.getParameter("proj_grp")%>"
                            selected="selected"><%=request.getParameter("proj_grp")%>
                    </option>
                    <%
                        }

                        while (rs2.next()) {
                    %>
                    <option value="<%=rs2.getString("proj_grp")%>"><%=rs2.getString("proj_grp")%>
                    </option>
                    <%}%>
                </select>
            </td>
            <td align="center" class="en">&nbsp;</td>
            <td align="center" class="en">
                <select name="proj_name" class="select7">
                    <option value="">项目名</option>
                    <%
                        System.out.println(sql1);
                        rs3 = db.execSQL(sql1);
                        while (rs3.next()) {
                            if (rs3.getString("proj_id").equals(request.getParameter("proj_name"))) {%>
                    <option value="<%=rs3.getString("proj_id")%>" selected="selected"><%=rs3.getString("proj_name")%>
                    </option>
                    <%}%>
                    <%}%>
                </SELECT>
            </td>

            <td align="center" class="en"><input type="button" name="button1" value="查询" class="en" onClick="check()">
            </td>
        </tr>
    </table>
    <input type="hidden" name="flag" value="y">
</form>
<br>
<table id="maintable" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
       bordercolordark="#EFEFEF" align="center">
    <thead>
    <tr height="22" bgcolor="#0000EE">
        <td align="center" class="en" width="8%"><font color="#ffffff"><strong>MAC IP</strong></font></td>
        <td align="center" class="en" width="8%"><font color="#ffffff"><strong>环境IP</strong></font></td>
        <td align="center" class="en" width="13%"><font color="#ffffff"><strong>APP Info & Details</strong></font></td>
        <td align="center" class="en" width="5%"><font color="#ffffff"><strong>Status</strong></font></td>
        <td align="center" class="en" width="4%"><font color="#ffffff"><strong>URL</strong></font></td>
        <td align="center" class="en" width="7%"><font color="#ffffff"><strong>APP Access</strong></font></td>
        <td align="center" class="en" width="10%"><font color="#ffffff"><strong>DB Acess</strong></font></td>
        <td align="center" class="en" width="18%"><font color="#ffffff"><strong>Current Version</strong></font></td>
        <td align="center" class="en" width="5%"><font color="#ffffff"><strong>Console</strong></font></td>
        <td align="center" class="en" width="5%"><font color="#ffffff"><strong>Deploy</strong></font></td>
        <td align="center" class="en" width="6%"><font color="#ffffff"><strong>Modify<strong></font></td>
        <td align="center" class="en" width="10%"><font color="#ffffff"><strong>Rename&Regroup<strong></font></td>
        <%if (flag == 1) {%>
        <td align="center" class="en" width="6%"><font color="#ffffff"><strong>Delete<strong></font></td>
        <%}%>
    </tr>
    </thead>
    <tbody>
    <%
        int sum = 0;
        while (rs.next()) {

            sum++;
            if ((sum % 2) == 1) {
                out.println("<tr bgcolor=#eeeeee height=22>");
            } else {
                out.println("<tr bgcolor=#ffffff height=22>");
            }
    %>

    <td align="left" class="en"><font color="#0000EE">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
    <td id="env_ip" align="left" class="en"><font color="#0000EE">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
    <%// System.out.println("------------"); %>
    <td align="left" class="en"><a href="#"
                                   onClick="open_win('new.env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>',800,650);"><font
            color="#0000EE">&nbsp;<%=rs.getString("ENV_NAME")%>
    </a>&nbsp;</font></td>
    <td align="center" class="en"><font color="#0000EE">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
    <td align="center" class="en"><font color="#0000EE"><a href=<%=rs.getString("APP_URL")%> target=_blank>
        <% if (rs.getString("APP_URL") == null || "null".equals(rs.getString("APP_URL"))) {
            out.println("<font color=#ddddee>Null</font>");
        } else {
            out.print("<font color=#0000EE>Open</font>");
        } %>
    </a></td>

    <td align="center" class="en"><font color="#0000EE"><a href="javascript:"
                                                           onClick="execPutty('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>')">
        <%
            /* Socket s=null;
             try{
                  //System.out.print("Trying SSH to "+rs.getString("ENV_IP")+"...");
                 s=new Socket(InetAddress.getByName(rs.getString("ENV_IP")),22);
                   out.print("<font color=green>Alive</font>");
                   //System.out.println(" Alive!\n");
             }
             catch(IOException e){
                   out.print("<font color=#005566>Down</font>");
                  System.out.println("Host "+rs.getString("ENV_IP")+" unreachable.\n");
             }finally{
                  try{s.close();}catch(Exception e){}
             } */
        %>SSH</a>
        <a href="javascript:"
           onClick="execFileZilla('<%=rs.getString("ENV_IP")%>','<%=rs.getString("ENV_USR")%>','<%=rs.getString("ENV_PWD")%>','<%=rs.getString("APP_INST_PATH")%>','sftp')">FTP</a>
    </td>

    <td align="center" class="en"><font color="#0000EE"><a href="javascript:"
                                                           onClick="execPutty('<%=rs.getString("DB_IP")%>','<%=session.getAttribute("username")%>','x')">SSH</a>
        <font color="#0000EE"><a href="javascript:"
                                 onClick="execPLSQL('<%=rs.getString("DB_LDAP_NAME")%>','<%=rs.getString("DB_USER")%>','<%=rs.getString("DB_USER_PASSWD")%>')"><font
                color="#0000EE">PLSQL</font></a>&nbsp;</td>
    <td align="center" class="en"><font color="#0000EE"><%=rs.getString("APP_VERSION")%>
    </td>
    <td align="center" class="en"><font color="#0000EE"><a href=<%=rs.getString("APP_CONSOLE")%> target=_blank>
        <% if (rs.getString("APP_CONSOLE") == null || "null".equals(rs.getString("APP_CONSOLE"))) {
            out.println("<font color=#ddddee>Null</font>");
        } else {
            out.print("<font color=#0000EE>Open</font>");
        } %></a></td>
    <% // System.out.println("-1-----------"); %>

    <%
        sql_tmp = "SELECT  unique a.env_name, c.account A1, d.account A2 from ts_env a,  ts_proj b, ts_member c, ts_member d where a.proj_id = b.proj_id(+) and b.owner1=c.no(+) and b.owner2=d.no(+) and a.env_name='" + rs.getString("ENV_NAME") + "'";
        // System.out.println("-1-----------");
        rs_tmp = db.execSQL(sql_tmp);
        //System.out.println(sql_tmp);
        while (rs_tmp.next()) {
            String loginid = new String();
            loginid = session.getAttribute("username").toString().toLowerCase(); %>
    <td align="center" class="en" nowrap>&nbsp;<a href="#"
                                                  onClick="open_win('ts_deploy_env.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',800,550);">Deploy</a>&nbsp;
    </td>
    <%
        //System.out.println(loginid+":"+rs_tmp.getString("ENV_NAME")+":"+rs_tmp.getString("A1")+" and "+rs_tmp.getString("A2"));
        if (flag == 1) {%>
    <td align="center" class="en">&nbsp;<a href="#"
                                           onClick="open_win('env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>',800,650);"><font
            color="#0000EE">App</a>&nbsp;
        <a href="#" onClick="open_win('db_server_update.jsp?id=<%=rs.getInt("DB_ID")%>',800,650);"><font
                color="#0000EE">DB</a>&nbsp; </td>
    <td align="center" class="en" nowrap>&nbsp;<font color=red><a href="#"
                                                                  onClick="open_win('ts_env_rename.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',400,300);"><font
            color=red>Rename&Regroup</font></a>&nbsp;</td>
    <%} else {%>
    <%if ((rs_tmp.getString("A1") == null) || (rs_tmp.getString("A2") == null) || loginid.equals(rs_tmp.getString("A1").toLowerCase()) || loginid.equals(rs_tmp.getString("A2").toLowerCase())) {%>
    <td align="center" class="en">&nbsp;<a href="#"
                                           onClick="open_win('env_info_update.jsp?id=<%=rs.getInt("ENV_ID")%>',800,650);"><font
            color="#0000EE">App</a>&nbsp;
        <a href="#" onClick="open_win('db_server_update.jsp?id=<%=rs.getInt("DB_ID")%>',800,650);"><font
                color="#0000EE">DB</a>&nbsp; </td>
    <td align="center" class="en" nowrap>&nbsp;<a href="#"
                                                  onClick="open_win('ts_env_rename.jsp?env_id=<%=rs.getInt("ENV_ID")%>&env_name=<%=rs.getString("ENV_NAME")%>',400,300);"><font
            color=red>Rename</font></a>&nbsp;</td>
    <%} else {%>
    <td width="1%" align="center" class="en">-</td>
    <td align="center" class="en" nowrap>-</td>
    <%}%>
    <%}%>
    <%} // end of while %>

    <%if (flag == 1) {%>
    <td align="center" class="en" nowrap>&nbsp;<a href="#"
                                                  onClick="del(<%=rs.getInt("ENV_ID")%>,'<%=rs.getString("ENV_NAME")%>')"><font
            color="#0000EE">Delete</font></a>&nbsp;</td>
    <%}%>


    </tr>
    <%}%>
    </tbody>
</table>

<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp"/>
</body>
<script language="javascript">
    function del(id, env_name) {
        var a = confirm("Confirm delete environment " + env_name + "?");
        if (a == true) {
            window.location = "env_info_delete.jsp?id=" + id;
        }
    }
    function migrate(id) {
        var a = confirm("确认要迁移吗？");
        if (a == true) {
            window.location = "env_info_migrate.jsp?id=" + id;
        }
    }

</script>
</html>
