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
    <title>Thời Trang Nam | Cửa Hàng</title>

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

<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-3">
            <div class="header__logo">
                <a
                        href="${pageContext.request.contextPath}/cua-hang/hien-thi"
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
                    <li class="active"><a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Cửa hàng</a></li>
                    <li><a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Liên hệ</a></li>
                    <li>
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
                <a href="#"><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                 alt=""/></a>
                <a href="#"
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/cart.png" alt=""/>
                    <span>0</span></a
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
                <c:if test="${not empty sessionScope.openLoginModal}">
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
                    <c:remove var="openLoginModal" scope="session"/> <!-- Xóa trạng thái sau khi hiển thị -->
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
                    <h4>Cửa hàng</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Trang chủ</a>
                        <span>Cửa hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Tìm kiếm..."/>
                            <button type="submit">
                                <span class="icon_search"></span>
                            </button>
                        </form>
                    </div>
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">Thương hiệu</a>
                                </div>
                                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__brand">
                                            <ul>
                                                <c:forEach var="thuongHieu" items="${danhSachThuongHieu}">
                                                    <li><a href="#">${thuongHieu.tenThuongHieu}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree"
                                    >Lọc giá</a
                                    >
                                </div>
                                <div
                                        id="collapseThree"
                                        class="collapse show"
                                        data-parent="#accordionExample"
                                >
                                    <div class="card-body">
                                        <div class="shop__sidebar__price">
                                            <ul>
                                                <li><a href="#">$0.00 - $50.00</a></li>
                                                <li><a href="#">$50.00 - $100.00</a></li>
                                                <li><a href="#">$100.00 - $150.00</a></li>
                                                <li><a href="#">$150.00 - $200.00</a></li>
                                                <li><a href="#">$200.00 - $250.00</a></li>
                                                <li><a href="#">250.00+</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">Kích thước</a>
                                </div>
                                <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__size">
                                            <c:forEach var="kichThuoc" items="${danhSachKichThuoc}">
                                                <label for="${kichThuoc.maKichThuoc}">
                                                        ${kichThuoc.tenKichThuoc}
                                                    <input type="radio" id="${kichThuoc.maKichThuoc}" name="kichThuoc"/>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFive">Màu sắc</a>
                                </div>
                                <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__color">
                                            <ul>
                                                <c:forEach var="mauSac" items="${danhSachMauSac}">
                                                    <li>
                                                        <a href="#" class="mau-sac-item"
                                                           style="background-color:${mauSac.maMauSac};">
                                                                ${mauSac.tenMauSac}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSix"
                                    >Thẻ</a
                                    >
                                </div>
                                <div
                                        id="collapseSix"
                                        class="collapse show"
                                        data-parent="#accordionExample"
                                >
                                    <div class="card-body">
                                        <div class="shop__sidebar__tags">
                                            <a href="#">Sản phẩm</a>
                                            <a href="#">Túi xách</a>
                                            <a href="#">Giày</a>
                                            <a href="#">Thời trang</a>
                                            <a href="#">Quần áo</a>
                                            <a href="#">Mũ</a>
                                            <a href="#">Phụ kiện</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="shop__product__option">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__left">
                                <p>Hiển thị 12 sản phẩm</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__right">
                                <p>Sắp xếp theo giá:</p>
                                <select>
                                    <option value="">Thấp đến cao</option>
                                    <option value="">$0 - $55</option>
                                    <option value="">$55 - $100</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="sanPham" items="${danhSachSanPham}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div
                                        class="product__item__pic set-bg"
                                        data-setbg="${pageContext.request.contextPath}/${sanPham.hinhAnh != null ? sanPham.hinhAnh : 'views/views_customer/img/default.jpg'}"
                                >
                                    <ul class="product__hover">
                                        <li>
                                            <a href="#"><img
                                                    src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                                    alt=""/></a>
                                        </li>
                                        <li>
                                            <a href="#"><img
                                                    src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                                    alt=""/><span>So sánh</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><img
                                                    src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                                    alt=""/></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>${sanPham.tenSanPham}</h6>
                                    <form action="${pageContext.request.contextPath}/gio-hang/them" method="post">
                                        <input type="hidden" name="productId" value="${sanPham.id}"/>
                                        <input type="hidden" name="soLuong" value="1"/>
                                        <button type="submit" class="btn btn-primary add-cart">+ Thêm vào giỏ hàng
                                        </button>
                                    </form>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>${sanPham.chiTietSanPham.donGia} VNĐ</h5>
                                    <h6>Số lượng tồn: ${sanPham.chiTietSanPham.soLuong}</h6>
                                    <!-- Hiển thị số lượng tồn kho -->
                                    <div class="product__color__select">
                                        <label for="pc-40">
                                            <input type="radio" id="pc-40"/>
                                        </label>
                                        <label class="active black" for="pc-41">
                                            <input type="radio" id="pc-41"/>
                                        </label>
                                        <label class="grey" for="pc-42">
                                            <input type="radio" id="pc-42"/>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination">
                            <c:if test="${trangHienTai > 1}">
                                <a href="${pageContext.request.contextPath}/cua-hang/hien-thi?page=${trangHienTai - 1}">&laquo;</a>
                            </c:if>
                            <c:forEach begin="1" end="${tongSoTrang}" var="i">
                                <a href="${pageContext.request.contextPath}/cua-hang/hien-thi?page=${i}"
                                   class="${i == trangHienTai ? 'active' : ''}">
                                        ${i}
                                </a>
                            </c:forEach>
                            <c:if test="${trangHienTai < tongSoTrang}">
                                <a href="${pageContext.request.contextPath}/cua-hang/hien-thi?page=${trangHienTai + 1}">&raquo;</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a
                                href="${pageContext.request.contextPath}/cua-hang/hien-thi"
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
