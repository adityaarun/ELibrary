

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
	<title>Manage Books</title>
	<link rel="stylesheet" href="css/style.css" type="text/stylesheet">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 0.20" />
</head>

<body>
	<div id="content">
                <%@include file="sidebar.jsp" %>
		<div id="books">
			<div id="uploads">
                            <%
                                String cc=request.getParameter("changecat");
                                String del=request.getParameter("delete");
                                if(cc!=null){
                                    if(cc.equals("success"))
                                        out.println("<h5>category change successfull</h5>");
                                    else
                                        out.println("<h5>category change failed</h5>");
                                }
                                if(del!=null){
                                    if(del.equals("success"))
                                        out.println("<h5>delete successfull</h5>");
                                    else
                                        out.println("<h5>delete failed</h5>");
                                }
                            %>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 align="center">Uploaded books</h3><br/>
                                <form action="managebooks.jsp" method="post">
                                Category :                               
                                <select name="category">                                   
                                <%
                                DAO.Dao d=(DAO.Dao)(session.getAttribute("DAO"));
                                String cats[]=d.getCategories();
                                for(int i=0;i<cats.length;i++){
                                    out.println("<option value='"+cats[i]+"'>"+cats[i]+"</option>");
                                }                                
                                %>
                                </select>                                    
                                <input type="submit" value="submit"/>
                                </form>
                                <%
                                String c=request.getParameter("category");
                                if(c!=null)
                                 {
                                    ResultSet rs=d.findBooksByCategory(c);
                                    if(!rs.next()){
                                        out.println("<h4><pre>       Sorry, there are no books in that category</pre></h4>");
                                    }
                                                                       else{
                                                                               
                                    %>
                                <table cellpadding="5">
                                    <tr>
                                        <th>Book name</th>
                                        <th>Author</th>
                                        <th>Category</th>
                                        <th>Uploaded By</th>
                                        <th>Rating</th>
                                    </tr>
                                            <%                                                                                                 
                                                do{   
                                                    out.println("<tr>");
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(2) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(3) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(4) +"</td>");
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(5) +"</td>");                                                       
                                                    out.print("<td style='padding-right:20px;'>"+rs.getInt(6) +"</td>"); 
                                                    String bid=rs.getString(1);
                                                    out.print("<td style='padding-right:20px;'><a href=RemoveBook?bookid="+bid+"&category="+rs.getString(4)+">Remove</a></td>");
                                                    out.print("<td style='padding-right:20px;'><a href=changecat.jsp?bookid="+bid+">Change category</a></td>");
                                                    out.println("<tr>");
                                                }while(rs.next());
                                            %>
                                </table>
                                            <%  }  
                                                                       }
                                    %>
			</div>
			<!--<div id="suggestions">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Book Suggestions <br\>
				<table>
					<tr>
						<td>Book Name</td>
						<td>Book Author</td>
						<td>Subject</td>
						<td>Rating</td>
					</tr>
				</table>
			</div>-->
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
