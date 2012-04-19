<%-- 
    Document   : register
    Created on : Mar 13, 2012, 10:17:00 AM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <link rel="stylesheet" href="stylesheet/style.css" type="text/css">
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="jquery-1.7.1.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>

	<script src="ui/jquery.ui.datepicker.js"></script>
	<script>
	$(function() {
		$( "#date" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
	});
	</script>
    </head>
    <body>
        <div id="register">
            <div id="regHeader">
                <h2>New User Registration</h2>
            </div>
            <div id="regCenter">
                <form name="regForm" action="./RegistrationServlet" method="POST">
                    <table>
                        <tr>
                            <td>Name </td>
                            <td><input type="text" name="name" id="name"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" id="email"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password" id="password"></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td><input type="password" name="confirmPassword" id="confirmPassword"></td>
                        </tr>
                       
                        <tr>
                            <td>City</td>
                            <td><input type="text" name="city" id="city"></td>
                        </tr>
                        <tr>
                            <td>Contact No.</td>
                            <td><input type="text" name="contact" id="contact"></td>
                        </tr>
                        <!--<tr>
                            <td>Profile Picture</td>
                            <td><input type="file" name="profilePicture" id="profilePicture"></td>
                        </tr>-->                     
                    </table>
                    <br><br>
                    <input type="submit" value="Register">
                </form>
            </div>
            <div id="regFooter">
                &COPY;Aditya Arun and Pradyumna Das
            </div>
        </div>
    </body>
</html>
