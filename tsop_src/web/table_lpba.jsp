<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>理赔报案登记表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/nsl/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	font-size: 20px;
	font-weight: bold;
}
body,td,th {
	color: #000000;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
<tr> 
<td height="50" align="center" valign="bottom"><span class="style2">理赔报案登记表</span></td>
</tr>
</table>
<br>
<form name="form1" action="table_lpba_done.jsp" method="post">
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="84%" align="right" bgcolor="#FFFFFF"><strong>报案编号：</strong></td>
    <td width="16%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr>
<td width="43%" bgcolor="#FFFFFF">报案时间：
  <input name="report_year" type="text" class="textfiled" size="6">
  年
  <input name="report_month" type="text" class="textfiled" size="3">
  月
  <input name="report_day" type="text" class="textfiled" size="3">
  日<br>时
  <input name="report_hour" type="text" class="textfiled" size="14"></td>
<td width="29%" valign="top" bgcolor="#FFFFFF">受理人：
  <input name="accept_person" type="text" class="textfiled" size="14"></td>
<td width="28%" valign="top" bgcolor="#FFFFFF">工号：
  <input name="accept_number" type="text" class="textfiled" size="14"></td>
</tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>报案人资料</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="33%" bgcolor="#FFFFFF">姓名：
    <input name="report_person" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">与出险人关系：
    <input name="report_relation" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">联系电话：
    <input name="report_telephone" type="text" class="textfiled" size="14"></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#FFFFFF">联系地址：
    <input name="report_address" type="text" class="textfiled" size="92"></td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>出险人资料</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="33%" bgcolor="#FFFFFF">保险合同号码：
        <input name="contract_no" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">姓名：
        <input name="insurance_name" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">身份证号码：
        <input name="identity_no" type="text" class="textfiled" size="14"></td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">联系地址： 
      <input name="insurance_address" type="text" class="textfiled" size="49"></td>
    <td bgcolor="#FFFFFF">联系电话：
    <input name="insurance_telephone" type="text" class="textfiled" size="14"></td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>事故资料</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="50%" colspan="2" bgcolor="#FFFFFF">事故类别：
    <input name="accidental" type="checkbox" value="accidental">
    意外
    <input name="hospital" type="checkbox" value="hospital">
    住院
    <input name="sickness" type="checkbox" value="sickness">
    重疾
    <input name="death" type="checkbox" value="death">
    身故
    <input name="other" type="checkbox" value="other">
    其他（
    <input name="other_content" type="text" class="textfiled" size="14">
    ）</td>
  </tr>
  <tr>
    <td width="50%" bgcolor="#FFFFFF">事故发生时间：
	
<input name="accident_year" type="text" class="textfiled" size="6">
年
<input name="accident_month" type="text" class="textfiled" size="3">
月
<input name="accident_day" type="text" class="textfiled" size="3">
日<br>
时
<input name="accident_hour" type="text" class="textfiled" size="14"></td>
    <td width="50%" valign="top" bgcolor="#FFFFFF">事故发生地点：
    <input name="accident_place" type="text" class="textfiled" size="30"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">事故就诊医院：
    <input name="accident_hospital" type="text" class="textfiled" size="26"></td>
    <td bgcolor="#FFFFFF">事故处理机关：
    <input name="accident_department" type="text" class="textfiled" size="30"></td>
  </tr>
  <tr valign="top">
    <td colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="13%" valign="top">事故经过描述：          </td>
        <td width="87%"><textarea name="accident_description" cols="70" rows="8"></textarea></td>
      </tr>
    </table>
      <div align="right"><br>
      报案人签名：
      <input name="accident_description_sign" type="text" class="accident_person" size="14">
      <br>
      </div></td>
  </tr>
  <tr valign="top">
    <td colspan="2" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="23%">出险人当前身体状况：</td>
        <td width="17%"><input type="checkbox" name="body_1" value="body_1">痊愈</td>
        <td width="17%"><input type="checkbox" name="body_2" value="body_2">好转</td>
        <td width="13%"><input type="checkbox" name="body_3" value="body_3">未愈</td>
        <td width="30%"><input type="checkbox" name="body_4" value="body_4">身故</td>
      </tr>
      <tr>
        <td>出险人其他情况：</td>
        <td><input type="checkbox" name="instance_1" value="instance_1">住院治疗</td>
        <td><input type="checkbox" name="instance_2" value="instance_2">门诊治疗</td>
        <td><input type="checkbox" name="instance_3" value="instance_3">在家</td>
        <td><input type="checkbox" name="instance_4" value="instance_4">住院日数需超过15天</td>
      </tr>
    </table></td>
  </tr>
</table>
<div align="center"><br>
  <input type="submit" name="submit1" value="提交">
  <input type="reset" name="reset1" value="重置">
  <br>
  <br>
</div>
</form>
</body>
</html>
