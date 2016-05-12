<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.Tools" %>
<%
Properties props = new Properties();
props.put("mail.smtp.host","mail.ebaotech.com");
props.put("mail.smtp.auth","true");
//设定发送邮件时需要进行身份验证
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

//给消息对象设置内容
BodyPart mdp = new MimeBodyPart();//新建一个存放信件内容的BodyPart对象

content = "<html><body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\"><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"50\" align=\"center\" valign=\"bottom\"><span class=\"style2\">理赔报案登记表</span></td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"84%\" align=\"right\" bgcolor=\"#FFFFFF\"><strong>报案编号：</strong></td><td width=\"16%\" align=\"right\" bgcolor=\"#FFFFFF\">&nbsp;</td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"43%\" bgcolor=\"#FFFFFF\">报案时间：" + Tools.toGB(request.getParameter("report_year").trim()) + "年" + Tools.toGB(request.getParameter("report_month").trim()) + "月" + Tools.toGB(request.getParameter("report_day").trim()) + "日<br>时" + Tools.toGB(request.getParameter("report_hour").trim()) + "</td><td width=\"29%\" valign=\"top\" bgcolor=\"#FFFFFF\">受理人：" + Tools.toGB(request.getParameter("accept_person").trim()) + "</td><td width=\"28%\" valign=\"top\" bgcolor=\"#FFFFFF\">工号：" + Tools.toGB(request.getParameter("accept_number").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>报案人资料</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"33%\" bgcolor=\"#FFFFFF\">姓名：" + Tools.toGB(request.getParameter("report_person").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">与出险人关系：" + Tools.toGB(request.getParameter("report_relation").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">联系电话：" + Tools.toGB(request.getParameter("report_telephone").trim()) + "</td></tr><tr><td colspan=\"3\" bgcolor=\"#FFFFFF\">联系地址：" + Tools.toGB(request.getParameter("report_address").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>出险人资料</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"33%\" bgcolor=\"#FFFFFF\">保险合同号码：" + Tools.toGB(request.getParameter("contract_no").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">姓名：" + Tools.toGB(request.getParameter("insurance_name").trim()) + "</td><td width=\"33%\" valign=\"top\" bgcolor=\"#FFFFFF\">身份证号码：" + Tools.toGB(request.getParameter("identity_no").trim()) + "</td></tr><tr><td colspan=\"2\" bgcolor=\"#FFFFFF\">联系地址：" + Tools.toGB(request.getParameter("insurance_address").trim()) + "</td><td bgcolor=\"#FFFFFF\">联系电话：" + Tools.toGB(request.getParameter("insurance_telephone").trim()) + "</td></tr></table><br><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#FFFFFF\"><strong>事故资料</strong></td></tr></table><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td width=\"50%\" colspan=\"2\" bgcolor=\"#FFFFFF\">事故类别：";
if("accidental".equals(request.getParameter("accidental"))){
	content = content + "<input name=\"accidental\" type=\"checkbox\" value=\"accidental\" checked>意外";
}else{
	content = content + "<input name=\"accidental\" type=\"checkbox\" value=\"accidental\">意外";
}
if("hospital".equals(request.getParameter("hospital"))){
	content = content + "<input name=\"hospital\" type=\"checkbox\" value=\"hospital\" checked>住院";
}else{
	content = content + "<input name=\"hospital\" type=\"checkbox\" value=\"hospital\">住院";
}
if("sickness".equals(request.getParameter("sickness"))){
	content = content + "<input name=\"sickness\" type=\"checkbox\" value=\"sickness\" checked>重疾";
}else{
	content = content + "<input name=\"sickness\" type=\"checkbox\" value=\"sickness\">重疾";
}
if("death".equals(request.getParameter("death"))){
	content = content + "<input name=\"death\" type=\"checkbox\" value=\"death\" checked>身故";
}else{
	content = content + "<input name=\"death\" type=\"checkbox\" value=\"death\">身故";
}
if("other".equals(request.getParameter("other"))){
	content = content + "<input name=\"other\" type=\"checkbox\" value=\"other\" checked>其他";
}else{
	content = content + "<input name=\"other\" type=\"checkbox\" value=\"other\">其他";
}
content = content + "（" + Tools.toGB(request.getParameter("other_content").trim()) + "）</td></tr><tr><td width=\"50%\" bgcolor=\"#FFFFFF\">事故发生时间：" + Tools.toGB(request.getParameter("accident_year").trim()) + "年" + Tools.toGB(request.getParameter("accident_month").trim()) + "月" + Tools.toGB(request.getParameter("accident_day").trim()) + "日<br>时" + Tools.toGB(request.getParameter("accident_hour").trim()) + "</td><td width=\"50%\" valign=\"top\" bgcolor=\"#FFFFFF\">事故发生地点：" + Tools.toGB(request.getParameter("accident_place").trim()) + "</td></tr><tr><td bgcolor=\"#FFFFFF\">事故就诊医院：" + Tools.toGB(request.getParameter("accident_hospital").trim()) + "</td><td bgcolor=\"#FFFFFF\">事故处理机关：" + Tools.toGB(request.getParameter("accident_department").trim()) + "</td></tr><tr valign=\"top\"><td colspan=\"2\" bgcolor=\"#FFFFFF\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"13%\" valign=\"top\">事故经过描述：</td><td width=\"87%\"><textarea name=\"accident_description\" cols=\"70\" rows=\"8\">" + Tools.toGB(request.getParameter("accident_description").trim()) + "</textarea></td></tr></table><div align=\"right\"><br>报案人签名：" + Tools.toGB(request.getParameter("accident_description_sign").trim()) + "<br></div></td></tr><tr valign=\"top\"><td colspan=\"2\" bgcolor=\"#FFFFFF\"><table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"23%\">出险人当前身体状况：</td>";
if("body_1".equals(request.getParameter("body_1"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_1\" value=\"body_1\" checked>痊愈</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_1\" value=\"body_1\">痊愈</td>";
}
if("body_2".equals(request.getParameter("body_2"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_2\" value=\"body_2\" checked>好转</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_2\" value=\"body_2\">好转</td>";
}
if("body_3".equals(request.getParameter("body_3"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_3\" value=\"body_3\" checked>未愈</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_3\" value=\"body_3\">未愈</td>";
}
if("body_4".equals(request.getParameter("body_4"))){
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_4\" value=\"body_4\" checked>身故</td>";
}else{
	content = content + "<td width=\"17%\"><input type=\"checkbox\" name=\"body_4\" value=\"body_4\">身故</td>";
}
content = content + "</tr><tr><td>出险人其他情况：</td>";
if("instance_1".equals(request.getParameter("instance_1"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_1\" value=\"instance_1\" checked>住院治疗</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_1\" value=\"instance_1\">住院治疗</td>";
}
if("instance_2".equals(request.getParameter("instance_2"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_2\" value=\"instance_2\" checked>门诊治疗</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_2\" value=\"instance_2\">门诊治疗</td>";
}
if("instance_3".equals(request.getParameter("instance_3"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_3\" value=\"instance_3\" checked>在家</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_3\" value=\"instance_3\">在家</td>";
}
if("instance_4".equals(request.getParameter("instance_4"))){
	content = content + "<td><input type=\"checkbox\" name=\"instance_4\" value=\"instance_4\" checked>住院日数需超过15天</td>";
}else{
	content = content + "<td><input type=\"checkbox\" name=\"instance_4\" value=\"instance_4\">住院日数需超过15天</td>";
}
content = content + "</tr></table></td></tr></table>";
content = content + "</body></html>";

mdp.setContent(content,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
Multipart mm = new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
//象(事实上可以存放多个)
mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
message.setContent(mm);//把mm作为消息对象的内容
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