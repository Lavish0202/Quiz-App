<%-- 
    Document   : welcome
    Created on : 13 Nov, 2017, 10:45:19 PM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>WELCOME</title>
<script language="javascript">
function win()
{
var w=screen.width-20;
window.open("./login.jsp","","width="+w+",height="+690+",location=0,directories=0,menubar=0,toolbar=0,status=0,scrollbars=1,resizable=0,top=5,left=5");
window.location.reload();
}
function take()
{
var w=screen.width-20;
window.open("./ques.jsp","","width="+w+",height="+690+",location=0,directories=0,menubar=0,toolbar=0,status=0,scrollbars=1,resizable=0,top=5,left=5");
window.location.reload();
}
</script>
</head>
<body>
    <center>
<h1>WELCOME TO COMPUTERIZED QUIZ SYSTEM</h1>
<br/><br/><br/>
<br/><br/><br/><br/>
<input type="button" value="CLICK HERE TO LOG IN" onclick="win()">
<input type="button" value="Take Quiz" onclick="take()">
<div id="content">
    <p>The rules of the quiz are as:</p>
</div>
</center>
</body>
</html>
