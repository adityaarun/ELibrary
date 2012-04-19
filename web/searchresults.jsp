
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
	<title>Search Results</title>
	<link rel="stylesheet" href="css/style.css" type="text/stylesheet">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 0.20" />

    </head>
   <body>
	<div id="content">
		<%@include file="sidebar.jsp" %>
		<div id="books">
                    <div id="uploads">
                    <%String s=request.getParameter("rate");
                    if(s!=null)
                    {
                        if(s.equals("success")){
                            out.println("<h5>Rating Successful</h5>");
                        }
                    else if(s.equals("failed")){
                         out.println("<h5>Rating Unsuccessful</h5>");
                       }
                    }
                    %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <h3 align="center">Search Results</h3><br/>
                       <table cellpadding="5">
                                    <tr>
                                        <th>Name</th>
                                        <th>Author</th>
                                        <th>Category</th>
                                        <th>Rating</th>
                                    </tr>
                    <%
                        String name=request.getParameter("searchname");
                        String author=request.getParameter("searchauthor");
                        String category=request.getParameter("searchcategory");
                        String bookid=request.getParameter("bookid");
                        
                        DAO.Dao d=(DAO.Dao)(session.getAttribute("DAO"));
                        ResultSet rs=d.findBook(name, author, category, bookid);
                        
                        if(rs!=null){
                            while(rs.next()){
                                out.println("<tr>");
                                out.print("<td style='padding-right:20px;'>"+rs.getString(2) +"</td>");    
                                out.print("<td style='padding-right:20px;'>"+rs.getString(3) +"</td>");    
                                out.print("<td style='padding-right:20px;'>"+rs.getString(4) +"</td>");    
                                out.print("<td style='padding-right:20px;'>"+rs.getFloat(6) +"</td>"); 
                                String bid=rs.getString(1);
                                out.print("<td style='padding-right:20px;'><form action='Rate?bookid="+bid+
                                        "&searchname="+name+"&searchauthor="+author+"&searchcategory="+category+
                                        "' method='POST'><select name='rating'><option name='1'>1</option>"+
                                        "<option name='2'>2</option>"+
                                        "<option name='3'>3</option>"+
                                        "<option name='4'>4</option><option name='5'>5</option>"+
                                        " </select><input type='submit' value='rate'/></form></td>");
                                out.println("<tr>");
                            }
                        }
                        
                                               else{
                                                        out.println("<h3>No records match your query</h3>");
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
