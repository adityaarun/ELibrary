

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
                                <h3 align="center">Books Uploaded By You</h3><br/>
                                <table cellpadding="5">
                                    <tr>
                                        <th>Name</th>
                                        <th>Author</th>
                                        <th>Category</th>
                                        <th>Rating</th>
                                    </tr>
                                            <% Dao d=(Dao)session.getAttribute("DAO");
                                                String id=(String)session.getAttribute("ID");
                                                ResultSet rs=d.findBooksByUser(id);
                                                while(rs.next()){   
                                                    out.println("<tr>");
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(2) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(3) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(4) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getFloat(6) +"</td>"); 
                                                    String bid=rs.getString(1);
                                                    out.print("<td style='padding-right:20px;'><a href=RemoveBook?bookid="+bid+"&category="+rs.getString(4)+">Remove</a></td>");
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
