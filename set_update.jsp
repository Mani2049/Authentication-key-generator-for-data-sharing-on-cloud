<%-- 
    Document   : set_update
    Created on : Oct 8, 2017, 10:50:08 PM
    Author     : Vinoth Raja
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="action.Dbconn"%>
<%

    Connection con = Dbconn.getConnection();
    Statement st = con.createStatement();
    String skey = request.getParameter("skey");
    String odate = request.getParameter("stime");
    String cdate = request.getParameter("etime");

    System.out.println("Skey is :" + skey);
    int i = st.executeUpdate("update upload set start_time='" + odate + "', end_time='" + cdate + "' where secret_key = '" + skey + "'");
    if (i != 0) {
        int in = st.executeUpdate("update request set status='Yes' where secret_key = '" + skey + "'");
        if (in != 0) {

            response.sendRedirect("file_share.jsp?status=File_Share to TPA");
        } else {
            response.sendRedirect("file_share.jsp? msg = Error");
        }
    }
%>
