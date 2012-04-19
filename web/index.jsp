

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylesheet/style.css" type="text/css">
        <title>E-Book Library</title>
    </head>
    <body>
        <% String s=request.getParameter("registrationsuccess");
        if(s!=null)
            if(s.equals("true")){
                out.println("<h3 align='center'>You have been successfully registered</h3>");
            }
        %>
        <div id="content">
            <div id="header">
                <h2>Welcome to Library</h2>
            </div>
            <div id="center">
                <form name="loginForm" action="./LoginServlet" method="POST">
                <table>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" id="username"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" id="password"></td>
                    </tr>
                </table>
                <br><br>
                <center><input type="submit" value="Login"></center>
                </form>
                <br><br>
                <a href="register.jsp">New Users Register Here</a>
            </div>
            <div id="footer">
                &copy Aditya Arun and Pradyumna Das
            </div>
        </div>
    </body>
</html>
