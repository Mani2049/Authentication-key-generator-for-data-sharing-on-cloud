<%@page import="action.Dbconn"%>
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>


<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%




    String skey = null;
    Random RANDOM = new SecureRandom();
    int mac1_LENGTH = 4;
    String letters = "0123456789";
    String uid = "";
    for (int i = 0; i < mac1_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        uid += letters.substring(index, index + 1);
    }
     String mac1 = request.getParameter("id");
     String email = request.getParameter("email");
     String name = request.getParameter("uname");
     String role = request.getParameter("role");
     String pass= request.getParameter("pass");
     System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+role);
     
    skey = uid;
    String msg="Role :  "+role+"       Secert Key: "+skey;
    Mail mail = new Mail();
    mail.secretMail(msg, name, email);

    Connection con = Dbconn.getConnection();
    Statement st = con.createStatement();
   

    int rs = st.executeUpdate("update reg set activate='Accept', skey='"+skey+"' where id = '" + mac1 + "'");
    if (rs != 0) {
        
        
         session.setAttribute("name", name);
         session.setAttribute("role", role);
         session.setAttribute("skey", skey);
         session.setAttribute("pass", pass);
          
        
        
        response.sendRedirect("userdetails.jsp?msg23=Activation successfully...");
        
         
        
        
        
    } else {
        response.sendRedirect("userdetails.jsp?msg=Error");
    }
%>


