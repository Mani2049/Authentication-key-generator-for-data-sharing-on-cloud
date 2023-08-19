
<%@page import="action.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    Connection con = Dbconn.getConnection();
    Statement st = con.createStatement();

    String Status = "Permission Granted";

    int id = (Integer) session.getAttribute("theSid");
    System.out.println("session id is geted" + id);
    int i = st.executeUpdate("update request set status='" + Status + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("urespones.jsp?msg=private_key_Aggregate_key_and_sent_to_Your_Email");
    } else {
        response.sendRedirect("urespones.jsp?msg = Error");
    }
%>
