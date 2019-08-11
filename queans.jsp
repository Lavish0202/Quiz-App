<%-- 
    Document   : queans
    Created on : 17 Nov, 2017, 1:23:31 AM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center><br/><br/><br/>
<fieldset>
<legend align="center"><b>Enter Question And Option</b></legend>
<form action="insertque.jsp">
<table cellpadding="5">
<tr>
<th align="right">Enter the question number </th>
<td><input type="text" name="qno" id="qno"></td>
</tr>
    <tr>
<th align="right">Enter the question </th>
<td><input type="text" name="que" id="que"></td>
</tr>
<tr>
<th align="right">Enter A </th>
<td><input type="text" name="A" id="op1"></td>
</tr>
<tr>
<th align="right">Enter B : </th>
<td><input type="text" name="B" id="op2"></td>
</tr>
<tr>
<th align="right">Enter C </th>
<td><input type="text" name="C" id="op3"></td>
</tr>
<tr>
    <tr>
<th align="right">Enter D </th>
<td><input type="text" name="D" id="op4"></td>
</tr>
<tr>
    <tr>
<th align="right">Enter correct answer </th>
<td><input type="text" name="ans" id="ans"></td>
</tr>
<tr><th colspan="2">
<input type="submit" value="SAVE">
<input type="reset" value="CANCEL">`
<input type="button" value="  QUIT  " onclick="window.close()">
</th></tr>
</table>
</fieldset>
</center>
    </body>
</html>
