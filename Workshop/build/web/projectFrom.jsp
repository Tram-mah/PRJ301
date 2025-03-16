<%-- 
    Document   : projetFrom
    Created on : 04-03-2025, 02:08:23
    Author     : mah
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.ProjectDTO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Management</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            .page-content {
                padding: 40px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: calc(100vh - 150px); /* Account for header and footer */
            }

            .form-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
            }

            h1 {
                color: #2c3e50;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #333;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }

            .error-message {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 5px;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            button, input[type="submit"], input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                flex: 1;
                margin-right: 10px;
            }

            input[type="submit"]:hover {
                background-color: #27ae60;
            }

            input[type="reset"] {
                background-color: #e74c3c;
                color: white;
                flex: 1;
                margin-left: 10px;
            }

            input[type="reset"]:hover {
                background-color: #c0392b;
            }

            .error-container {
                background-color: #fff0f0;
                border-left: 4px solid #e74c3c;
                padding: 20px;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .error-container h1 {
                color: #e74c3c;
                margin-top: 0;
            }
            
            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }
            
            .back-link:hover {
                text-decoration: underline;
            }

            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }
                
                .button-group {
                    flex-direction: column;
                }
                
                input[type="submit"], input[type="reset"] {
                    margin: 5px 0;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="page-content">
            <% if (AuthUtils.isLoggedIn(session)) {
                    UserDTO user = AuthUtils.getUser(session);
                    if (AuthUtils.isAdmin(session)) {
            %>
            <%
                ProjectDTO ptdo = new ProjectDTO();
                try {
                    ptdo = (ProjectDTO) request.getAttribute("product");
                } catch (Exception e) {
                    ptdo = new ProjectDTO();
                }
                if (ptdo == null) {
                    ptdo = new ProjectDTO();
                }
                // get error information
                String txtProjectID_error = request.getAttribute("txtProjectID_error") + "";
                txtProjectID_error = txtProjectID_error.equals("null") ? "" : txtProjectID_error;
                String txtProjectName_error = request.getAttribute("txtProjectName_error") + "";
                txtProjectName_error = txtProjectName_error.equals("null") ? "" : txtProjectName_error;
                String txtDescription_error = request.getAttribute("txtDescription_error") + "";
                txtDescription_error = txtDescription_error.equals("null") ? "" : txtDescription_error;
                String txtStatus_error = request.getAttribute("txtStatus_error") + "";
                txtStatus_error = txtStatus_error.equals("null") ? "" : txtStatus_error;
                String txtEstimateLaunch_error = request.getAttribute("txtEstimateLaunch_error") + "";
                txtEstimateLaunch_error = txtEstimateLaunch_error.equals("null") ? "" : txtEstimateLaunch_error;
                
            %>
            <div class="form-container">
                <h1>Products Information</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="add"/>

                    <div class="form-group">
                        <label for="txtProductID">Product ID:</label>
                        <input type="number" id="txtProductID" name="txtProductID" value="<%=ptdo.getProject_id()%>"/>
                        <% if (!txtProjectID_error.isEmpty()) {%>
                        <div class="error-message"><%=txtProjectID_error%></div>
                        <% }%>
                    </div>

                    <div class="form-group">
                        <label for="txtProjectName">Project Name:</label>
                        <input type="text" id="txtProjectName" name="txtProjectName" value="<%=ptdo.getProject_name()%>"/>
                        <% if (!txtProjectName_error.isEmpty()) {%>
                        <div class="error-message"><%=txtProjectName_error%></div>
                        <% }%>
                    </div>

                    <div class="form-group">
                        <label for="txtDescription">Description:</label>
                        <input type="text" id="txtDescription" name="txtDescription" value="<%=ptdo.getDescription()%>"/>
                    </div>

                    <div class="form-group">
                        <label for="txtStatus">Status:</label>
                        <input type="text" id="txtStatus" name="txtStatus" value="<%=ptdo.getStatus()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtEstimateLaunch">Estimated Launch:</label>
                        <input type="date" id="txtEstimateLaunch" name="txtEstimateLaunch" value="<%=ptdo.getEstimated_launch()%>"/>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>
                
                <a href="MainController?action=search" class="back-link">Back to Project List</a>
            </div>
            <%} else {%>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="MainController?action=search" class="back-link">Back to Project List</a>
            </div>
            <%}
                } else {%>
            <div class="form-container error-container">
                <h1>Access Denied</h1>
                <p>Please log in to access this page.</p>
                <a href="login.jsp" class="back-link">Go to Login</a>
            </div>
            <%}%>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>