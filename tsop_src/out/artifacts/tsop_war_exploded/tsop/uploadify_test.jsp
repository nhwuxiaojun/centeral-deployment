<%@ page language="java" contentType="text/html; charset=utf-8"%>  
<%  
        String path = request.getContextPath();  
        String basePath = request.getScheme() + "://"  
                + request.getServerName() + ":" + request.getServerPort()  
                + path + "/";  
	System.out.println("Uploadify base path:"+basePath);
	System.out.println("Uploadify path:"+path);
    %>      
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
      <head>  
        <base href="<%=basePath%>">  
          
        <title>Uploadify Testing</title>  
          
     <link href="scripts/uploadify/uploadify.css" rel="stylesheet" type="text/css" />  
     <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>  
     <script type="text/javascript" src="scripts/uploadify/jquery.uploadify.js"></script>  
    <script type="text/javascript">  
    $(document).ready(function() {  
     $("#uploadify").uploadify({  
                    'auto'           : false,  
                    'swf'            : '<%=basePath%>/tsop/scripts/uploadify/uploadify.swf',  
                    'uploader'       : '<%=basePath%>/tsop/uploadify',//��̨���������  
		    'folder'	: "/usr/local/deploy/null",
                    'queueID'        : 'fileQueue',//�������id��Ӧ  
                    'queueSizeLimit' :1,  
                    'fileTypeDesc'   : 'rar�ļ���zip�ļ�',  
                    'fileTypeExts'   : '*.rar;*.zip', //���ƿ��ϴ��ļ�����չ�������ñ���ʱ��ͬʱ����fileDesc  
                    'multi'          : true,  
                    'buttonText'     : 'files',
		'scriptData': {'name':'jiangtao','age':22 },
		'method' : "GET"
     });  
    });  
    </script>  
     </head>  
    <body>  
            <div id="fileQueue"></div>  
            <input type="file" name="uploadify" id="uploadify" />  
            <p>  
                <a href="javascript:$('#uploadify').uploadify('upload')">upload</a>
                <a href="javascript:$('#uploadify').uplaodify('cancel','*')">cancel</a>
            </p>  
      </body>  
    </html>  
