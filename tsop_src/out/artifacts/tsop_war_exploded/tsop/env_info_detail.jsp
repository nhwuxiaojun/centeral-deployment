<%@ include file="../interface/check.jsp"%>
<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title><%=request.getParameter("env_ip")%>应用环境信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35589746-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
ResultSet rs;
ResultSet rs_temp;
//sql="select * from a_proj_env_svr where mac_ip='"+request.getParameter("mac_ip")+"' and env_ip='"+request.getParameter("env_ip")+"'";
//sql = "select b.*, a.backup_type from a_apply a, a_proj_env_svr b where a.new_env(+) = b.proj_env and b.env_id = " + request.getParameter("id");
sql = "select b.*, a.backup_type, c.print_user, c.print_pwd from a_apply a, a_proj_env_svr b, ts_print c where a.new_env(+) = b.proj_env and b.print_ip=c.print_ip(+) and  b.env_id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<body>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105"><%=rs.getString("PROJ_ENV")%> 应用环境信息详细</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td width="80%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("MAC_IP")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("ENV_IP")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>webServer实例路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("WEB_INST_PATH")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>HTML路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("HTML_PATH")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>appServer名称版本</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("APP_NAME")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>appServer实例路径</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("APP_INST_PATH")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>appServer绑定端口</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("APP_PORT")%></font></td>
	</tr>
        <tr>
          <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接信息</strong></font></td>
          <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">
                        <%
                        sql_temp="select * from a_db_svr where db_status='running' and db_user_type='owner' and proj_env='"+rs.getString("PROJ_ENV")+"'";
                        System.out.println(sql_temp);
                        rs_temp = db.execSQL(sql_temp);
                        while(rs_temp.next()){
                            out.print(rs_temp.getString("DB_LDAP_NAME")+"-"+rs_temp.getString("DB_IP")+":"+rs_temp.getString("DB_PORT_NUM")+":"+rs_temp.getString("DB_SID"));
                        %>
        </td>
        </tr>
        <tr>
          <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接用户</strong></font></td>
          <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs_temp.getString("DB_USER")%></font></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#D2D2D2" class="en" width="30%"><font color="#3333cc"><strong>数据库连接密码</strong></font></td>
          <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs_temp.getString("DB_USER_PASSWD")%></font></td>
        </tr>
        <%}%>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>SSH&FTP管理用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("ENV_USR")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>SSH&FTP管理密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("ENV_PWD")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>控制台管理用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("CON_USR")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>控制台管理密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("CON_PWD")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境项目属组</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("PROJ_GRP")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>页面登陆地址</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("PROJ_DNS")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境创建人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("CREATER")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境创建日期</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getDate("CRT_DATE")%><%=rs.getTime("CRT_DATE")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境申请人</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("PROPOSER")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>是否需要备份</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=Tools.msNull(rs.getString("BACKUP_TYPE"))%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>环境运行状态</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("ENV_STATE")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>项目代码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("PROJ_CODE")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>应用备份目录</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=Tools.msNull(rs.getString("BACKUP_DIR"))%></font></td>
	</tr>
		<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>DMS类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=Tools.msNull(rs.getString("DMS_TYPE"))%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>Print类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=Tools.msNull(rs.getString("PRINT_TYPE"))%></font></td>
	</tr>
	
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>打印IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("print_ip")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>打印用户</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("print_user")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>打印密码</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=rs.getString("print_pwd")%></font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>打印目录</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><%=Tools.msNull(rs.getString("print_dir"))%></font></td>
	</tr>
	
	
	
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#3333cc"><strong>备注</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc"><textarea name="NOTE" cols="30" rows="5" readonly><%=Tools.msNull(rs.getString("NOTE"))%></textarea></font></td>
	</tr>
</table>
<%}%>
</body>
<%db.close();%>
<%rs.close();%>
</html>
