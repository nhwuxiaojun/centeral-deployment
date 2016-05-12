<!doctype html>  
<html>  
<head>  
    <title>import project</title>  
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />  
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
    <style>  
        body {  
            text-align: center;  
            background-color: #DEF3FE;  
            font-family: Arial, Helvetica, sans-serif;  
            font-size: 80%;  
            color: #666;  
            margin: 0;  
            padding: 0;  
        }  
  
        .File_Upload_Form {  
            width: 600px;  
            margin: 30px auto;  
            background-color: #FFF;  
            border-radius: 4px;  
            padding: 4px 20px 20px 20px;  
        }  
  
        .span {  
            width: 200px;  
        }  
  
        h1 {  
            font-family: Georgia, "Times New Roman", Times, serif;  
            font-size: 170%;  
            color: #645348;  
            font-style: italic;  
            text-decoration: none;  
            font-weight: 100;  
        }  
  
        input[type="submit"] {  
            border: 1px solid #917568;  
            border-radius: 4px;  
            margin: 0;  
            padding: 4px 10px 4px 10px;  
            font-family: Georgia, "Times New Roman", Times, serif;  
            font-size: 14px;  
            font-style: italic;  
            color: #333333;  
            text-shadow: 1px 1px 0 #fff;  
            background-color: #A5B276;  
            background-image: -webkit-linear-gradient(#CED8AF, #A5B276);  
            background-image: -moz-linear-gradient(center bottom, #A5B276 0%, #727E47 100%);  
            background-size: 1px 50px;  
            padding: 5px;  
            cursor: pointer;  
            -webkit-transition: background .5s ease-out;  
        }  
  
        input[type="submit"]:Hover, :focus {  
            background-position: 100px;  
        }  
        .resultDiv{  
            min-height:300px;  
            /*border:1px solid #ccc;*/  
        }  
        .tb_tip td{  
            vertical-align: top;  
            text-align: left;  
            padding-left:10px;  
            width:50%;  
        }  
        .tb_tip {  
             width:100%;  
         }  
        .resultTip {  
            color:red;  
            float: left;  
            margin: 10px;  
         }  
         ul{  
            list-style: none;  
         }  
         ul li{  
            width: 230px;  
            height: 31px;  
            line-height: 28px;  
            text-align: left;  
            position: relative;  
              
         }  
         ul li input{  
            right:12px;  
            position:absolute;  
            width:150px;  
         }  
         ul li select{  
            right:12px;  
            position:absolute;  
            width:152px;  
         }  
         .bytes_total{  
            float: right;  
            margin-right: 20px;  
         }  
         .lineborder{  
             border-bottom:1px dashed #ccc;  
         }  
           
         .lineborder:odd {  
               
         }  
         .div_File span{  
             padding-left:10px;  
         }  
         .div_File:even{  
             background-color:pink;  
         }  
    </style>  
</head>  
  
<body>  
<div class="File_Upload_Form">  
    <h1>Import project to Cloud</h1>  
<input type="hidden" value="${userName}"  id="userName" name="userName"/>  
  
    <form enctype="multipart/form-data" id="importForm" action="javascript: doImport();">  
          
        <ul >  
            <li>  
                <span>ÏĿ±ê:</span><input type="text"  name="projectName" id="projectName" list="searchlist" required value="testClear"></input>  
                <datalist id="searchlist">  
                     #foreach($!item in $!myProjectList)  
                         <option value="$!item.project.identifying" label="$!item.project.name" />  
                     #end  
                </datalist>  
                  
            </li>  
            <li>  
               ½ڵãÐ:  
                    <select id="cbDomain" name="cbDomain">  
                        <option value="hivesql">HIVE SQL</option>  
                        <option value="shell">SHELL</option>  
                        <option value="odpsSql" default="true">ODPS SQL</option>  
                        <option value="cfg" default="true">CFG</option>  
                    </select>   
            </li>  
              
        </ul>  
         <div style="width:415px;">   
            <input type="file" onchange="showSelectFiles()"  name="import_file" multiple webkitdirectory="" directory="" mozdirectory>  
            <input type="submit" value="Upload File"/>  
        </div>  
  
          
    </form>  
    <div class="resultTip" style='display:none'></div>  
    <table class="tb_tip">  
    <tr>  
    <td colspan="2" style="padding-bottom: 13px;">  
       
    <div id="progress" class="resultDiv" style="width:100%;line-height: 1.5;"/>  
    </td>  
    </tr>  
    <tr style="display:none">  
    <td style="">  
            ³ɹ¦Î¼þ:  
             <div id="succssedFile" class="resultDiv">  
            </div>  
    </td>  
    <td>  
            ʧ°Üļþ:  
            <div  id="failedFile" class="resultDiv">  
            </div>  
            </td>  
    </tr>  
    </table>  
          
</div>  
<script>  
      
    resultInfo={  
        successedfiles:[],  
        successedIds:[],  
        failedfiles:[]  
    };
    fileActionType={  
        viewFile:1,  
        uploadFile:2  
    };
      
    function errorHandler(e) {  
        var msg = '';  
        switch (e.code) {  
            case FileError.QUOTA_EXCEEDED_ERR:  
                msg = 'QUOTA_EXCEEDED_ERR';  
                break;  
            case FileError.NOT_FOUND_ERR:  
                msg = 'NOT_FOUND_ERR';  
                break;  
            case FileError.SECURITY_ERR:  
                msg = 'SECURITY_ERR';  
                break;  
            case FileError.INVALID_MODIFICATION_ERR:  
                msg = 'INVALID_MODIFICATION_ERR';  
                break;  
            case FileError.INVALID_STATE_ERR:  
                msg = 'INVALID_STATE_ERR';  
                break;  
            default:  
                msg = 'Unknown Error';  
                break;

        }
        console.log(msg);  
    }  
    function showSelectFiles(){  
        doImport(fileActionType.viewFile);  
    }  
      
      
    function doImport(type) {  
        if(type==fileActionType.viewFile){  
             jQuery("#progress").empty();  
        }  
        var v_file_list = $("#importForm :file ").attr("files");  
        if (v_file_list.length == 0 ) {  
            alert("Please choose a file.");  
            return 0;  
        }  
  
        function processFile(index){  
            file = v_file_list[index];  
            if (!file) return;  
            var file_path = file.webkitRelativePath;  
            if( file_path[file_path.length - 1]=='.') {  
                processFile(index + 1);  
                return;  
            }  
  
            var reader = new FileReader();  
            reader.onloadstart = function () {  
                console.info(type==fileActionType.viewFile+"-------------");  
                 if(type==fileActionType.viewFile){  
                    console.log(file_path + " onloadstart");  
                    var fileDiv= $('<div class="div_File"></div)').attr("id", "file_" + index);  
                    fileDiv.appendTo("#progress");  
                    var infoStr=[];  
                    infoStr.push('<span  class="file_path" title="'+file_path+'">'+substr_(file_path,35,"...")+'</span>');  
                   // infoStr.push('<span  class="bytes_read">'+" read:" + 0+'</span>');  
                    infoStr.push('<span  class="bytes_total">'+"fileSize: "+ file.size + "  "+'</span> <br/>');  
                    fileDiv.append(infoStr.join(""));  
                 }  
            };
  
            reader.onprogress = function (p) {  
                console.log(file_path + " onprogress");  
                $("#"+"file"+ index + " #bytes_read").text(" read:" + p.size)  
            };
  
            reader.onload = function () {  
                console.log(file_path + " load complete");  
            };
            reader.onloadend = function () {  
                  
                if(type!=fileActionType.viewFile){  
                    // Î¼þ·¾¶  
                    console.log(file_path + " onloadend");  
                    // Î¼þÃ×´Ó·¾¶Ö½Ø¡  
                    // TODO  
                    // Î¼þÀÐÈÓ»§ѡÔ  
                    if (reader.error) {  
                        errorHandler(reader.error);  
                        console.log(reader.error);  
                        resultInfo.failedfiles.push(file_path);  
                        if(index==(v_file_list.length-1)){  
                            showResultInfo();  
                        }  
                          
                    } else {  
                        jQuery("#"+"file"+ index + " #bytes_read").text(" read:" + file.size);  
                        console.log("result is----:" + this.result);  
                        importFile(file,reader,index==(v_file_list.length-1),index);  
                    }  
                }  
                if(index==(v_file_list.length-1)){  
                     $(".div_File:even").css("background", "#E3E3E3");  
                }  
                processFile(index + 1);  
  
         };
              
              
            reader.readAsText(file, "UTF-8");  
        }  
        processFile(0)  
    }  
  
  
    function importFile(file,reader,isLast,index){  
      
        var filePath=file.webkitRelativePath;  
        var index_=filePath.lastIndexOf("/");  
        var fileName=filePath.substring(index_+1);  
        var path=filePath.substring(0,index_+1);  
        var url="json/jsonReq.do";
        console.log("do post");  
        url+="?actionName=addFile";  
        url+="&username="+jQuery("#userName").val();  
        url+="&identifying="+jQuery("#projectName").val();  
        var data_={  
            fileContent:reader.result,  
            path:path,  
            fileName:fileName,  
            comment:'testcomment..',  
            type:jQuery("#cbDomain").val()  
        };
          
        jQuery.ajax({  
           type: "POST",  
           data:{ data:JSON.stringify(eval(data_)) },  
           url: url,  
           success: function(resData){  
            var lineBorder;  
            if(isLast){  
                lineBorder="";  
            }else{  
                lineBorder="<div class='lineborder'/>";  
            }  
              
            var resObj = eval("(" + resData + ")");  
            if(resObj.retCode==0){  
             resultInfo.successedfiles.push(filePath);  
             resultInfo.successedIds.push(resObj.jobId);  
             jQuery("#file_"+index).append("<span style='color:blue'>³ɹ¦  taskId: "+resObj.jobId+"</span>"+lineBorder);  
            }else{  
             jQuery(".resultTip").append(resObj.errMsg+'</br>');  
              resultInfo.failedfiles.push(file.webkitRelativePath);  
              jQuery("#file_"+index).append("<span style='color:red'>ʧ°Ü   "+resObj.errMsg+"</span>"+lineBorder);  
            }  
            if(isLast){  
                setTimeout(function(){showResultInfo();},500)  
             }  
               
           },  
           error: function(msg){  
             resultInfo.failedfiles.push(file.webkitRelativePath);  
             jQuery("#file_"+index).css("color","red");  
             if(isLast){  
                setTimeout(function(){showResultInfo();},500)  
             }  
           }  
             
        });  
  
        
     }  
       
    //ÏʾÉ´«½á  
     function showResultInfo(){  
        jQuery("#succssedFile").empty();      
        jQuery("#failedFile").empty();    
        for(var i=0; i<resultInfo.successedfiles.length;i++){  
                jQuery("#succssedFile").append(resultInfo.successedfiles[i]+"</br>")  
        }  
          
        for(var i=0; i<resultInfo.failedfiles.length;i++){  
                jQuery("#failedFile").append(resultInfo.failedfiles[i]+"</br>")  
        }      
          
        doPublish();  
     }  
       
     //µ÷publish ·þÎ    
     function doPublish(){  
        var taskIds = resultInfo.successedIds.join(",");  
        var url="yy.do";  
         url+="?actionName=doPublish";  
          jQuery.ajax({  
           type: "POST",  
           data:{ "taskIds": taskIds },  
           url: url,  
           success: function(resData){  
            var resObj = eval("(" + resData + ")");  
            if(resObj.retCode==0){  
             //jQuery(".resultTip").append('scheduler Ò½Óܴ¦À').css("color","#ccc");  
            }else{  
             jQuery(".resultTip").append('µ÷doPublish ·þÎʧ°Ü);  
            }  
           },  
           error: function(msg){  
             jQuery(".resultTip").append('doPublish ʧ°ÜÇ¼ì '+msg);  
           }  
             
        });  
     }  
       
     String.prototype.substr_=function(length,fix){  
            return this.length>length?this.substring(0,length)+fix:this;  
        };
  
     function substr_(objStr,length,fix){  
            if(objStr){  
                return objStr.substr_(length,fix)  
            }  
            return "";  
    }  
</script>  
</body>  
</html>  
