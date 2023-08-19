<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="action.Decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="action.Mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="action.Mail"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
{
     String  uname=(String)session.getAttribute("ssuname");
    
   String url = "jdbc:mysql://localhost:3306/key1";
        String user = "root";
        String password = "root";
       String id=request.getParameter("id");
      
            Connection conn = DriverManager.getConnection(url, user, password);
           Statement st1=conn.createStatement();
            
            String sql = "Select *  from upload where id = '" + id + "' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
              
           String  fname=result.getString("filename");
         String   fkey=result.getString("secret_key");
          InputStream is=(InputStream)result.getAsciiStream("content");
          
            BufferedReader br=new BufferedReader(new InputStreamReader(is));
         String temp=null;
         StringBuffer sb=new StringBuffer();
         while((temp=br.readLine())!=null){
            sb.append(temp);
         }
         String content=new Decryption().decrypt(sb.toString(),fkey);
         
         response.setHeader("Content-Disposition","attachment;filename=\""+fname+"\"");        
         out.write(content);
          
                Calendar cal=Calendar.getInstance();
            DateFormat dateformat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");          
            String time=dateformat.format(cal.getTime());
            System.out.println("download time:"+time);
            
            st1.executeUpdate("insert into downloads (filename,username,time)values('"+fname+"','"+uname+"','"+time+"')");

           
           response.sendRedirect("update3.jsp");
     }else{
           response.sendRedirect("urespones.jsp.jsp");
     }
     }
%>
