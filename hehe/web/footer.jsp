<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .headfooter {
        background-color: #FFD0D8;
        padding-top: 10px;
        padding-bottom: 10px;
        text-align: center;
    }

    .headfooter p{
        text-decoration: none;
        color: white;
    }

    .headfooter h5{
        text-decoration: none;
        color: white;
    }

    .footer {
        background-color: #FFFFFF;
        color: #010409;
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

    .footer-links a {
        color: #010409;
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
    <div class ="headfooter">
        <p> Giao hàng trong 1 tiếng bruh </p>
    </div>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Về chúng tôi</h3>
            <p>U u nà nà ú na, u yahaha.</p>
        </div>

        <div class="footer-section">
            <h3>Liên kết nhanh</h3>
            <ul class="footer-links">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Giỏ hàng</a></li>
                <li><a href="#">Chính sách</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p>Địa chỉ: Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Hồ Chí Minh 700000</p>
            <p>Email: toiyeufptk18@fpt.edu.vn</p>
            <p>Điện thoại: (84) 123-456-666</p>
        </div>

        <div class="footer-section">
            <h3>Theo dõi chúng tôi</h3>
            <p>Cập nhật tin tức mới nhất và khuyến mãi từ chúng tôi</p>
            <div class="social-links">
                <a href="#">📱</a>
                <a href="#">💬</a>
                <a href="#">📷</a>
            </div>
        </div>
    </div>

    <div class="copyright">
        <p>&copy; 2025 ChiikawaLand. Tất cả quyền được bảo lưu.</p>
    </div>
</footer>