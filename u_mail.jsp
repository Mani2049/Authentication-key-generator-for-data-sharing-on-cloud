
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="action.Mail"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
{
   String url = "jdbc:mysql://localhost:3306/key1";
        String user = "root";
        String password = "root";
        int id=Integer.parseInt(request.getQueryString());
        session.setAttribute( "theSid", id );
        System.out.println("id session id set successfully"+id);
      
            Connection conn = DriverManager.getConnection(url, user, password);
           
            
            String sql = "Select *  from request where id = '" + id + "' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
              String name =result.getString("user_name");   
             String key =result.getString("secret_key");
             String pkey =result.getString("private_key");
            String email =result.getString("email");
            session.setAttribute( "ssEmail", email );  
             String msg ="Public Key : "+key+"   Aggregate key: "+pkey ;
             session.setAttribute( "Key", key );  
                      System.out.println("uour randome string"+msg);
            Mail m = new Mail();
            m.secretMail(msg, name, email);
           
           response.sendRedirect("update3.jsp");
     }else{
           response.sendRedirect("urespones.jsp.jsp");
     }
     }
%>
