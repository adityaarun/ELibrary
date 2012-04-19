<%-- 
    Document   : Logout
    Created on : Mar 27, 2012, 10:50:47 AM
    Author     : pradyumna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%session.invalidate();%>
        <h3>You have been successfully logged out</h3>
        <br/><br/>
        <a href="index.jsp">Log back in</a>
    </body>
</html>
