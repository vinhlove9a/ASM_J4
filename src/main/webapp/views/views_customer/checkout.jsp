<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Male_Fashion Template"/>
    <meta name="keywords" content="Male_Fashion, unica, creative, html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Thời Trang Nam | Giỏ Hàng</title>

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/bootstrap.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/font-awesome.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/elegant-icons.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/magnific-popup.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/nice-select.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/owl.carousel.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/slicknav.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/views_customer/css/style.css"
          type="text/css"/>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-3">
            <div class="header__logo">
                <a
                        href="${pageContext.request.contextPath}/trang-chu/hien-thi"
                        style="
                font-family: 'Nunito Sans', sans-serif;
                font-size: 24px;
                font-weight: 900;
                color: #333;
                text-decoration: none;
                animation: blink 1s infinite;
              "
                >
                    <span style="color: #ff6f61">Vinh's</span> Choice
                </a>
            </div>

            <style>
                @keyframes blink {
                    0%,
                    100% {
                        opacity: 1;
                    }

                    50% {
                        opacity: 0;
                    }
                }
            </style>
        </div>
        <div class="col-lg-6 col-md-6">
            <nav class="header__menu mobile-menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/trang-chu/hien-thi">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Cửa hàng</a></li>
                    <li><a href="${pageContext.request.contextPath}/thanh-toan/hien-thi">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/thanh-toan/hien-thi">Liên hệ</a></li>
                    <li class="active">
                        <a href="#">Giỏ hàng</a>
                        <ul class="dropdown">
                            <li><a href="${pageContext.request.contextPath}/gio-hang/hien-thi">Chi tiết</a></li>
                            <li><a href="${pageContext.request.contextPath}/thanh-toan/hien-thi">Thanh toán</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-lg-3 col-md-3">
            <div class="header__nav__option">
                <a href="#" class="search-switch"
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png" alt=""
                /></a>
                <a href="#"><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png" alt=""/></a>
                <a href="#"
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/cart.png" alt=""/> <span>0</span></a
                >

                <!-- Modal -->
                <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Đăng nhập / Đăng ký</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Đóng"></button>
                            </div>
                            <div class="modal-body" id="modalContent">
                                <!-- Nội dung được tải từ server -->
                                <div class="text-center py-3">
                                    <div class="spinner-border text-primary" role="status">
                                        <span class="visually-hidden">Đang tải...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nút mở modal -->
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <!-- Đã đăng nhập - hiển thị menu -->
                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="userMenuButton"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    ${sessionScope.user.tenKhachHang}
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="userMenuButton">
                                <li><a class="dropdown-item" href="#">Thông tin tài khoản</a></li>
                                <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/LoginControl?action=logout">Đăng
                                    xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Chưa đăng nhập - hiển thị nút đăng nhập -->
                        <a href="#" class="btn btn-primary btn-sm" id="loginBtn">Đăng nhập</a>
                    </c:otherwise>
                </c:choose>

                <!-- Thông báo -->
                <c:if test="${not empty sessionScope.success}">
                    <script>alert("${sessionScope.success}");</script>
                    <c:remove var="success" scope="session"/>
                </c:if>
                <c:if test="${not empty sessionScope.error}">
                    <script>alert("${sessionScope.error}");</script>
                    <c:remove var="error" scope="session"/>
                </c:if>

                <!-- Nếu cần mở modal -->
                <c:if test="${sessionScope.openLoginModal == true}">
                    <script>
                        window.addEventListener('DOMContentLoaded', () => {
                            fetch('${pageContext.request.contextPath}/LoginControl?action=modal')
                                .then(res => res.text())
                                .then(html => {
                                    document.getElementById('modalContent').innerHTML = html;
                                    new bootstrap.Modal(document.getElementById('loginModal')).show();
                                })
                                .catch(err => console.error('Lỗi khi tải modal:', err));
                        });
                    </script>
                    <c:remove var="openLoginModal" scope="session"/>
                </c:if>

                <script>
                    // Nút mở modal
                    document.getElementById('loginBtn').addEventListener('click', function (e) {
                        e.preventDefault();
                        document.getElementById('modalContent').innerHTML = `
            <div class="text-center py-3">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Đang tải...</span>
                </div>
            </div>
        `;

                        fetch('${pageContext.request.contextPath}/LoginControl?action=modal')
                            .then(res => res.text())
                            .then(html => {
                                document.getElementById('modalContent').innerHTML = html;
                                new bootstrap.Modal(document.getElementById('loginModal')).show();

                                // Kích hoạt tab mặc định sau khi tải
                                const loginTab = new bootstrap.Tab(document.getElementById('login-tab'));
                                loginTab.show();
                            })
                            .catch(err => {
                                console.error('Lỗi khi tải modal:', err);
                                document.getElementById('modalContent').innerHTML = '<div class="alert alert-danger">Không thể tải form đăng nhập</div>';
                            });
                    });
                </script>

            </div>
        </div>
    </div>
    <div class="canvas__open"><i class="fa fa-bars"></i></div>
</div>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Thanh toán</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/trang-chu/hien-thi">Giỏ hàng</a>
                        <span>Thanh toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <form action="${pageContext.request.contextPath}/thanh-toan/hoan-tat" method="post">
                <div class="row">
                    <!-- Thông tin khách hàng -->
                    <div class="col-lg-8 col-md-6">
                        <h6 class="checkout__title">Thông tin khách hàng</h6>
                        <div class="checkout__input">
                            <p>Mã khách hàng</p>
                            <input type="text" name="maKhachHang" id="maKhachHang" placeholder="Hệ thống tạo tự động" readonly />
                        </div>
                        <div class="checkout__input">
                            <p>Họ và tên</p>
                            <input type="text" name="hoKhachHang" id="hoKhachHang" placeholder="Nhập họ và tên" required />
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ</p>
                            <input type="text" name="diaChi" id="diaChi" placeholder="Nhập địa chỉ" required />
                        </div>
                        <div class="checkout__input">
                            <p>Số điện thoại</p>
                            <input type="text" name="soDienThoai" id="soDienThoai" placeholder="Nhập số điện thoại" required />
                        </div>
                        <div class="checkout__input">
                            <p>Phương thức thanh toán</p>
                            <select name="phuongThucThanhToan" id="phuongThucThanhToan" onchange="handlePaymentMethod(this.value)" required>
                                <option value="COD">Thanh toán khi nhận hàng</option>
                                <option value="Paypal">Thanh toán qua Paypal</option>
                            </select>
                        </div>
                    </div>

                    <!-- Thông tin đơn hàng -->
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4 class="order__title">Đơn hàng</h4>
                            <ul class="checkout__total__products">
                                <c:forEach var="item" items="${cartItems}">
                                    <li>${item.sanPham.tenSanPham} x ${item.soLuong} <span>${item.soLuong * item.sanPham.chiTietSanPham.donGia} VNĐ</span></li>
                                </c:forEach>
                            </ul>
                            <ul class="checkout__total__all">
                                <li>Tổng tiền: <span>${tongTien} VNĐ</span></li>
                            </ul>
                            <button type="submit" class="site-btn">XÁC NHẬN THANH TOÁN</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    // Hàm xử lý thay đổi phương thức thanh toán
    function handlePaymentMethod(method) {
        const hoKhachHang = document.getElementById('hoKhachHang');
        const diaChi = document.getElementById('diaChi');
        const soDienThoai = document.getElementById('soDienThoai');

        if (method === 'Paypal') {
            // Điền giá trị mặc định cho các trường
            hoKhachHang.value = 'Mặc định';
            diaChi.value = 'Mặc định';
            soDienThoai.value = '0000000000';

            // Các trường không bắt buộc nếu chọn Paypal
            hoKhachHang.required = false;
            diaChi.required = false;
            soDienThoai.required = false;
        } else {
            // Xóa giá trị mặc định khi chọn Thanh toán khi nhận hàng (COD)
            hoKhachHang.value = '';
            diaChi.value = '';
            soDienThoai.value = '';

            // Bật yêu cầu nhập dữ liệu đầy đủ
            hoKhachHang.required = true;
            diaChi.required = true;
            soDienThoai.required = true;
        }
    }

    // Đặt trạng thái mặc định khi tải trang
    document.addEventListener('DOMContentLoaded', () => {
        const phuongThucThanhToan = document.getElementById('phuongThucThanhToan');
        handlePaymentMethod(phuongThucThanhToan.value); // Kiểm tra giá trị phương thức thanh toán mặc định
    });
</script>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a
                                href="${pageContext.request.contextPath}/trang-chu/hien-thi"
                                style="
                    font-family: 'Nunito Sans', sans-serif;
                    font-size: 24px;
                    font-weight: 900;
                    color: #333;
                    text-decoration: none;
                  "
                        >
                            <span style="color: #ff6f61">Vinh's</span> Choice
                        </a>
                    </div>
                    <p>
                        Khách hàng là trung tâm của mô hình kinh doanh độc đáo của chúng
                        tôi, bao gồm thiết kế.
                    </p>
                    <a href="#"><img src="${pageContext.request.contextPath}/views/views_customer/img/payment.png"
                                     alt=""/></a>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Mua sắm</h6>
                    <ul>
                        <li><a href="#">Cửa hàng quần áo</a></li>
                        <li><a href="#">Giày xu hướng</a></li>
                        <li><a href="#">Phụ kiện</a></li>
                        <li><a href="#">Giảm giá</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Mua sắm</h6>
                    <ul>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">Phương thức thanh toán</a></li>
                        <li><a href="#">Giao hàng</a></li>
                        <li><a href="#">Đổi trả & Hoàn tiền</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>Bản tin</h6>
                    <div class="footer__newslatter">
                        <p>
                            Hãy là người đầu tiên biết về hàng mới về, look books, giảm
                            giá & khuyến mãi!
                        </p>
                        <form action="#">
                            <input type="text" placeholder="Email của bạn"/>
                            <button type="submit">
                                <span class="icon_mail_alt"></span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input
                    type="text"
                    id="search-input"
                    placeholder="Tìm kiếm tại đây....."
            />
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/views/views_customer/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
