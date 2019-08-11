<%-- 
    Document   : adminwork
    Created on : 13 Nov, 2017, 10:56:48 PM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <title>welcome admin</title>
<script language="javascript">
function change(url)
{
	window.navigate(url);
}
</script>
</head>
<body>
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="welcome.jsp">welcome</a></h1>
    
    </div>
    
    </div>
<center>
<h1>WELCOME ADMINISTRATOR</h1>
<hr><br/><br/>
<input type="button" value="START QUIZ" onclick="change('start1.jsp')"><br/><br/>
<input type="button" value="DELETE ALL PREVIOUS RESULTS" onclick="change('endquiz.jsp')"><br/><br/>
<input type="button" value="    QUIT    " onclick="window.close()"><br/><br/>
<input type="button" value="Insert Questions" onclick="queans.jsp"><br/><br/>
</center>
</body>
</html>

