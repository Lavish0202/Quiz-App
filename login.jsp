<%-- 
    Document   : login
    Created on : 13 Nov, 2017, 10:37:51 PM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!! ADMIN</title>
   
<script language="javascript">
function fun()
{
	var us=document.getElementById("id").value;
	var psw=document.getElementById("psw").value;
	if((us="admin")&&(psw="admin"))
	{
		document.getElementById("err").style.visibility="hidden";
		return true;
	}
	else
	{
		document.getElementById("err").style.visibility="visible";
		document.getElementById("id").value="";
		document.getElementById("psw").value="";
		document.getElementById("id").focus();
		return false;
	}
}
</script>
</head>
<body onload="document.getElementById('id').focus()">
<div id="wrapper">

<center>
<h1>ADMINISTRATOR LOGIN</h1>
<hr>
</center>
<form action="./adminduties.jsp">
<table align="center" cellpadding="5">
<tr>
<th>User Name:</th><td><input type="text" name="id" id="id"></td>
</tr>
<tr>
<th>Password:</th><td><input type="password" name="psw" id="psw"></td>
</tr>
<tr>
<th colspan="2"><input type="submit" value="  Login  " onclick="return fun()">
<input type="reset" value=" Cancel "></th>
</tr>
<tr>
<th colspan="2" id="err" style="visibility:hidden">Sorry!! Invalid user name / password..</th>
</tr>
</table>
</form>
    </body>
</html>
