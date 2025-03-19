<%-- 
    Document   : login
    Created on : Mar 11, 2025, 12:42:03 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <style>
            /* Container chính */
            .login-container {
                min-height: 500px;
                display: flex;
                justify-content: center;
                align-items: center;
                background: #f5f5f5;
                padding: 20px;
            }

            /* Form đăng nhập */
            .login-form {
                background: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

            /* Tiêu đề */
            .form-title {
                text-align: center;
                margin-bottom: 20px;
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }

            /* Ô nhập */
            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                font-weight: 500;
                color: #333;
                display: block;
                margin-bottom: 5px;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                transition: 0.3s;
            }

            .form-group input:focus {
                border-color: #4CAF50;
                box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
                outline: none;
            }

            /* Nút đăng nhập */
            .submit-btn {
                background: #4CAF50;
                color: #fff;
                padding: 12px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                transition: 0.3s;
            }

            .submit-btn:hover {
                background: #45a049;
            }

            /* Responsive */
            @media (max-width: 480px) {
                .login-form {
                    padding: 20px;
                }

                .submit-btn {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="login-container">
            <div class="login-form">
                <h2 class="form-title">Đăng nhập</h2>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="login" />

                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="Username" name="txtUsername" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="Password" name="txtPassword" required />
                    </div>

                    <button type="submit" class="submit-btn">Đăng nhập</button>

                    <%
                        String message = request.getAttribute("message") + "";
                    %>
                    <%=message.equals("null") ? "" : message%>
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
