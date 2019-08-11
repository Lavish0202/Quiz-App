<%-- 
    Document   : nextq
    Created on : 28 Nov, 2017, 11:36:31 PM
    Author     : HP Laptop
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Page</title>
          <script language="javascript">
var i=0,j=0;
function time()
{
i++;
if(i===30)
{
	document.f1.submit();
}
document.getElementById('t2').innerHTML="";
document.getElementById('t2').innerHTML=i;
t=setTimeout('time()',1000); 
}
</script>
    </head>
    <body onload="time()">

<%!
	Connection con = null;
	ResultSet rs=null;
%>
<%
System.out.println("Entered next.jsp");
int ques=Integer.parseInt(request.getParameter("ques"));
System.out.println("prev ques no.="+ques);
ques++;
System.out.println("new q="+ques);
int stdno =Integer.parseInt(session.getAttribute("prevstd").toString());
System.out.println("prev student no.="+stdno);
stdno++;
System.out.println("new student no.="+stdno);
int noques=Integer.parseInt(session.getAttribute("noques").toString());
System.out.println("noques="+noques);
int nostd =Integer.parseInt(session.getAttribute("nostd").toString());
System.out.println("no student"+nostd);
if(ques<=noques)
{
	System.out.println("ques<=noques.. continue quiz with q="+ques);
	if(stdno<=nostd)
	{
		System.out.println("std<=nostd... continue with sudent number="+stdno);
	}
	else
	{
		stdno =1;
		System.out.println("Class over. New class="+stdno);
	}
%>
	<center>
	<form action="./checkanswer.jsp" name="f1">
	<h1>QUESTION <%=ques %></h1> <br />
	<h2>STUDENT <%=stdno %></h2> <br />
	<input type="hidden" value="<%=stdno %>" name="stdno" id="teamno">
	<table border=0>
	<tr><th>Time Elapsed</th></tr>
	<tr><td align="center"><p id="t2"></p></td></tr>
	</table>
	<br/>
	<HR><br/>
	<table>
	<tr>
	<%
	try{
		System.out.println("connecting db");
		 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","adminl");
	   PreparedStatement s1=con.prepareStatement("update stud set status='yes' where stdno="+stdno);
		int i=s1.executeUpdate();
                PreparedStatement s2=con.prepareStatement("select * from ques where qno="+ques);
	    rs=s2.executeQuery();
	    if(rs.next())
		{
	%>
	<td><%=rs.getInt(1) %>.<input type="hidden" value="<%=rs.getInt(1) %>" name="ques" id="ques"></td>
	<td><%=rs.getString(2) %></td>
	</tr>
	<tr><td><input type="radio" name="q" id="q1" value="A"></td>	
	<td><%=rs.getString(4) %></td>
	</tr>
	<tr><td><input type="radio" name="q" id="q2" value="B"></td>	
	<td><%=rs.getString(5) %></td>
	</tr>
	<tr><td><input type="radio" name="q" id="q3" value="C"></td>	
	<td><%=rs.getString(6) %></td>
	</tr>
	<tr><td><input type="radio" name="q" id="q4" value="D"></td>
	<td><%=rs.getString(7) %></td>			
	<%
	    }
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	 %>
	 </tr>
	 </table><BR/>
	<input type="submit" value="Next">
	</form>
	</center>
	
<%
}
else
{
	System.out.println("quiz over.");
%>
	<jsp:forward page="./over.jsp"></jsp:forward>
<%
}
%>
</body>
</html>

