
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
                                <h3 align="center">Currently Registered Users</h3><br/>
                                <%String s=request.getParameter("grant");
                                if(s!=null){
                                    if(s.equals("failed"))
                                        out.println("<h5 align='center'>Request not granted</h5>");
                                    else
                                        out.println("<h5 align='center'>Request granted</h5>");
                                }
                                %>
                                <table cellpadding="5">
                                    <tr>
                                        <th>Login ID</th>
                                        <th>Username</th>
                                        <th>City</th>
                                        <th>Contact number</th>
                                    </tr>
                                            <% DAO.Dao d=(DAO.Dao)session.getAttribute("DAO");                                              
                                                ResultSet rs=d.getRegularUsers();
                                                while(rs.next()){   
                                                    out.println("<tr>");
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(1) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(4) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(5) +"</td>");    
                                                    out.print("<td style='padding-right:20px;'>"+rs.getString(6) +"</td>"); 
                                                    String id=rs.getString(1);
                                                    out.print("<td style='padding-right:20px;'><a href=AdminGrant?loginid="+id+">grant admin status</a></td>");
                                                    out.println("<tr>");
                                                }
                                            %>
				</table>
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
