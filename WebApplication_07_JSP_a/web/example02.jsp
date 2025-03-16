<%-- 
    Document   : example02
    Created on : Feb 17, 2025, 12:29:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            for (int i = 0; i <= 99; i++) {
                %>
                    <%=i%><br/>
                <%
            }
        %> 
    </body>
</html>
