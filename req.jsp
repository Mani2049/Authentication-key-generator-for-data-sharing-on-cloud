

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

         
            String User_Name = (String) session.getAttribute("ssuname");
            String Email = (String) session.getAttribute("ssemail");
            String State = (String) session.getAttribute("ssstate");
            
            
            String Country = (String) session.getAttribute("sscountry");
            String file_Name = (String) session.getAttribute("SSfilekey");
            String Secret_Key = (String) session.getAttribute("SSsecret_key");
             String private_Key = (String) session.getAttribute("SSpkey");
             String end_time = (String) session.getAttribute("SSend_time");
              String start_time = (String) session.getAttribute("SSend_time");


        String skey = null;
   
    
        String a = request.getParameter("id");
        String b = request.getParameter("fkey");
        String c = request.getParameter("owner");
       
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+private_Key);
       ;
     
    
    
         Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/key1","root","root");
	PreparedStatement query=con.prepareStatement("insert into request(user_name, email, state, country, file_name, secret_key,stime, etime,private_key)values('"+User_Name+"','"+Email+"','"+State+"','"+Country+"','"+file_Name+"','"+Secret_Key+"','"+start_time+"','"+end_time+"','"+private_Key+"')");
	query.executeUpdate();
	
	out.println("<script type=\"text/javascript\">"); 			
	out.println("alert(\"Your Request Sucessfully Send to cloud\")");

	out.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("userhomepage.jsp");
	rd.include(request,response);
	System.out.println("ok");
    
        
         
        
        
        
   
%>
</body>
</html>
