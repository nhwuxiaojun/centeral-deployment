<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.Tools" %>
<%
Properties props = new Properties();
props.put("mail.smtp.host","mail.ebaotech.com");
props.put("mail.smtp.auth","true");
//�趨�����ʼ�ʱ��Ҫ���������֤
Session s = Session.getInstance(props);
String content = new String();
MimeMessage message = new MimeMessage(s);
InternetAddress from = new InternetAddress("dawei.liu@ebaotech.com");
message.setFrom(from);
//InternetAddress to = new InternetAddress("nsclaims@nissay-sva.com.cn");
InternetAddress to = new InternetAddress("dawei.liu@ebaotech.com");
message.addRecipient(Message.RecipientType.TO,to);
message.setSubject("hello");
message.setDataHandler(new DataHandler(message,"text/html"));

//����Ϣ������������
BodyPart mdp = new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart����

content = "<html><body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\"><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"50\" align=\"center\" valign=\"bottom\"><span class=\"style2\">���ⱨ���ǼǱ�</span></td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"84%\" align=\"right\" bgcolor=\"#FFFFFF\"><strong>������ţ�</strong></td><td width=\"16%\" align=\"right\" bgcolor=\"#FFFFFF\">&nbsp;</td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"43%\" bgcolor=\"#FFFFFF\">����ʱ�䣺" + Tools.toGB(request.getParameter("report_year").trim()) + "��" + Tools.toGB(request.getParameter("report_month").trim()) + "��" + Tools.toGB(request.getParameter("report_day").trim()) + "��<br>ʱ" + Tools.toGB(request.getParameter("report_hour").trim()) + "</td><td width=\"29%\" valign=\"top\" bgcolor=\"#FFFFFF\">�����ˣ�" + Tools.toGB(request.getParameter("accept_person").trim()) + "</td><td width=\"28%\" valign=\"top\" bgcolor=\"#FFFFFF\">���ţ�" + Tools.toGB(request.getParameter("accept_number").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>����������</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"33%\" bgcolor=\"#FFFFFF\">������" + Tools.toGB(request.getParameter("report_person").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">������˹�ϵ��" + Tools.toGB(request.getParameter("report_relation").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">��ϵ�绰��" + Tools.toGB(request.getParameter("report_telephone").trim()) + "</td></tr><tr><td colspan=\"3\" bgcolor=\"#FFFFFF\">��ϵ��ַ��" + Tools.toGB(request.getParameter("report_address").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>����������</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"33%\" bgcolor=\"#FFFFFF\">���պ�ͬ���룺" + Tools.toGB(request.getParameter("contract_no").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">������" + Tools.toGB(request.getParameter("insurance_name").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">���֤���룺" + Tools.toGB(request.getParameter("identity_no").trim()) + "</td></tr><tr><td colspan=\"2\" bgcolor=\"#FFFFFF\">��ϵ��ַ��" + Tools.toGB(request.getParameter("insurance_address").trim()) + "</td><td bgcolor=\"#FFFFFF\">��ϵ�绰��" + Tools.toGB(request.getParameter("insurance_telephone").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>�¹�����</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"50%\" colspan=\"2\" bgcolor=\"#FFFFFF\">�¹����";
if("accidental".equals(request.getParameter("accidental"))){
	content = content + "<input name=\"accidental\" type=\"checkbox\" value=\"accidental\" checked>����";
}else{
	content = content + "<input name=\"accidental\" type=\"checkbox\" value=\"accidental\">����";
}
if("hospital".equals(request.getParameter("hospital"))){
	content = content + "<input name=\"hospital\" type=\"checkbox\" value=\"hospital\" checked>סԺ";
}else{
	content = content + "<input name=\"hospital\" type=\"checkbox\" value=\"hospital\">סԺ";
}
if("sickness".equals(request.getParameter("sickness"))){
	content = content + "<input name=\"sickness\" type=\"checkbox\" value=\"sickness\" checked>�ؼ�";
}else{
	content = content + "<input name=\"sickness\" type=\"checkbox\" value=\"sickness\">�ؼ�";
}
if("death".equals(request.getParameter("death"))){
	content = content + "<input name=\"death\" type=\"checkbox\" value=\"death\" checked>���";
}else{
	content = content + "<input name=\"death\" type=\"checkbox\" value=\"death\">���";
}
if("other".equals(request.getParameter("other"))){
	content = content + "<input name=\"other\" type=\"checkbox\" value=\"other\" checked>����";
}else{
	content = content + "<input name=\"other\" type=\"checkbox\" value=\"other\">����";
}
content = content + "��" + Tools.toGB(request.getParameter("other_content").trim()) + "��</td></tr><tr><td width=\"50%\" bgcolor=\"#FFFFFF\">�¹ʷ���ʱ�䣺" + Tools.toGB(request.getParameter("accident_year").trim()) + "��" + Tools.toGB(request.getParameter("accident_month").trim()) + "��" + Tools.toGB(request.getParameter("accident_day").trim()) + "��<br>ʱ" + Tools.toGB(request.getParameter("accident_hour").trim()) + "</td><td width=\"50%\" valign=\"top\" bgcolor=\"#FFFFFF\">�¹ʷ����ص㣺" + Tools.toGB(request.getParameter("accident_place").trim()) + "</td></tr><tr><td bgcolor=\"#FFFFFF\">�¹ʾ���ҽԺ��" + Tools.toGB(request.getParameter("accident_hospital").trim()) + "</td><td bgcolor=\"#FFFFFF\">�¹ʴ�����أ�" + Tools.toGB(request.getParameter("accident_department").trim()) + "</td></tr><tr valign=\"top\"><td colspan=\"2\" bgcolor=\"#FFFFFF\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"13%\" valign=\"top\">�¹ʾ���������</td><td width=\"87%\"><textarea name=\"accident_description\" cols=\"70\" rows=\"8\">" + Tools.toGB(request.getParameter("accident_description").trim()) + "</textarea></td></tr></table><div align=\"right\"><br>������ǩ����" + Tools.toGB(request.getParameter("accident_description_sign").trim()) + "<br></div></td></tr><tr valign=\"top\"><td colspan=\"2\" bgcolor=\"#FFFFFF\"><table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"23%\">�����˵�ǰ����״����</td>";
if("body_1".equals(request.getParameter("body_1"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_1\" value=\"body_1\" checked>Ȭ��</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_1\" value=\"body_1\">Ȭ��</td>";
}
if("body_2".equals(request.getParameter("body_2"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_2\" value=\"body_2\" checked>��ת</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_2\" value=\"body_2\">��ת</td>";
}
if("body_3".equals(request.getParameter("body_3"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_3\" value=\"body_3\" checked>δ��</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_3\" value=\"body_3\">δ��</td>";
}
if("body_4".equals(request.getParameter("body_4"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_4\" value=\"body_4\" checked>���</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_4\" value=\"body_4\">���</td>";
}
content = content + "</tr><tr><td>���������������</td>";
if("instance_1".equals(request.getParameter("instance_1"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_1\" value=\"instance_1\" checked>סԺ����</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_1\" value=\"instance_1\">סԺ����</td>";
}
if("instance_2".equals(request.getParameter("instance_2"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_2\" value=\"instance_2\" checked>��������</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_2\" value=\"instance_2\">��������</td>";
}
if("instance_3".equals(request.getParameter("instance_3"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_3\" value=\"instance_3\" checked>�ڼ�</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_3\" value=\"instance_3\">�ڼ�</td>";
}
if("instance_4".equals(request.getParameter("instance_4"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_4\" value=\"instance_4\" checked>סԺ�����賬��15��</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_4\" value=\"instance_4\">סԺ�����賬��15��</td>";
}
content = content + "</tr></table></td></tr></table>";
content = content + "</body></html>";

mdp.setContent(content,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ
Multipart mm = new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart��
//��(��ʵ�Ͽ��Դ�Ŷ��)
mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
message.setContent(mm);//��mm��Ϊ��Ϣ���������
message.saveChanges();

try{
Transport transport = s.getTransport("smtp");
transport.connect("mail.ebaotech.com","dawei.liu","Lby19490411");
transport.sendMessage(message,message.getAllRecipients());
transport.close();
}
catch(Exception e)
{
  System.err.println(e.getMessage());
}
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>mail test</title>
  </head>
  <body>
  </body>
<script language="javascript">
window.close();
</script>
</html>