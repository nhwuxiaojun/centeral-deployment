<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="check.jsp"%>
<html>
<head>
<title>欢迎访问</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/style_en.css" rel="stylesheet" type="text/css">
<link href="../css/media.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
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
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>

<table width="978" height="70" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td height="50" ><a href="http://ts.ebaotech.com/tsop/ext/"><img src="../images/logo_ebaotech.gif" border=0 /></td>
  <td>&nbsp;</td>
  <td width="637" align="center" ><div align="right"><img src="images/slogan_ebaotech.gif" width="325" height="35">
                <br>hello!&nbsp;&nbsp;<%=session.getAttribute("username")%>
  </div></td>
</tr>
<tr>
<td bgcolor="#646464" width="180">&nbsp;&nbsp;<a href="../ext/index.jsp"><font color=#ffffff>Entry for Project Team Query</font></a></td>
<td bgcolor="#969696"><img src="images/1x1.gif" width="8" height="8"></td>
<td height="25" colspan="2" bgcolor="#969696"><div align="right">
  <%@include file="include/topnav.inc" %></div> </td>
</tr>
</table>
<br>
<table width="978" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="180" align="center" valign="top"><%@include file="include/main4.inc" %>
    </td><td><img src="images/1x1.gif" width="6" height="1"></td>
<td background="images/bg_vline.gif" valign="top"><img src="images/bg_vline.gif" width="1" height="4"></td><td width="791" align="center" valign="top">  <table width="95%" height="260" border="0" cellpadding="0" cellspacing="0">
    <tr>
      	<td valign="top" align="center">
		<iframe id="iframe1" frameborder=0 name="ifra1" src="../backup_info_query.jsp" width="780" height="490"></iframe>
        </td>
    </tr>
  </table>
</td>
</tr>
<tr>
  <td colspan="4" align="center" valign="top"><div align="left">
    <hr size="1" noshade class="intro">
    Copyright &copy; 2000-<SCRIPT language=LiveScript> 
  today = new Date()
  document.write(today.getYear());
        </SCRIPT> <A class=newsitem href="http://www.ebaotech.com">eBaoTech Corporation</A> All rights reserved. &#29256;&#26435;&#25152;&#26377; &#26131;&#20445;&#32593;&#32476;&#25216;&#26415;&#26377;&#38480;&#20844;&#21496; &#26410;&#32463;&#35768;&#21487;&#19981;&#24471;&#36716;&#36733;<br>
    <br>
  </div></td>
  </tr>
</table>
</center>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
