
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color: #2c3e50;
        color: #fff;
        padding: 3rem 0;
        margin-top: 2rem;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 2rem;
    }

    .footer-section h3 {
        font-size: 1.2rem;
        margin-bottom: 1rem;
        color: #3498db;
    }

    .footer-section p {
        margin-bottom: 0.5rem;
        font-size: 0.9rem;
        line-height: 1.5;
    }

    .footer-links {
        list-style: none;
    }

    .footer-links li {
        margin-bottom: 0.5rem;
    }

    .footer-links a {
        color: #fff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-links a:hover {
        color: #3498db;
    }

    .social-links {
        display: flex;
        gap: 1rem;
        margin-top: 1rem;
    }

    .social-links a {
        color: #fff;
        text-decoration: none;
        font-size: 1.5rem;
    }

    .copyright {
        text-align: center;
        padding-top: 2rem;
        margin-top: 2rem;
        border-top: 1px solid #34495e;
        font-size: 0.9rem;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>About us</h3>
            <p>The exam system is an important tool to help assess the capacity and preparation of each individual, and create a fair foundation for candidates to show their abilities transparently and accurately.</p>
        </div>
        
        <div class="footer-section">
            <h3>Connect</h3>
            <ul class="footer-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Categories</a></li>
                <li><a href="#">Exam</a></li>
                <li><a href="#">Score</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Contact</h3>
            <p>Adress: 123 Street ABC, District XYZ</p>
            <p>Email: contact@shoponline.com</p>
            <p>Phone: (84) 123-456-789</p>
        </div>
        
        <div class="footer-section">
            <h3>Follow the exam</h3>
            <p>Update the latest news from the exam</p>
            <div class="social-links">
                <a href="#">📱</a>
                <a href="#">💬</a>
                <a href="#">📷</a>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>&copy; 2025 . All rights are reserved.</p>
    </div>
</footer>
