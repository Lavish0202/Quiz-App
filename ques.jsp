<%-- 
    Document   : ques
    Created on : 16 Nov, 2017, 12:27:11 AM
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
        
      
        <center>
<form action="checkans.jsp" name="f1">
<h1>QUESTION 1</h1> <br />
<h2>STUDENT 1</h2> <br />
<input type="hidden" value="1" name="stdno" id="stdno">
<table border=0><tr><th>Time Elapsed</th></tr><tr><td align="center"><p id="t2"></p></td></tr></table>
<br/>
<HR><br/>
<table>
<tr>

<%
try{

    Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","adminl");   
    int startques=Integer.parseInt(session.getAttribute("qno").toString());
    PreparedStatement s=con.prepareStatement("update stud set status='yes' where stdno=1");
	int i=s.executeUpdate();
        PreparedStatement p=con.prepareStatement("select * from ques where qno="+startques);
   ResultSet rs=p.executeQuery();
    if(rs.next())
	{
%>
<td><%=rs.getString("1")%><input type="hidden" value="<%=rs.getString("1") %>" name="qno" id="qno"></td>
<td><%=rs.getString("2")%></td>
</tr>
<tr><td><input type="radio" name="op1" id="op1" value="A"></td>	
<td><%=rs.getString("3")%></td>
</tr>
<tr><td><input type="radio" name="op2" id="op2" value="B"></td>	
<td><%=rs.getString("4")%></td>
</tr>
<tr><td><input type="radio" name="op3" id="op3" value="C"></td>	
<td><%=rs.getString("5")%></td>
</tr>
<tr><td><input type="radio" name="op4" id="op4" value="D"></td>
<td><%=rs.getString("6")%></td>			
<%
}
}
catch(Exception e){
	System.out.println(e);
}
 %>
 </tr>
 </table><BR/>
<input type="submit" value="Next">
</form>
</center>

    </body>
</html>
