<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Manage Categories</title>
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
                        String s=request.getParameter("update");
                        if(s!=null){
                            if(s.equals("success"))
                                out.println("<center><h4>Category has been successfully renamed</h4></center>");
                            else
                                out.println("<center><h4>Category rename failed</h4></center>");
                                                       }
                        %>
                        <form action="UpdateCat" method="POST">
                            <center>
                                <h4>Current category name</h4><select name="oldcatname">
                        <%
                                DAO.Dao d=(DAO.Dao)(session.getAttribute("DAO"));
                                String cats[]=d.getCategories();
                                for(int i=0;i<cats.length;i++){
                                    out.println("<option value='"+cats[i]+"'>"+cats[i]+"</option>");
                                }                        
                        %>
                                </select><br/>
                                <h4>New category name</h4>>><input type="text" name="newcatname"/><br/><br/>
                            <input type="submit" value="change name"/>                            
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
