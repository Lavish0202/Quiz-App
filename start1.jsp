<%-- 
    Document   : start1
    Created on : 13 Nov, 2017, 10:49:48 PM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<title></title>
<script language="javascript">
function calc()
{
	var mpq=document.getElementById('marksperq').value;
	var noq=document.getElementById('noques').value;
	var std=document.getElementById('std').value;
	if((mpq!=="")&&(noq!==""))
	{
		var t=noq*mpq;
		document.getElementById('total').value=t;
	}
	else
	{
		alert("Check the information again");
	}
}
function check()//submit
{
	var total=document.getElementById('total').value;
	var pass=document.getElementById('passmarks').value;
	if(total<pass)
	{
		alert("pass marks must be less than total marks");
		document.getElementById('passmarks').value="";
		document.getElementById('passmarks').focus();
		return false;
	}
	else
	{
		return true;
	}
}

</script>
</head>
<body>
<div id="wrapper">
 <%session.setAttribute("qno","1"); %>
<%session.setAttribute("quiznum","1");%>
<%session.setAttribute("prevnoques","0");%>
<center><br/><br/><br/>
<fieldset>
<legend align="center"><b>Enter Quiz Details</b></legend>
<form action="save1.jsp">
<table cellpadding="5">
<tr>
<th align="right">Enter No. of Students taking the quiz : </th>
<td><input type="text" name="std" id="std"></td>
</tr>
<tr>
<th align="right">Enter No. of questions in the quiz : </th>
<td><input type="text" name="noques" id="noques" onblur="qpt()"></td>
</tr>
<tr>
<th align="right">Enter marks Per Question for correct answer : </th>
<td><input type="text" name="marksperq" id="marksperq"></td>
</tr>
<tr>
<th align="right">Enter marks for wrong answer : </th>
<td><input type="text" name="negscore" id="negscore"></td>
</tr>
<tr>
<th align="right"><input type="button" value="Total" onclick="calc()" name="cal" id="cal"></th>
<td><input type="text" name="total" id="total" readonly></td>
</tr>
<tr>
<th align="right">Enter pass marks : </th>
<td><input type="text" name="passmarks" id="passmarks"></td>
</tr>
<tr><th colspan="2">
<input type="submit" value="  SAVE  ">
<input type="reset" value="CANCEL">`
<input type="button" value="  QUIT  " onclick="window.close()">
</th></tr>
</table>
</fieldset>
</center>
</body>
</html>