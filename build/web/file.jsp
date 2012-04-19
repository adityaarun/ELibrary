
<%@page import="beans.Books"%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div>
            <%
            String name=request.getParameter("name");
            String author=request.getParameter("author");
            String cat=request.getParameter("category");
            String keyw=request.getParameter("keywords");
            Books b=new Books();
            b.setAuthor(author);
            b.setBookname(name);
            b.setCategory(cat);
            b.setKeywords(keyw);
            
            session.setAttribute("BOOK", b);
            %>
            <form action="BookUploadServlet" method="POST" enctype="multipart/form-data">
            <table>                
            <tr>
                                    <td>File</td>
                                    <td><input type="file" name="b1" /></td>
                                    <td><input type="submit" value="submit"/></td>
            </tr>
            </table>
            </form>
        </div>
    </body>
</html>