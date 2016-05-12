<%@ page import="java.io.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<title>
TS Package Deployer - <%=request.getParameter("env_name")%>
</title>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/spin.min.js"></script>
<script src="scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/uploadify/uploadify.css">
<link href="scripts/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

$(function() {
	$('#updatebtn').click ( function() {
  	    if (this.checked) {
		$('#content').attr("rows",30);
		$('#content').attr("disabled",false);
		$('#savebtn').attr("disabled",false);
	} else {
		$('#content').attr("rows",1);
		$('#content').attr("disabled",true);
		$('#savebtn').attr("disabled",true);
	}
	});
});
</script>
  <body>
   <%

//写文件
String path = "/deploy/"+request.getParameter("env_name");
String str="xxx=";
String filename = request.getRealPath(path+"/file.properties");
java.io.File f = new java.io.File(filename);
if(!f.exists())//如果文件不存，则建立
{
  f.createNewFile();
}

if ( request.getParameter("new") != null ) {
try
{
  PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
  pw.println(request.getParameter("content"));//写内容
  pw.close();
}
catch(IOException e)
{
  out.println(e.getMessage());
}
 
} // end of if
//读文件
java.io.FileReader fr = new java.io.FileReader(f);
char[] buffer = new char[10];
int length; //读出的字符数(一个中文为一个字符)
//读文件内容
//out.write(filename+"<br>");
%>
<input id="updatebtn" type="checkbox">Update file.properties (<%=filename%>)</input>
<form action="file.properties.editor.jsp" method="POST">
<textarea id="content" name="content" rows=1 cols=80 disabled=disabled>
<%
while((length=fr.read(buffer))!=-1)
{
  //输出
  out.write(buffer,0,length);
}
fr.close();
%>
</textarea>
<input type="hidden" name="new" value="new">
<input type="hidden" name="env_name" value="<%=request.getParameter("env_name")%>">
<br>
<button type="submit" id="savebtn">Save</button>
  </body>
</html>
