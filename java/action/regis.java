/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class URegister
 */
@WebServlet("/regis")
public class regis extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
     
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public regis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String a=request.getParameter("name");
	         String	b=request.getParameter("email");
	         String	c=request.getParameter("Pass");
		 String d=request.getParameter("phone");
                 String e=request.getParameter("gender");
                 String f=request.getParameter("dob");
                 String g=request.getParameter("state");
                 String h=request.getParameter("country");
                 String i=request.getParameter("role");
                 
                 System.out.println("4444444444"+a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g+" "+h+" "+i);
		

		try 
		{
                    
                      HttpSession session=request.getSession();
                 
                    
                    
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/key1","root","root");
			PreparedStatement query=con.prepareStatement("insert into reg(uname,email,pass,phone,gender,dob,state,country,role)values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"')");
			query.executeUpdate();
                        
			
			System.out.println("Register Sucessfull ");
                        
                        
                        
                        
			
			PrintWriter out = response.getWriter();
                        
                        
                        
                        
                        
                        
			out.println("<script type=\"text/javascript\">"); 			
			out.println("alert(\"Succesfully Register \")");

			out.println("</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher("index.html;");
			rd.include(request,response);

			
				
		}
		 	
		catch (ClassNotFoundException w) 
		{			
			w.printStackTrace();
		}
		catch (SQLException w) 
		{			
			w.printStackTrace();
		}

	}
}