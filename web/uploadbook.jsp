
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

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
                    <%
                        String s=request.getParameter("success");
                        if(s!=null){
                        if(s.equals("true")){
                             out.println("<h3>Your book has been successfully uploaded</h3>");
                        }
                        else{
                            String s1=request.getParameter("categorynotexist");
                            if(s1.equals("true"))
                                out.println("<h3>The provided category does not exist</h3>");
                            else
                                out.println("<h3>The book could not be uploaded. Please try again later.</h3>");
                        }
                                   }
                        else{
                                               
                    %>
			<br/><br/><br/><br/><br/><br/>
                        <center><h3>Upload Books</h3>
                            
                            <form name="update" method="POST" action="file.jsp" enctype="multipart/form-data">
                            <table>
                        <tr>
				<td>Book name : </td>
				<td><input type="text" name="name" id="searchname"/></td>
			</tr>
			<tr>
				<td>Author : </td>
				<td><input type="text" name="author" id="searchauthor"/></td>
			</tr>
			<tr>
				<td>Category : </td>
                                <td>
                                <select name="category">
                                <%
                                DAO.Dao d=(DAO.Dao)(session.getAttribute("DAO"));
                                String cats[]=d.getCategories();
                                for(int i=0;i<cats.length;i++){
                                    out.println("<option value='"+cats[i]+"'>"+cats[i]+"</option>");
                                }
                                %>                                    
                                </select>
                                </td>
			</tr>
			<tr>
				<td>Keywords : </td>
				<td><input type="text" name="keywords" id="searchkeywords"/></td>
			</tr>
                            </table>
                           <br/><br/>
                           <input type="submit" value="Submit"/>
                        </form>
                       <% } %>
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
