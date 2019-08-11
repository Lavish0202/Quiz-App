<%-- 
    Document   : save1
    Created on : 15 Nov, 2017, 10:18:28 PM
    Author     : HP Laptop
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save and Start</title>
    </head>
    <% 
        
String std=request.getParameter("std");
String noques=request.getParameter("noques");
String marksperq=request.getParameter("marksperq");
String negscore=request.getParameter("negscore");
String total=request.getParameter("total");
String passmark=request.getParameter("passmarks");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","adminl");
PreparedStatement s=con.prepareStatement("insert into admin(std,noques,marksperq,negscore,total,passmark)values(?,?,?,?,?,?)");
s.setString(1,std);
 s.setString(2,noques);
 s.setString(3,marksperq);
 s.setString(4,negscore);
 s.setString(5,total);
 s.setString(6,passmark);
 int i=s.executeUpdate();
 System.out.println("Generating teams and their scores");
    for(int n=1;n<=std;n++)
    {
    	PreparedStatement p=con.prepareStatement("insert into teams values("+n+",0,'no')");
    	int j=p.executeUpdate();
    }
    System.out.println("end of code");
con.close();
    %>