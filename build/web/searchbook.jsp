

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
			<center><h3>Book Search</h3></center>
                <form name="search" method="POST" action="searchresults.jsp">
		<table>
                        <tr>
				<td>Book ID : </td>
				<td><input type="text" name="bookid" id="bookid"></td>
			</tr>
			<tr>
				<td>Book Name : </td>
				<td><input type="text" name="searchname" id="searchname"></td>
			</tr>
			<tr>
				<td>Book Author : </td>
				<td><input type="text" name="searchauthor" id="searchauthor"></td>
			</tr>
			<tr>
				<td>Category : </td>
				<td>
                                <select name="searchcategory">
                                    <option value="">select a category</option>
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
		</table>
		<br/>
	
                <input type="submit" value="Search">
                </form>
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
