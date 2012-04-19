<%boolean isadmin=(Boolean)session.getAttribute("ADMIN");%>
<div id="header">
     <b>Welcome <%=session.getAttribute("NAME") %></b>
</div>
<div id="sidebar">                
        <a href="Welcome.jsp">Home</a><br/>
	<a href="uploadbook.jsp">Upload Books</a><br/>
	<a href="searchbook.jsp">Search Books</a><br />
	<a href="updateprofile.jsp">Update Profile</a><br/>
        <a href="special.jsp">Request Special Ticket</a>
        <% if(isadmin)
            {
            %>
            <a href="managecat.jsp">Manage Category</a> 
            <a href="grantadmin.jsp">Grant admin status</a>
            <a href="managebooks.jsp">Manage Books</a><br>
        <%
        }
        %>
	<a href="Logout.jsp">Logout</a>
		</div>