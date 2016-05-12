<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ include file="../interface/check.jsp"%>
<%
  response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
  response.setHeader("Pragma","no-cache"); //HTTP 1.0
  response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
  <title>App Info Update</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  <link href="css/ebao.css" rel="stylesheet" type="text/css">
  <script src="scripts/jquery-1.11.1.js" type="text/javascript"></script>
  <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
  <link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<%
  DBean db = new DBean();
  String sql = new String();
  String sql_temp = new String();
  String sql_temp1 = new String();
//  ResultSet rs;
  ResultSet rs_temp;
  ResultSet rs_temp1;
//  sql = "select * from a_proj_env_svr where env_id = " + request.getParameter("id");
//  rs = db.execSQL(sql);
%>
<script language="javascript">
  window.onload = function() {
    $(":text").focus ( function() {
      $(this).css("background","yellow");
    }).blur(function() {
      $(this).css("background","#fff");
    });
    $('#INC_DEPLOY_PARA').autocomplete({ source: ["upgrade","inc_deploy","increment_deploy"] });
    $('#FULL_DEPLOY_PARA').autocomplete({ source: ["upgrade","full_deploy","increment_deploy"] });
  };


  function check(){
    if(form1.MAC_IP.value==""){
      alert("请输入MAC IP");
      return;
    }
    if(form1.ENV_IP.value==""){
      alert("请输入环境IP");
      return;
    }
    if(form1.INC_DEPLOY_PARA.value==""){
      alert("Please input Deployment parameter!");
      form1.INC_DEPLOY_PARA.focus();
      return;
    }
    if(form1.WEB_INST_PATH.value==""){
      alert("请输入webServer实例路径");
      return;
    }
    if(form1.HTML_PATH.value==""){
      alert("请输入HTML路径");
      return;
    }
    if(form1.APP_NAME.value==""){
      alert("请输入appServer名称版本");
      return;
    }
    if(form1.APP_INST_PATH.value==""){
      alert("请输入appServer实例路径");
      return;
    }
    if(form1.APP_PORT.value==""){
      alert("请输入appServer绑定端口");
      return;
    }
    if(form1.ENV_USR.value==""){
      alert("请输入环境管理用户");
      return;
    }
    if(form1.ENV_PWD.value==""){
      alert("请输入环境管理密码");
      return;
    }
    if(form1.CON_USR.value==""){
      alert("请输入控制台管理用户");
      return;
    }
    if(form1.CON_PWD.value==""){
      alert("请输入控制台管理密码");
      return;
    }
    //if(form1.PROJ_ENV.value==""){
//		alert("请输入项目环境名");
//		return;
//	}
    //if(form1.PROJ_DNS.value==""){
    //alert("请输入环境域名");
    //return;
    //}
    if(form1.CRT_DATE.value==""){
      alert("请输入环境创建日期");
      return;
    }
    if(form1.PROPOSER.value==""){
      alert("请输入环境申请人");
      return;
    }
    if(form1.ENV_STATE.value==""){
      alert("请输入环境运行状态");
      return;
    }
//	form1.target="_blank";
    form1.submit();
    //window.history.go(-1);
  }
</script>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body>
<form name="form1" action="env_info_add_new_finish.jsp" method="post">

  <div align="center"><font color="#3333cc"><strong><br>
  <span class="s105"><%=request.getParameter("PROJ_ENV")%>&nbsp;&nbsp;
  <%
    sql_temp="select * from a_proj_env_svr where env_state='running' and proj_env='"+request.getParameter("PROJ_ENV")+"'";
    System.out.println(sql_temp);
    rs_temp = db.execSQL(sql_temp);
    while(rs_temp.next()){
      out.print("<a href=env_info_update.jsp?id="+rs_temp.getString("ENV_ID")+">");
    }
  %>
  <font color=red>应用环境信息修改</a></span></strong></font>&nbsp;&nbsp;
  <span class="s105">
  <%
    sql_temp="select * from a_db_svr where db_status='running' and db_user_type='owner' and proj_env='"+request.getParameter("PROJ_ENV")+"'";
    System.out.println(sql_temp);
    rs_temp = db.execSQL(sql_temp);
    while(rs_temp.next()){
      out.print("<a href=db_server_update.jsp?id=" + rs_temp.getString("DB_ID") + ">");
    }
  %>

  数据库信息修改</a></span></strong></font>

  </div>
  <br><br>
  <table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
    <input size=40 type="hidden" name="PROJ_ENV" value="<%=request.getParameter("PROJ_ENV")%>">
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>物理IP/环境IP</strong></font></td>
      <td width="70%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=17 name="MAC_IP" class="text">&nbsp;&nbsp;<input size=17 name="ENV_IP" class="text"></font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>webServer实例路径</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="WEB_INST_PATH" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>HTML路径</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="HTML_PATH" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer名称版本</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <%
          sql_temp = "select appsoft_ver from a_property where appsoft_ver is not null";
          rs_temp = db.execSQL(sql_temp);
          System.out.println(sql_temp);
        %>
        <select name="APP_NAME">
          <%while(rs_temp.next()){%>
          <option value="<%=rs_temp.getString("appsoft_ver")%>"><%=rs_temp.getString("appsoft_ver")%></option>
          <%}%>
        </select>&nbsp;&nbsp;
        <%rs_temp.close();%>
      </td>
    </tr>
    <% System.out.println("---temp while---"); %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer实例路径</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="APP_INST_PATH" class="text">&nbsp;</font></td>
    </tr>

    <% System.out.println("---temp while---"); %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer绑定端口</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="APP_PORT" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>debug端口</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="DEBUG_PORT" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>appServer Console</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 type="url" required="required" placeholder="http://IP:port/console" name="APP_CONSOLE" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color=red><strong>App Deployment Parameter</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <input size=18 id="INC_DEPLOY_PARA" name="INC_DEPLOY_PARA" class="text">&nbsp;
        <input size=18 id="FULL_DEPLOY_PARA" name="FULL_DEPLOY_PARA" class="text">
      </td>
    </tr>
    <tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境管理用户/密码</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=17 name="ENV_USR" class="text">&nbsp;&nbsp;<input size=17 name="ENV_PWD" class="text"></font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>控制台管理用户/密码</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=17 name="CON_USR" class="text">&nbsp;&nbsp;<input size=17 name="CON_PWD" class="text"></font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>页面登陆地址</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="PROJ_DNS" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境创建人/申请人</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=17 name="CREATER" class="text">&nbsp;&nbsp;<input size=17 name="PROPOSER"></font></td>
    </tr>


    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>环境创建日期 & Status</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=20 name="CRT_DATE" class="text" onFocus="show_cele_date(CRT_DATE,'','',CRT_DATE)">&nbsp;</font>
        <%
          sql_temp = "select distinct proj_status from a_property where proj_status is not null";
          rs_temp = db.execSQL(sql_temp);
        %>
        & <select name="ENV_STATE">
          <%while(rs_temp.next()){%>
          <option value="<%=rs_temp.getString("proj_status")%>"><%=rs_temp.getString("proj_status")%></option>
          <%}%>
        </select>
      </td>
    </tr>
    <%
      sql_temp = "select distinct dms_type from a_property  where dms_type is not null";
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>DMS & Print 类型</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <select name="DMS_TYPE">
          <option value="null" selected = "selected">null</option>
          <%while(rs_temp.next()){%>
          <option value="<%=rs_temp.getString("dms_type")%>"><%=rs_temp.getString("dms_type")%></option>
          <%}%>
        </select>

        <%
          sql_temp = "select distinct print_type from a_property  where print_type is not null";
          rs_temp = db.execSQL(sql_temp);
        %>
        & <select name="PRINT_TYPE">
        <option value="null" selected = "selected">null</option>
        <%while(rs_temp.next()){%>
        <option value="<%=rs_temp.getString("print_type")%>"><%=rs_temp.getString("print_type")%></option>
        <%}%>
      </select>
      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>打印IP</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
        <select name="print_ip" class="select5">
          <option value="null" selected = "selected">null</option>
          <%
            sql_temp="select distinct print_ip from ts_print";
            rs_temp=db.execSQL(sql_temp);
          %>
          <%while(rs_temp.next()){
            if(rs_temp.getString("print_ip")!=null){
              out.println("<option value="+rs_temp.getString("print_ip")+">"+rs_temp.getString("print_ip")+"</option>");
            }
          }%>
        </select>
        <a href="ts_print_query.jsp" target="_blank">Add Print Server</a>
      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>打印目录</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input size=40 name="print_dir" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>备注</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <textarea name="NOTE" cols="45" rows="3"></textarea>
      </td>
    </tr>

  </table>
  <%--<input size=40 type="hidden" name="ENV_ID" value="<%=request.getParameter("id")%>">--%>

  <br>
  <div align="center">
    <input size=40 type="button" name="button1" value="Submit" onClick="check()">&nbsp;&nbsp;
    <input size=40 type="reset" name="reset1" value="Reset">&nbsp;&nbsp;
    <input size=40 type="button" name="button2" value="Close" onClick="window.close()"></div>
</form>
</body>
<%db.close();%>
</html>
