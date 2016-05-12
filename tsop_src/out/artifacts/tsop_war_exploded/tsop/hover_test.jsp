<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>jQuery hoverÌЧ</title>
<script src="scripts/jquery-1.11.1.js" type="text/javascript"></script> 
<script type="text/javascript">
$(document).ready(function() {
$("#orderedlist tbody tr").hover(function() {
	// $("#orderedlist li:last").hover(function() {
		$(this).addClass("blue");
	}, function() {
		$(this).removeClass("blue");
	});
});
</script>
<style>
.blue {
        background:#bcd4ec;  
}
</style>
</head>
<body>
<table id="orderedlist" width="50%" border="0" cellspacing="0" cellpadding="0"> 
<!--Óclass="stripe"4±êÐҪʹÓ¸Ã§¹û¸ñ
<thead>
  <tr>
    <th>ÐÃ</th>
    <th>ÄÁ</th>
    <th>QQ</th>
    <th>Email</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>µ˹útd>
    <td>23</td>
    <td>31540205</td>
    <td>gl.deng@gmail.com</td>
  </tr>
  <tr>
    <td>Î¼ұ¦</td>
    <td>23</td>
    <td>31540205</td>
    <td>gl.deng@gmail.com</td>
  </tr>
  <tr>
    <td>°°Íítd>
    <td>23</td>
    <td>31540205</td>
    <td>gl.deng@gmail.com</td>
  </tr>
</tbody>
</table>
</body>
</html>
