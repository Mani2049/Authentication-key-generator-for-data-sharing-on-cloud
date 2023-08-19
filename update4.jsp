


<%@page import="action.Dbconn"%>
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>


<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%




   
     String mac1 = request.getParameter("id");
     String email = request.getParameter("email");
     String name = request.getParameter("uname");
     String skey = request.getParameter("skey");
    
     System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&"+mac1);
     System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&"+email);
   

    Connection con = Dbconn.getConnection();
    Statement st = con.createStatement();
   

    int rs = st.executeUpdate("update request set status='Yes' where id = '" + mac1 + "'");
    if (rs != 0) {
        
        
         session.setAttribute("name", name);
      
        response.sendRedirect("file_share.jsp?msg23=Activation successfully...");
 
    } else {
        response.sendRedirect("file_share.jsp?msg=Error");
    }
%>