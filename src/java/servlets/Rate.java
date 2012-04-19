
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Rate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String bid=request.getParameter("bookid");
        int rate=Integer.parseInt(request.getParameter("rating"));
        String name=request.getParameter("searchname");
        String author=request.getParameter("searchauthor");
        String category=request.getParameter("searchcategory");
        
        DAO.Dao d=(DAO.Dao)(request.getSession().getAttribute("DAO"));
        if(d.rateBook(bid, rate))
            response.sendRedirect("searchresults.jsp?rate=success&bookid="+bid+"&searchname="+name+"&searchauthor="+author+"&searchcategory="+category);
        else
            response.sendRedirect("searchresults.jsp?rate=failed&bookid="+bid+"&searchname="+name+"&searchauthor="+author+"&searchcategory="+category);
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
