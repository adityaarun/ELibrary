<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%
    if(session.getAttribute("NAME")==null){
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
%>
<head>
	<title>Add Category</title>
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
                                <h3 align="center">Enter new category name</h3><br/>
                                            <form name="addcat" action="AddCat">
                                                <center>
                                                        Category Name &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="catname" id="catname"><br/>
                                                        <input type="submit" value="Create">
                                                </center>
                                            </form>
                         </div>
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>

                                
