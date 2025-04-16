<%-- 
    Document   : foodList
    Created on : 30-10-2022
    Author     : hd
--%>



<%@page import="java.util.List"%>
<%@page import="prj301.pe.user.UserDAO"%>
<%@page import="prj301.pe.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food List Page</title>
    </head>
    <body>
        <!--your code here-->
        <%
            if (session.getAttribute("user") != null) {
                UserDTO a = (UserDTO) session.getAttribute("user");
                UserDAO dao = new UserDAO();
                List<UserDTO> listAll = dao.readAll();
        %>
        <h2>Welcome, <%=a.getFullName()%></h2>
        <form action="MainController" method="post" style="margin: 0;">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="logout" class="logout-btn"/>
        </form>
        <form action="MainController">
                    <input type="hidden" name="action" value="search"/>
                    <label for="searchInput">Search:</label>
                    <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter Exam title, Subject or ID..."/>
                    <input type="submit" value="Search" class="search-btn"/>
                </form>
        <table border="1px">
            <thead>
                <tr>                    
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Password</th>
                    <th>Role ID</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%

                    for (UserDTO userlist : listAll) {
                %>
            <form action="MainController" method="post">
                <tr>
                    <td>
                        <input type="text" name="userID" value="<%= userlist.getUserID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= userlist.getFullName()%>" required="" readonly=""/>
                    </td>
                    <td>
                        <input type="number" name="password" value="<%= userlist.getPassword()%>" required="" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= userlist.getRoleID()%>" required="" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="status" value="<%= userlist.getStatus()%>" required="" readonly=""/>
                    </td>
            </form>

        </tr>
        <%
            }
        %>
        <% } else { %>
        <p>You do not have permission to access this content.</p>
        <% }%>
</body>
</html>

