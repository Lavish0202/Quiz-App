<%-- 
    Document   : insertque
    Created on : 17 Nov, 2017, 1:07:02 AM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
   <%
       String qno=request.getParameter("qno");
       String que=request.getParameter("que");
String op1=request.getParameter("op1");
String op2=request.getParameter("op2");
String op3=request.getParameter("op3");
       String op4=request.getParameter("op4");
        String ans=request.getParameter("ans");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","adminl");
PreparedStatement s=con.prepareStatement("insert into ques(qno,que,op1,op2,op3,op4,ans)values(?,?,?,?,?,?,?)");
s.setString(1, qno);
 s.setString(2,que);
 s.setString(3,op1);
 s.setString(4,op2);
 s.setString(5,op3);
 s.setString(6,op4);
 s.setString(7,ans);
 int i=s.executeUpdate();
con.close();
   %>
    </body>
</html>
