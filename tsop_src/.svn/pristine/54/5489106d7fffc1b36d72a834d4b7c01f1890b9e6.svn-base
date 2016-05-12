<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>将数据写入文件</title>
</head>
<body>
<%
String path=request.getRealPath(".") + "/";
FileWriter fw=new FileWriter(path + "static.log");//建立FileWriter对象，并实例化fw
//将字符串写入文件
fw.write("ip");
fw.write("username");
fw.write("password");
fw.close();
try{
	String shell = "sh /usr/local/ts_op/test.sh";
	Runtime.getRuntime().exec(shell);
}
catch(Exception e)
{
	System.err.println(e.getMessage());
}
FileReader fr=new FileReader(path + "result.htm");
BufferedReader br=new BufferedReader(fr);//建立BufferedReader对象，并实例化为br
String Line=br.readLine();
//读取一行数据
out.println(path + "<br>");
out.println(Line + "<br>");
br.close();//关闭BufferedReader对象
fr.close();
%>
</body>
</html>