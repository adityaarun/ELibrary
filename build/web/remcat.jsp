

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="DAO.Dao" %>
<%@page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%
    if(session.getAttribute("NAME")==null){
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
%>
<head>
	<title>Welcome to the Library</title>
	<link rel="stylesheet" href="css/style.css" type="text/stylesheet">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 0.20" />
</head>

<body>
	<div id="content">
                <%@include file="sidebar.jsp" %>
		<div id="books">
			<div id="uploads">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 align="center">Categories List</h3><br/>
                                <%String s=request.getParameter("delete");
                                if(s!=null){
                                    if(s.equals("failed"))
                                        out.println("<h5 align='center'>Deletion failed</h5>");
                                }
                                %>
                                <table cellpadding="5">
                                    <tr>
                                        <th>Name</th>
                                        <th>Author</th>
                                        <th>Category</th>
                                        <th>Rating</th>
                                    </tr>
                                            <% Dao d=(Dao)session.getAttribute("DAO");
                                               String cats[]=d.getCategories();
                                               for(String c:cats){   
                                                    out.println("<tr>");
                                                    out.print("<td style='padding-right:20px;'>"+c+"</td>");    
                                                    out.print("<td style='padding-right:20px;'><a href=CatRemServlet?cat="+c+">Remove</a></td>");
                                                    out.println("<tr>");
                                                }
                                            %>
				</table>
			</div>
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
