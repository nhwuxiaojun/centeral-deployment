<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>���ⱨ���ǼǱ�</title>
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
<td height="50" align="center" valign="bottom"><span class="style2">���ⱨ���ǼǱ�</span></td>
</tr>
</table>
<br>
<form name="form1" action="table_lpba_done.jsp" method="post">
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="84%" align="right" bgcolor="#FFFFFF"><strong>������ţ�</strong></td>
    <td width="16%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr>
<td width="43%" bgcolor="#FFFFFF">����ʱ�䣺
  <input name="report_year" type="text" class="textfiled" size="6">
  ��
  <input name="report_month" type="text" class="textfiled" size="3">
  ��
  <input name="report_day" type="text" class="textfiled" size="3">
  ��<br>ʱ
  <input name="report_hour" type="text" class="textfiled" size="14"></td>
<td width="29%" valign="top" bgcolor="#FFFFFF">�����ˣ�
  <input name="accept_person" type="text" class="textfiled" size="14"></td>
<td width="28%" valign="top" bgcolor="#FFFFFF">���ţ�
  <input name="accept_number" type="text" class="textfiled" size="14"></td>
</tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>����������</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="33%" bgcolor="#FFFFFF">������
    <input name="report_person" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">������˹�ϵ��
    <input name="report_relation" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">��ϵ�绰��
    <input name="report_telephone" type="text" class="textfiled" size="14"></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#FFFFFF">��ϵ��ַ��
    <input name="report_address" type="text" class="textfiled" size="92"></td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>����������</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="33%" bgcolor="#FFFFFF">���պ�ͬ���룺
        <input name="contract_no" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">������
        <input name="insurance_name" type="text" class="textfiled" size="14"></td>
    <td width="33%" valign="top" bgcolor="#FFFFFF">���֤���룺
        <input name="identity_no" type="text" class="textfiled" size="14"></td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">��ϵ��ַ�� 
      <input name="insurance_address" type="text" class="textfiled" size="49"></td>
    <td bgcolor="#FFFFFF">��ϵ�绰��
    <input name="insurance_telephone" type="text" class="textfiled" size="14"></td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><strong>�¹�����</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="50%" colspan="2" bgcolor="#FFFFFF">�¹����
    <input name="accidental" type="checkbox" value="accidental">
    ����
    <input name="hospital" type="checkbox" value="hospital">
    סԺ
    <input name="sickness" type="checkbox" value="sickness">
    �ؼ�
    <input name="death" type="checkbox" value="death">
    ���
    <input name="other" type="checkbox" value="other">
    ������
    <input name="other_content" type="text" class="textfiled" size="14">
    ��</td>
  </tr>
  <tr>
    <td width="50%" bgcolor="#FFFFFF">�¹ʷ���ʱ�䣺
	
<input name="accident_year" type="text" class="textfiled" size="6">
��
<input name="accident_month" type="text" class="textfiled" size="3">
��
<input name="accident_day" type="text" class="textfiled" size="3">
��<br>
ʱ
<input name="accident_hour" type="text" class="textfiled" size="14"></td>
    <td width="50%" valign="top" bgcolor="#FFFFFF">�¹ʷ����ص㣺
    <input name="accident_place" type="text" class="textfiled" size="30"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">�¹ʾ���ҽԺ��
    <input name="accident_hospital" type="text" class="textfiled" size="26"></td>
    <td bgcolor="#FFFFFF">�¹ʴ�����أ�
    <input name="accident_department" type="text" class="textfiled" size="30"></td>
  </tr>
  <tr valign="top">
    <td colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="13%" valign="top">�¹ʾ���������          </td>
        <td width="87%"><textarea name="accident_description" cols="70" rows="8"></textarea></td>
      </tr>
    </table>
      <div align="right"><br>
      ������ǩ����
      <input name="accident_description_sign" type="text" class="accident_person" size="14">
      <br>
      </div></td>
  </tr>
  <tr valign="top">
    <td colspan="2" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="23%">�����˵�ǰ����״����</td>
        <td width="17%"><input type="checkbox" name="body_1" value="body_1">Ȭ��</td>
        <td width="17%"><input type="checkbox" name="body_2" value="body_2">��ת</td>
        <td width="13%"><input type="checkbox" name="body_3" value="body_3">δ��</td>
        <td width="30%"><input type="checkbox" name="body_4" value="body_4">���</td>
      </tr>
      <tr>
        <td>���������������</td>
        <td><input type="checkbox" name="instance_1" value="instance_1">סԺ����</td>
        <td><input type="checkbox" name="instance_2" value="instance_2">��������</td>
        <td><input type="checkbox" name="instance_3" value="instance_3">�ڼ�</td>
        <td><input type="checkbox" name="instance_4" value="instance_4">סԺ�����賬��15��</td>
      </tr>
    </table></td>
  </tr>
</table>
<div align="center"><br>
  <input type="submit" name="submit1" value="�ύ">
  <input type="reset" name="reset1" value="����">
  <br>
  <br>
</div>
</form>
</body>
</html>
