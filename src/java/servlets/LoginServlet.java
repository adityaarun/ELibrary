
package servlets;

import DAO.Dao;
import beans.Users;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            HttpSession ses=request.getSession();
            Dao dao=new Dao();
            ses.setAttribute("DAO", dao);
            String usr=request.getParameter("username");
            String pwd=request.getParameter("password");
            ResultSet rs=dao.findUser(usr,pwd);
            Users u=new Users();      
        try{    
            if(rs.next()){
                
                ses.setAttribute("ID", rs.getString(1));
                u.setLoginid(rs.getString(1));
                ses.setAttribute("NAME", rs.getString(4));
                u.setUsername(rs.getString(4));
                ses.setAttribute("ADMIN", rs.getBoolean(3));
                u.setIsadmin(rs.getBoolean(3));
                ses.setAttribute("USER", u);
                response.sendRedirect("./Welcome.jsp");
                
            }
            else{
                ses.invalidate();
                response.sendRedirect("./LoginFailed.html");
            }
        } catch (SQLException ex) {
            
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
