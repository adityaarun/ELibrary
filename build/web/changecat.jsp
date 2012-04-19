<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%
    if(session.getAttribute("NAME")==null){
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
%>
<head>
	<title>Change Category</title>
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
                                <%String cat=request.getParameter("bookid");
                                  session.setAttribute("BID", cat);                                  
                                %>
                                <form name="addcat" action="ChangeCategory">
                                                <center>
                                                        New category Name &nbsp;&nbsp;&nbsp;&nbsp;                                
                                                        <select name="catname">
                                                            <%
                                                            DAO.Dao d=(DAO.Dao)(session.getAttribute("DAO"));
                                                            String cats[]=d.getCategories();
                                                            for(int i=0;i<cats.length;i++){
                                                                out.println("<option value='"+cats[i]+"'>"+cats[i]+"</option>");
                                                            }
                                                            %>                                    
                                                        </select><br/>
                                                        <input type="submit" value="change category">
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

                                
