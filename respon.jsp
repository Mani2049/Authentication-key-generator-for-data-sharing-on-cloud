<%-- 
    Document   : newjsp
    Created on : Oct 6, 2017, 6:16:26 PM
    Author     : java1
--%>

<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>JSP Page</title>
    </head>
    <body>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
 
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>


<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%

          String name=(String)session.getAttribute("name");
        



        String skey = null;
   
    
        String a = request.getParameter("id");
        String b = request.getParameter("user");
        String c = request.getParameter("file_name");
          String d = request.getParameter("email");
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+a);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+b);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+c);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+name);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+d);
     
    
    
         Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/key1","root","root");
	PreparedStatement query=con.prepareStatement("insert into download(filename,username,email)values('"+c+"','"+b+"','"+d+"')");
	query.executeUpdate();
	
	out.println("<script type=\"text/javascript\">"); 			
	out.println("alert(\"Your Response Sucessfully Send to User\")");

	out.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("tpaloginpage.jsp");
	rd.include(request,response);
	System.out.println("ok");
    
        
         
        
        
        
   
%>
</body>
</html>
