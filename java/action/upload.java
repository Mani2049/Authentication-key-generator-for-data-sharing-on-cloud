/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Dbconn;
import action.Ftpcon;
import action.MailUtil;
import action.Encryption;
import java.util.Random;

/**
 *
 * @author java4
 */
public class upload extends HttpServlet {
File file;
final String filepath="D:/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             MultipartRequest m=new MultipartRequest(request,filepath);
             String pname = m.getParameter("pname");
             System.out.println("pname"+pname);
           File file=m.getFile("file");           
           String filename=file.getName().toLowerCase();
            
            Connection con= Dbconn.getConnection();
            Statement st3=con.createStatement();
            ResultSet rt3=st3.executeQuery("select * from upload where filename='"+filename+"'");
            if(rt3.next()){
                response.sendRedirect("file_upload.jsp?failed='yes'");
            }
            else{
           //out.println("file location:"+filepath+"\n file name:"+filename+"\n");  
            
            BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
            StringBuffer sb=new StringBuffer();
            String temp=null;
            
            while(( temp=br.readLine())!=null){
               sb.append(temp);              
           }           
           // out.println("file content:"+sb.toString());
           
            Random s = new Random();
            int a = s.nextInt(10000 - 5000) +25000 ;
           System.out.print(a);
           
           // secretkey generating
	KeyGenerator symmetric_key = KeyGenerator.getInstance("AES");
	symmetric_key.init(128);
	SecretKey secretKey = symmetric_key.generateKey();
        System.out.println("secret key:"+secretKey);
        
            Encryption e=new Encryption();
           String encryptedtext=e.encrypt(sb.toString(),secretKey);
           //storing encrypted file
            FileWriter fw=new FileWriter(file);
            fw.write(encryptedtext);
           fw.close();
            
        //converting secretkey to String
            byte[] b=secretKey.getEncoded();//encoding secretkey
            String skey=Base64.encode(b);
            System.out.println("converted secretkey to string:"+skey);
            
            //getting properties
            HttpSession user=request.getSession(true);
            String owner=user.getAttribute("owner_name").toString();
            
             DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd 'at' HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
//	     System.out.println(dateFormat.format(date));
             String Start_time= dateFormat.format(date); 
             System.out.println("current Date "+Start_time);
               
	   //get current date time with Calendar()
	    Calendar cal = Calendar.getInstance();
            cal.setTime(date);
             cal.add(Calendar.DATE, 1);
             Date close_time= cal.getTime();
             String End_time=dateFormat.format(close_time);
//             Date End_Time = cal.getTime();
	    System.out.println("current Date add one date"+End_time);
               //get current date time
            
            
            //
            String len=file.length()+"bytes";
            
            //uploading file
            boolean status=new Ftpcon().upload(file);
            
            if(status){
                //Connection con= Dbconnection.getConn();
                Statement st=con.createStatement();
                
       
                int i=st.executeUpdate("insert into upload(filename,content,owner_name,start_time,end_time,secret_key,filekey,pkey)values('"+file.getName()+"','"+encryptedtext+"','"+owner+"','"+Start_time+"','"+End_time+"','"+skey+"','"+pname+"','"+a+"')");
                System.out.println(i);
                if(i!=0){
                   // out.println("success");
                    response.sendRedirect("file_upload.jsp?status='uploded'");
                    
                }
                else{
                    out.println("error while uploading additional informations");
                }
//                 out.println("file stored");
//                 out.println(file.length());
            }
            else{
                out.println("error");
            }
            }
        }
        catch(Exception e){
            out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
