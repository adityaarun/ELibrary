

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
                <center>
    		<div id="books">
                    <%
                        String s=request.getParameter("cond");
                        if(s!=null){
                        if(s.equals("success")){
                             out.println("<h3>Your request has been registered</h3>");
                        }
                        else{
                                  out.println("<h3>Your request could not be registered</h3>");   
                        }
                                   }
                        else{
                                               
                    %>
                    <h3>Request Upload Ticket</h3>
                    <form name="ticket" method="post" action="Special">
                        <table>
                            <tr>
                                <td>Request Size</td>
                                <td><input type="text" name="request" id="request" /></td>
                            </tr>
                            <tr>
                                <td>Purpose</td>
                                <td><textarea name="purpose"></textarea></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Post Request" /></td>
                            </tr>
                        </table>
                    </form>
                  <% } %>
		</div>
                </center>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
<%-- 
    Document   : special
    Created on : Apr 16, 2012, 8:34:01 PM
    Author     : pradyumna
--%>
