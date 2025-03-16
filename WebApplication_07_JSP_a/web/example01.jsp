<%-- 
    Document   : example01
    Created on : Feb 17, 2025, 12:13:34 AM
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
        <%!int a = 9; %>
        <%
            double b;
            b=Math.sqrt(a);
        %> 
        
        Kết quả: sqrt(<%=a%>)= <span style ="color: red"><%=b%></span>
    </body>
</html>
<%-- 
    JSP giúp chúng ta xen lẫn giữa JAVA và HTML, có thể dùng cả 2
--%>