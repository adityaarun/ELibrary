
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateInfo extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String city=request.getParameter("city");
        String phn=request.getParameter("phoneno");
        long phno= phn.equals("") ?0:Long.parseLong(phn);
        
        HttpSession ses=request.getSession();
        DAO.Dao d=(DAO.Dao) ses.getAttribute("DAO");
        String id=(String) ses.getAttribute("ID");
        int rowsaffected=d.updateUserInfo(name, password, city, phno, id);
        if(rowsaffected<=0)
            response.sendRedirect("updateprofile.jsp?updatesuccess=false");
        else
            response.sendRedirect("updateprofile.jsp?updatesuccess=true");
        
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
