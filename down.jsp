

<%@page import="java.io.InputStreamReader"%>
<%@page import="action.Dbconn"%>
<%@page import="java.io.InputStream"%>
<%@page import="action.Decryption"%>
<%@page import="java.io.BufferedReader"%>
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

      InputStream is=null;

   String id=request.getParameter("id"); 
   String fkey=request.getParameter("fkey");
   String fname=request.getParameter("filename");

    Connection con = Dbconn.getConnection();
    Statement st = con.createStatement();
   

    ResultSet rt=st.executeQuery("select * from upload where id='"+id+"'");
          
          if(rt.next()){ {
         
           is=(InputStream)rt.getAsciiStream("content");             
          }
         
         BufferedReader br=new BufferedReader(new InputStreamReader(is));
         String temp=null;
         StringBuffer sb=new StringBuffer();
         while((temp=br.readLine())!=null){
            sb.append(temp);
         }
         String content=new Decryption().decrypt(sb.toString(),fkey);
         
         response.setHeader("Content-Disposition","attachment;fkey=\""+fname+"\"");        
         out.write(content);
         
        response.sendRedirect("search2.jsp?msg23=Download successfully...");
        
               }else{
       response.sendRedirect("search2.jsp?msg=Error");
         }
%>
%>
</body>
</html>