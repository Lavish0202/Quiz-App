<%-- 
    Document   : checkans
    Created on : 25 Nov, 2017, 1:01:24 AM
    Author     : HP Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%!
Connection con = null;
ResultSet rs=null,rs2=null;
int marks=0;
%>
<%
System.out.println("entered checkanswer.jsp");
String qno=request.getParameter("qno");
System.out.println("prev ques no:"+qno);
String ans=request.getParameter("ans");
System.out.println("prev answer="+ans);
int stdno=Integer.parseInt(request.getParameter("stdno"));
System.out.println("Previous stdno="+stdno);
int marksperq=Integer.parseInt(session.getAttribute("marksperq").toString());
int negscore=Integer.parseInt(session.getAttribute("negscore").toString());
session.setAttribute("prevstd",String.valueOf(stdno));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
<form name="f1">
<input type="text" name="ques" value="<%=qno%>" id="qno">
<input type="text" name="student" value="<%=stdno%>" id="stdno">
</form>
</body>
</html>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","adminl");

    System.out.println("set stud status=no");
	PreparedStatement s1=con.prepareStatement("update stud set status='no' where stdno="+stdno);
	int i=s1.executeUpdate();
	//get prev marks of team
	System.out.println("get prev marks of team");
	PreparedStatement s2=con.prepareStatement("select marks from stud where stdno="+stdno);
	rs=s2.executeQuery();
	if(rs.next())
	{
		//get marks
		marks=rs.getInt(1);
		System.out.println("prev marks="+marks);
		//get correct answer from db
		System.out.println("get correct ans from db");
		PreparedStatement s3=con.prepareStatement("select answer from ques where qno="+qno);
		rs2=s3.executeQuery();
		if(rs2.next())
		{
			//get answer
			String correctans=rs2.getString(1);
			System.out.println("correctanswer is="+correctans);
			//compare answers
			if(correctans.equals(ans))
			{
				//if answer is correct
				System.out.println("correct answer");
				//adding score
				marks=marks+marksperq;
				System.out.println("New marks="+marks);
			}
			else
			{
				//wrong answer
				System.out.println("wrong answer");
				if((marks>0)&&((marks-negscore)>=0))
				{
					//reducing score
					System.out.println("reducing score");
					marks=marks-negscore;
				}
				else
				{
					//do nothing bcoz marks are already 0
					System.out.println("do nothing");
				}
				System.out.println("New marks="+marks);
			}
			//now update database with new score
			System.out.println("update db with new score");
			PreparedStatement s4=con.prepareStatement("update stud set marks="+marks+",status='no' where stdno="+stdno);
			int j=s4.executeUpdate();
			System.out.println("end of updation");
			%>
			<jsp:forward page="./next.jsp"></jsp:forward>
			<%
		}
			}
	
}
catch(Exception e){
	System.out.println(e);
}
System.out.println("end of checkanswer.jsp");
 %>

