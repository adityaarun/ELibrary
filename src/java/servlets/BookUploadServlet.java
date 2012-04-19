
package servlets;

import beans.Books;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookUploadServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        Books b=(Books)request.getSession().getAttribute("BOOK");
        String id=(String)request.getSession().getAttribute("ID");
        DAO.Dao d=(DAO.Dao)(request.getSession().getAttribute("DAO"));        
            
        if(d==null)
            System.out.println("null");
        if(!(d.findCategory(b.getCategory())))
            response.sendRedirect("uploadbook.jsp?success=false&categorynotexist=true");
        else{
            
            String n=b.addBook(b.getBookname(), b.getAuthor(), b.getCategory(), b.getKeywords(), id,d);
            InputStreamReader input = new InputStreamReader(request.getInputStream());
            //BufferedReader buffer = new BufferedReader(input);
            File f=new File("/home/pradyumna/uploads",n.concat(".pdf"));
            FileWriter fw=new FileWriter(f);
            int ch;
            while((ch=input.read())!=-1){
                fw.write(ch);
            }
            if(n!=null)
                response.sendRedirect("uploadbook.jsp?success=true");
            else
                response.sendRedirect("uploadbook.jsp?success=false&categorynotexist=false");
        }
        request.getSession().removeAttribute("BOOK");
        
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
