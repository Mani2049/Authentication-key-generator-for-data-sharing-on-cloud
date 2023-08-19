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
        String fkey = request.getParameter("fkey");  
        Connection con = Dbconn.getConnection();
        Statement st = con.createStatement();
   

    int rs = st.executeUpdate("update request set status='Yes', file_name='"+fkey+"' where id = '" + mac1 + "'");
    if (rs != 0) {
      
        response.sendRedirect("file_share.jsp?msg23=Activation successfully...");
     
    } else {
        response.sendRedirect("file_share.jsp?msg=Error");
    }
%>