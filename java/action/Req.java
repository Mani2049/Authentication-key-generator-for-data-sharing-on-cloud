/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import action.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author java4
 */
public class Req extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession(true);

            String User_Name = (String) session.getAttribute("ssuname");
            String Email = (String) session.getAttribute("ssmail");
            String State = (String) session.getAttribute("ssstate");
            String Country = (String) session.getAttribute("sscountry");
            String file_Name = (String) session.getAttribute("SSpatient");
            String Secret_Key = (String) session.getAttribute("SSsecret_key");
            System.out.println("Session Values :" + User_Name + Email + State + Country + file_Name + Secret_Key);
            String stime = request.getParameter("stime");
            String etime = request.getParameter("etime");
            System.out.println("Request Values :" + stime + etime);
            String Status = "No";

            Connection con = Dbconn.getConnection();
            Statement st = con.createStatement();

            String sql = "insert into request(user_name, email, state, country, file_name, secret_key, status, stime, etime) values ('" + User_Name + "','" + Email + "','" + State + "','" + Country + "','" + file_Name + "','" + Secret_Key + "','" + Status + "', '" + stime + "', '" + etime + "')";

            int x = st.executeUpdate(sql);
            if (x != 0) {
                response.sendRedirect("search_patient.jsp?msg=Request_send_Successfully");

            } else {
                response.sendRedirect("search_patient.jsp?message=fail");

            }

        } catch (Exception e) {
            out.println(e);

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
