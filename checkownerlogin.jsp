<%@page import="action.Dbconn"%>
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>


<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
    HttpSession session1=request.getSession();
    
  String a=request.getParameter("name");
  String b=request.getParameter("pass");
  String c=request.getParameter("skey");

 Connection con = null;
    Statement st = null;
   ResultSet rs = null;
     con = Dbconn.getConnection();
        st = con.createStatement();
        
           rs = st.executeQuery("select * from reg where uname='" + a + "' AND pass='" + b + "' AND skey='" + c + "' AND role='Data owner'");
       if (rs.next()) {
           
            session.setAttribute("owner_name", a);
          
           
             System.out.println("user login successfully");
                     out.println("<script type=\"text/javascript\">"); 
                      out.println("alert(\"welcome to  Mr/Ms. '"+a+"'\")");
                       out.println("</script>");
                  System.out.println("**********************************"+a);
                    
                    RequestDispatcher rd=request.getRequestDispatcher("ownerhomepage.jsp");
                    rd.include(request, response);
           
           
       }









%>