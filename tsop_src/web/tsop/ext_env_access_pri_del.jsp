<%@ include file="./interface/check_ext.jsp"%>
<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
<title>环境登陆权限删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String path = new String();
String shell = new String();
int delcount = 0;
int j = 0;
delcount = Integer.parseInt(request.getParameter("delcount"));
String[] temp_dir = new String[4];
for(int i=0;i<delcount;i++){
	if("".equals(request.getParameter("del_" + i))||request.getParameter("del_" + i)==null){
		
	}else{
		temp_dir = request.getParameter("del_" + i).split("/");
		sql = "delete from a_env_access_privi where staff_name = '" + temp_dir[0] + "' and guest_ip = '" + temp_dir[1] + "' and app_ip = '" + temp_dir[2] + "' and privi_type = '" + temp_dir[3] + "'";
		//out.print(sql + "<br>");
		j = db.execUpdate(sql);
		
		
		
		path = request.getRealPath("");
		File f = new File(path,"File_del.log");
		//out.println(path + "/File_del.log");
		if(f.exists()){
			f.delete();
			f.createNewFile();
			FileWriter fw = new FileWriter(path + "/File_del.log");
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(temp_dir[0] + " " + temp_dir[1] + " " + temp_dir[2] + " " + temp_dir[3] + " " + temp_dir[4]);
			//bw.newLine();
			//bw.write("bbb");
			bw.flush();
			fw.close();
			try{
        		shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/app_del_privi.sh";
       			Runtime.getRuntime().exec(shell);
			}
			catch(Exception e)
			{
        		System.err.println(e.getMessage());
			}
		}else{
			f.createNewFile();
			FileWriter fw = new FileWriter(path + "/File_del.log");
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(temp_dir[0] + " " + temp_dir[1] + " " + temp_dir[2] + " " + temp_dir[3] + " " + temp_dir[4]);
			//bw.newLine();
			//bw.write("bbb");
			bw.flush();
			fw.close();
			try{
        		shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/app_del_privi.sh";
       			Runtime.getRuntime().exec(shell);
			}
			catch(Exception e)
			{
        		System.err.println(e.getMessage());
			}
		}
		
		
		
		
	}
}
%>
<body><%@include file="includes/head.html" %>
<%
if(j==1){
	response.sendRedirect("ext_env_access_pri_query.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("ext_env_access_pri_query.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
