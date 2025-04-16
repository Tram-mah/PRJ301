<%-- 
    Document   : login
    Created on : 30-10-2022
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <h1>Login information</h1>
        <hr/>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="Login" />
            User name: <input type="text" name="txtUserID"/> <br/>
            Password:  <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="Login"/>
            
        </form>        
    </body>
    
</html>
