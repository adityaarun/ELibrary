
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
                    <%String s=request.getParameter("updatesuccess");
                    if(s!=null)
                    {
                        if(s.equals("true")){
                            out.println("<h3>Your profile has been successfully updated</h3>");
                        }
                    else if(s.equals("false")){
                         out.println("<h3>Your profile could not be updated</h3>");
                       }
                    }
                                       else {
                    %>
			<br/><br/><br/><br/><br/><br/>
                        <center><h3>Profile Update</h3>
                            
			<form name="update" method="POST" action="UpdateInfo">
			<table>
				<tr>
					<td>Name : </td>
					<td><input type="text" name="name" id="name" value=""></td>
				</tr>
				<tr>
					<td>Password : </td>
					<td><input type="password" name="password" id="password" value=""></td>
				</tr>
				<tr>
					<td>City : </td>
					<td><input type="text" name="city" id="city" value=""></td>
				</tr>
				<tr>
					<td>Phone No. : </td>
					<td><input type="text" name="phoneno" id="phoneno" value=""></td>
				</tr>
			</table>
			<br/>
			<br/>
			<input type="submit" value="Update">
		</form>
		</center>
                    <%
                                       }
                    %>
		</div>
		<div id="footer">
			&copy;Aditya Arun and Pradyumna Das
		</div>
	</div>
</body>

</html>
