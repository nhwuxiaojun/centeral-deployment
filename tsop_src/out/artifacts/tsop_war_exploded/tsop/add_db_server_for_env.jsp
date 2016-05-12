<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%
  response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
  response.setHeader("Pragma","no-cache"); //HTTP 1.0
  response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
  <title>DB Info Add</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  <link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
  DBean db = new DBean();
  String sql = new String();
  String sql_temp = new String();
//  ResultSet rs;
  ResultSet rs_temp;
//  sql = "select * from a_db_svr where proj_env = " + request.getParameter("PROJ_ENV");
//out.print(sql);
//  rs = db.execSQL(sql);
%>
<script language="javascript">

  var onecount;
  onecount = 0;
  subcat = [];
  <%
  sql_temp = "select * from ts_db";
  rs_temp = db.execSQL(sql_temp);
  int count = 0;
  while(rs_temp.next()){
  %>
  subcat[<%=count%>] = ["<%=rs_temp.getString("db_ip").trim()%>","<%=rs_temp.getString("db_sid").trim()%>","<%=rs_temp.getString("ldap_name").trim()%>"];
  <%
  count++;
  }
  rs_temp.close();
  %>
  temp = <%=count%>;

  function change(team_id){
    document.form1.db_sid.length = 0;
    var team_id = team_id;
    var i;
    var current;
    for (i=0;i<temp;i++){
      if (subcat[i][0] == team_id){
        document.form1.db_sid.options[document.form1.db_sid.length] = new Option(subcat[i][1], subcat[i][1],false,false);
        document.form1.db_ldap_name.value = "";
        document.form1.db_ldap_name.value = subcat[i][2];
        current=i;
        //window.alert(document.form1.db_sid.length);
        //window.alert(subcat[i][1]);
      }
    }
    document.form1.db_sid.options[0].selected = true;
    document.form1.db_sid.value = subcat[current][1];
    document.form1.db_ldap_name.value=subcat[current][2];
    //window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
    // getDbUser() ;

  }

  function check(){
    if(form1.DB_IP.value==""){
      alert("请输入数据库IP");
      return;
    }
    /*
     if(form1.OS_DB_USER.value==""){
     alert("请输入安装用户名");
     return;
     }
     if(form1.OS_DB_PASSWD.value==""){
     alert("请输入用户密码");
     return;
     }
     */
    if(form1.db_sid.value==""){
      alert("请输入数据库实例名");
      return;
    }
    if(form1.DB_USER.value==""){
      alert("请输入数据库用户");
      return;
    }
    if(form1.DB_USER_PASSWD.value==""){
      alert("请输入数据库用户密码");
      return;
    }
    if(form1.DB_USER_TYPE.value==""){
      alert("请输入数据库用户类型");
      return;
    }
    //if(form1.PROJ_ENV.value==""){
    //alert("请输入项目环境名");
    //return;
    //}
    if(form1.PROPOSER.value==""){
      alert("请输入数据库环境申请人");
      return;
    }
    if(form1.CREATER.value==""){
      alert("请输入数据库环境创建人");
      return;
    }
    if(form1.CREATE_DATE.value==""){
      alert("请输入数据库环境创建日期");
      return;
    }
    /*
     if(form1.DB_VERSION.value==""){
     alert("请输入数据库版本");
     return;
     }
     if(form1.DB_CHARACTER.value==""){
     alert("请输入数据库字符集");
     return;
     }
     if(form1.DB_PORT_NUM.value==""){
     alert("请输入数据库端口号");
     return;
     }
     if(form1.DB_LISTENER.value==""){
     alert("请输入数据库监听器");
     return;
     }
     */
    if(form1.DB_STATUS.value==""){
      alert("请输入数据库运行状态");
      return;
    }
    form1.submit();
  }
  function return_back(){
    //window.location = "db_server_query.jsp";
    window.history.go(-1);
  }
</script>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body>
<form name="form1" action="db_server_add_new_finish.jsp" method="post">

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
  应用环境信息修改</a></span></strong></font>&nbsp;&nbsp;
  <span class="s105">
  <%
    sql_temp="select * from a_db_svr where db_status='running' and db_user_type='owner' and proj_env='"+request.getParameter("PROJ_ENV")+"'";
    System.out.println(sql_temp);
    rs_temp = db.execSQL(sql_temp);
    while(rs_temp.next()){
      out.print("<a href=db_server_update.jsp?id="+rs_temp.getString("DB_ID")+">");
    }
  %>
  <%--<%--%>
    <%--sql_temp="select * from a_proj_env_svr where env_state='running' and proj_env='"+request.getParameter("PROJ_ENV")+"'";--%>
    <%--System.out.println(sql_temp);--%>
    <%--rs_temp = db.execSQL(sql_temp);--%>
    <%--while(rs_temp.next()){--%>
      <%--out.print("<a href=add_db_server_for_env.jsp?PROJ_ENV="+rs_temp.getString("PROJ_ENV")+"&PROJ_CODE="+rs_temp.getString("PROJ_CODE") + ">数据库信息新增</a></span></strong></font>");--%>
      <%--System.out.println("---no db while---");--%>
    <%--}--%>
  <%--%>--%>

  <font color=red>数据库信息修改</a></span></strong></font>
  </div>
  <br><br>
  <table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
    <%
      sql_temp = "select distinct db_ip from ts_db";
      System.out.println(sql_temp);
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <td width="30%" align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
      <td width="70%" align="center" bgcolor="#FCFCFC" class="en">
        <select name="DB_IP" onChange="change(document.form1.DB_IP.options[document.form1.DB_IP.selectedIndex].value)">
          <%while(rs_temp.next()){%>
           <%if(rs_temp.getString("db_ip")!=null){%>
            <option value="<%=rs_temp.getString("db_ip")%>"><%=rs_temp.getString("db_ip")%></option>
            <%}%>
          <%}%>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <%
      sql_temp = "select * from ts_db";
      System.out.println(sql_temp);
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库实例名</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <select name="db_sid">
          <%while(rs_temp.next()){%>
          <%if(rs_temp.getString("db_sid")!=null){%>
          <option value="<%=rs_temp.getString("db_sid")%>"><%=rs_temp.getString("db_sid")%></option>
          <%}%>
          <%}%>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <%
      sql_temp = "select * from ts_db";
      System.out.println(sql_temp);
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <%--<td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>数据库TNSNAME<strong></font></td>--%>
      <%--<td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input type="text" width="40" name="db_ldap_name" class="text" value="<%=rs_temp.getString("ldap_name")%>">&nbsp;</font></td>--%>
        <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库TNSNAME</strong></font></td>
        <td align="center" bgcolor="#FCFCFC" class="en">
          <select name="db_ldap_name">
              <%while(rs_temp.next()){%>
              <%if(rs_temp.getString("ldap_name")!=null){%>
              <option value="<%=rs_temp.getString("ldap_name")%>"><%=rs_temp.getString("ldap_name")%></option>
              <%}%>
              <%}%>
          </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
      <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>数据库用户</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input type="text" name="DB_USER" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库用户密码</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="DB_USER_PASSWD" class="text">&nbsp;</font></td>
    </tr>
    <%
      sql_temp = "select distinct db_type from a_property where db_type is not null";
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库用户类型</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <select name="DB_USER_TYPE">
          <%while(rs_temp.next()){%>
            <option value="<%=rs_temp.getString("DB_TYPE")%>"><%=rs_temp.getString("DB_TYPE")%></option>
          <%}%>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目环境名</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_ENV" value="<%=request.getParameter("PROJ_ENV")%>" class="text">&nbsp;</font>*谨慎修改</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库环境申请人</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROPOSER" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库环境创建人</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CREATER" class="text">&nbsp;</font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库环境创建日期</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="CREATE_DATE" class="text" onFocus="show_cele_date(CREATE_DATE,'','',CREATE_DATE)">&nbsp;</font></td>
    </tr>
    <%
      sql_temp = "select distinct proj_status from a_property where proj_status is not null";
      rs_temp = db.execSQL(sql_temp);
    %>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en">
        <select name="DB_STATUS">
          <%while(rs_temp.next()){%>
          <option value="<%=rs_temp.getString("proj_status")%>"><%=rs_temp.getString("proj_status")%></option>
          <%}%>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>项目代码</strong></font></td>
      <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<input name="PROJ_CODE" class="text" value="<%=request.getParameter("PROJ_CODE")%>" disabled="disabled">&nbsp;</font></td>
      <input type="hidden" name="PROJ_CODE" value="<%=request.getParameter("PROJ_CODE")%>">
    </tr>
  </table>
  <input type="hidden" name="DB_ID">
  <br>
  <div align="center">
    <input type="button" name="button1" size=25 value="Update" onClick="check()" >&nbsp;&nbsp;
    <input type="reset" name="reset1" value="Reset">&nbsp;&nbsp;
    <input type="button" name="button2" value="Close" onClick="window.close()"></div>
</form>
</body>
<%db.close();%>
<%rs_temp.close();%>
</html>
