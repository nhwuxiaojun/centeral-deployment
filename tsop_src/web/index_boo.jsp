<%@ page contentType="text/html; charset=gb2312" errorPage=""%>
<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/media.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
	font:11px verdana;
}
td{ font:11px verdana;}
.text
{
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;
}
.button1
{   height:16pt;
    width:35pt;
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;	 
}
.style1 {
	font-size: 9px;
	color: #000000;
}
.style3 {color: #000000; font-size: 11px; }
.STYLE4 {color: #000000}
-->
</style></head>

<body onLoad="form1.username.focus();">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="interface/images/index_bg.jpg"><table width="778"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="233"><img src="interface/images/login_r1_c1.jpg" width="233" height="189"></td>
        <td colspan="2" align="right" valign="top"><img src="interface/images/login_r1_d6.jpg" width="335" height="126"></td>
      </tr>
      <tr>
        <td><img src="interface/images/login_r3_c1.jpg" width="233" height="431"></td>
        <td width="210"><img src="interface/images/login_r3_c2.jpg" width="210" height="431"></td>
        <td width="335" align="center" valign="top" background="interface/images/login_r3_c3.jpg"><table width="95%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="400" align="center" valign="top"><table width="75%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="49" colspan="2">&nbsp;</td>
              </tr>
			  <form name="form1" action="login_boo.jsp" method="post">
              <tr>
                <td width="37%" height="30"><span class="style3">User ID </span></td>
                <td width="63%"><input name="username" type="text" size="16" class="text"></td>
              </tr>
              <tr>
                <td height="30"><span class="style3">Password</span></td>
                <td><input name="password" type="password" size="16" class="text"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
				<td height="30" align="left">
                  <input type="button" name="button1" value="Login" class="button1" onClick="check()">
				  <input type="button" name="button3" value="Exit" class="button1" onClick="exit()">
				</td>
              </tr>
			  </form>
            </table>
              <br>
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><span class="STYLE4">If you have any trouble to login please don not hesitate to contact Guanyi.Chen(2278).<br>
                    QA Department serves you with great pleasure.<br>
                    </span></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td align="center"><span class="style3">Copyright &copy; 
              <SCRIPT language=LiveScript>today = new Date()
  document.write(today.getYear());
                </SCRIPT>
<A class=newsitem href="http://www.ebaotech.com">eBaoTech Corporation</A></span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script language="JavaScript">
function check(){
	if(form1.username.value==""){
		alert("please insert user id!");
		form1.username.focus();
		return;
	}
	if(form1.password.value==""){
		alert("please insert password!");
		form1.password.focus();
		return;
	}
	form1.submit();
}
function exit(){
	window.close();
}
</script>
</html>