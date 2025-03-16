
<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

/* Header */
.header {
    background: linear-gradient(135deg, #0f172a, #1e293b);
    padding: 1.2rem 0;
    width: 100%;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

/* Container */
.container {
    max-width: 1200px;
    margin: auto;
    padding: 0 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Logo */
.logo {
    color: #facc15;
    font-size: 1.8rem;
    font-weight: bold;
    text-decoration: none;
    transition: transform 0.3s ease;
}

.logo:hover {
    transform: scale(1.1);
}

/* Navigation */
.menu {
    display: flex;
    list-style: none;
    gap: 2rem;
}

.menu-item a {
    color: #e2e8f0;
    text-decoration: none;
    font-size: 1rem;
    font-weight: 500;
    transition: color 0.3s ease, transform 0.2s ease;
    position: relative;
}

.menu-item a::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -5px;
    width: 0;
    height: 3px;
    background: #facc15;
    transition: width 0.3s ease-in-out;
}

.menu-item a:hover {
    color: #facc15;
    transform: scale(1.05);
}

.menu-item a:hover::after {
    width: 100%;
}

/* Search Bar */
.search-bar {
    display: flex;
    align-items: center;
    background: #1e293b;
    border-radius: 30px;
    padding: 0.6rem 1rem;
    box-shadow: 0 2px 10px rgba(255, 255, 255, 0.1);
    transition: 0.3s ease-in-out;
}

.search-bar:hover {
    box-shadow: 0 2px 15px rgba(255, 255, 255, 0.2);
}

.search-input {
    border: none;
    background: none;
    color: #e2e8f0;
    outline: none;
    width: 200px;
    font-size: 0.9rem;
}

.search-input::placeholder {
    color: #94a3b8;
}

.search-button {
    background: none;
    border: none;
    cursor: pointer;
    color: #facc15;
    font-size: 1.2rem;
    transition: 0.3s;
}

.search-button:hover {
    color: #fbbf24;
}

/* User Section */
.user-section {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.welcome-text {
    color: #e2e8f0;
    font-size: 1rem;
}

.user-name {
    color: #facc15;
    font-weight: bold;
    font-size: 1.1rem;
}

/* Logout Button */
.logout-btn {
    background: linear-gradient(135deg, #e11d48, #be123c);
    color: white;
    border: none;
    border-radius: 8px;
    padding: 0.6rem 1.2rem;
    font-size: 0.9rem;
    font-weight: 500;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

.logout-btn:hover {
    background: #e11d48;
    transform: translateY(-3px);
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
        gap: 1rem;
    }

    .menu {
        gap: 1.5rem;
    }

    .search-input {
        width: 150px;
    }
}

</style>

<header class="header">
    <%

    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">PROJECT</a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Home</a></li>
                <li class="menu-item"><a href="#">Project</a></li>
                <li class="menu-item"><a href="#">Manager</a></li>
                <li class="menu-item"><a href="#">Contact</a></li>
            </ul>
            <div class="right-section">
                <div class="search-bar">
                    <input type="text" class="search-input" placeholder="Tìm kiếm...">
                    <button class="search-button">🔍</button>
                </div>
                <%  if (AuthUtils.isLoggedIn(session)) {
                        UserDTO userHeader = AuthUtils.getUser(session);

                %>
                <div class="user-section">
                    <span class="welcome-text">Welcome, <span class="user-name"><%=userHeader.getName()%></span>!</span>
                    <form action="MainController" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="logout"/>
                        <input type="submit" value="Đăng xuất" class="logout-btn"/>
                    </form>
                </div>
                <%}%>
            </div>
        </nav>
    </div>
</header>
