function execPLSQL (db_ldap_name,db_username,db_password ) {
 // var arr=db_info.split(":");
//  var db_sid=arr[2];
  var command;
    var shell = new ActiveXObject("WScript.Shell");
 // command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Allround Automations\\PL/SQL Developer\\InstallPath");//��ע������������װ·��    
  // command = "C:\\Program Files\\PLSQL Developer\\";//��ע������������װ·��
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\PLSQL Developer\\")) {
        command = "C:\\Program Files\\PLSQL Developer\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\PLSQL Developer\\")) {
        command = "C:\\Program Files (x86)\\PLSQL Developer\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\PLSQL Developer\\")) {
        command = "I:\\Program Files (x86)\\PLSQL Developer\\";
   } else {
        alert("PLSQL Developer maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/plsql-developer-installer.exe");
        return false;
   }
  command = command + "plsqldev.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled��');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_ldap_name);
  window.onerror = window.oldOnError;
}

function execSQLPlus (db_ldap_name,db_username,db_password ) {
  var command;
    var shell = new ActiveXObject("WScript.Shell");
  command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\ORACLE\\KEY_OraClient10g_home1\\ORACLE_HOME");//��ע������������װ·��
  // command = "C:\\Program Files\\PLSQL Developer\\";//��ע������������װ·��
  alert(command);
  command = command + "sqlplus.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled��');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_ldap_name);
  window.onerror = window.oldOnError;
}

function execSecureCRT (env_ip,env_username,env_password ) {
  var command;
  if(window.ActiveXObject){ 
    	var shell = new ActiveXObject("WScript.Shell");
  } else  if(window.XMLHTTPRequest){
    	var shell = new XMLHTTPRequest("WScript.Shell");	
  }
	try {
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");
    command = command + "SecureCRT.exe";
	} catch(err) {
		alert('SecureCRT is not installed or browser is not supported!');
	}
	
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
		alert('sss' + window._command + ' ssss'); 
      return true;
    } 
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+"/PASSWORD "+env_password+" "+env_username+"@"+env_ip);
  window.onerror = window.oldOnError;
}

function execSamba (server_path ) {
	//alert(server_path);
  	var wsh = new ActiveXObject('WScript.Shell');
  	if (wsh)
	try {
    	wsh.Run("\""+server_path+"\"");
	} catch (e) {
	    alert("Network path "+server_path+" doesnt exist! Please contact OP to create.");
	}
  	//window.onerror = window.oldOnError;
}

function exectnsping (db_ldap_name) {
        var wsh = new ActiveXObject('WScript.Shell');
        var command ;
        command = "tnsping";
        if (wsh)
        try {
            wsh.Run("\""+command+"\""+" "+db_ldap_name+" ; pause");
        } catch (e) {
            alert("tnsping was not able to find, Oracle client maybe NOT install.");
        }
}

function restart_batch (env_ip,env_username,env_password ) {
  if(confirm("Confirm restart environment "+env_ip+" batch server?")) {
    var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-2014-04-02-installer.exe");
        return false;
   }
  command = command + "plink.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled');
      return true; } else return false;
       };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip+" ( . ~/.bash_profile; echo Batch Restart from $SSH_CLIENT at `date +%F_%T` >>~/restart.log; find ./EBAO_HOME/ -name batch_manage.sh |while  read i; do $i restart; done ; tail -f agent.out; read -n 1)");
        } catch(e) {
        alert("Putty is not installed, or SSH to "+env_ip+" failed!");
        }
        window.onerror = window.oldOnError;
        }
}
function restart_app (env_ip,env_username,env_password ) {
  if(confirm("Confirm restart environment "+env_ip+" app server?")) {
    var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-2014-04-02-installer.exe");
        return false;
   }
  command = command + "plink.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled');
      return true; } else return false;
       };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip+" ( . ~/.bash_profile;  echo App Restart from $SSH_CLIENT at `date +%F_%T` >>~/restart.log; sh restart.sh; tail -f server.out ; read -n 1)");
        } catch(e) {
        alert("Putty is not installed, or SSH to "+env_ip+" failed!");
        }
        window.onerror = window.oldOnError;
	}
}
function execPutty (env_ip,env_username,env_password ) {
  var command;
    var shell = new ActiveXObject("WScript.Shell");
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {	
   	command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {	
   	command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {	
   	command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {	
   	command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {	
   	command = "I:\\Program Files (x86)\\Putty\\";
   } else {
	alert("Putty maybe not installed, please download and install it.");
 	window.open("http://ts.ebaotech.com/tsop/software/putty-2014-04-02-installer.exe");
	return false;
   }
  command = command + "putty.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled��');
      return true;
    }
    else return false;
  	};
  	var wsh = new ActiveXObject('WScript.Shell');
  	if (wsh)
	try {
    	wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip);
	} catch(e) {
	alert("Putty is not installed, or SSH to "+env_ip+" failed!");
	}
  	window.onerror = window.oldOnError;
}

function open_win(url,w,h)
{
window.open(url,"_blank","toolbar=no, location=yes, directories=no, status=yes, menubar=no, scrollbars=yes, resizable=no, copyhistory=yes, width="+w+", height="+h);
return false;
}