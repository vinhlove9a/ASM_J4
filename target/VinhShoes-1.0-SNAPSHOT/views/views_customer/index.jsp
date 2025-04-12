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
    <title>Thời Trang Nam | Mẫu</title>

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
                    <li class="active"><a href="${pageContext.request.contextPath}/trang-chu/hien-thi">Trang chủ</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/cua-hang/hien-thi">Cửa hàng</a></li>
                    <li><a href="${pageContext.request.contextPath}/trang-chu/hien-thi">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/trang-chu/hien-thi">Liên hệ</a></li>
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
                <a href="#"><${pageContext.request.contextPath}/views/views_customer/img src="img/icon/heart.png"
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

<!-- Hero Section Begin -->
<section class="hero">
    <div class="hero__slider owl-carousel">
        <div class="hero__items set-bg"
             data-setbg="${pageContext.request.contextPath}/views/views_customer/img/hero/hero-3.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6>Bộ sưu tập</h6>
                            <h2>Bộ sưu tập Thu</h2>
                            <p>Beautiful.</p>
                            <a href="${pageContext.request.contextPath}/cua-hang/hien-thi" class="primary-btn"
                            >Mua ngay <span class="arrow_right"></span
                            ></a>
                            <div class="hero__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero__items set-bg"
             data-setbg="${pageContext.request.contextPath}/views/views_customer/img/hero/hero-4.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6>Bộ sưu tập</h6>
                            <h2>Bộ sưu tập Đông</h2>
                            <p>Nice.</p>
                            <a href="${pageContext.request.contextPath}/cua-hang/hien-thi" class="primary-btn"
                            >Mua ngay <span class="arrow_right"></span
                            ></a>
                            <div class="hero__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<div
        style="text-align: center; margin: 30px 0; animation: fadeIn 2s infinite"
>
    <p
            style="
          font-size: 50px;
          font-weight: bold;
          color: #000;
          text-shadow: none;
          font-family: 'Nunito Sans', sans-serif;
        "
    >
        Sản phẩm của chúng tôi
    </p>
    <p
            style="
          font-size: 20px;
          color: #000;
          font-style: italic;
          margin-top: 30px;
        "
    >
        Khám phá những sản phẩm tuyệt vời nhất dành cho bạn
    </p>
</div>

<style>
    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateY(20px);
        }

        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<!-- Banner Section Begin -->

<!-- Banner Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">Bán chạy nhất</li>
                    <li data-filter=".new-arrivals">Hàng mới về</li>
                    <li data-filter=".hot-sales">Bán chạy</li>
                </ul>
            </div>
        </div>
        <div class="row product__filter">
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-1.jpg"
                    >
                        <span class="label">Mới</span>
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Áo khoác Piqué Biker</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$67.24</h5>
                        <div class="product__color__select">
                            <label for="pc-1">
                                <input type="radio" id="pc-1"/>
                            </label>
                            <label class="active black" for="pc-2">
                                <input type="radio" id="pc-2"/>
                            </label>
                            <label class="grey" for="pc-3">
                                <input type="radio" id="pc-3"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-2.jpg"
                    >
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Áo khoác Piqué Biker</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$67.24</h5>
                        <div class="product__color__select">
                            <label for="pc-4">
                                <input type="radio" id="pc-4"/>
                            </label>
                            <label class="active black" for="pc-5">
                                <input type="radio" id="pc-5"/>
                            </label>
                            <label class="grey" for="pc-6">
                                <input type="radio" id="pc-6"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals"
            >
                <div class="product__item sale">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-3.jpg"
                    >
                        <span class="label">Giảm giá</span>
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Túi ngực nhiều ngăn</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$43.48</h5>
                        <div class="product__color__select">
                            <label for="pc-7">
                                <input type="radio" id="pc-7"/>
                            </label>
                            <label class="active black" for="pc-8">
                                <input type="radio" id="pc-8"/>
                            </label>
                            <label class="grey" for="pc-9">
                                <input type="radio" id="pc-9"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-4.jpg"
                    >
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Mũ có kết cấu chéo</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$60.9</h5>
                        <div class="product__color__select">
                            <label for="pc-10">
                                <input type="radio" id="pc-10"/>
                            </label>
                            <label class="active black" for="pc-11">
                                <input type="radio" id="pc-11"/>
                            </label>
                            <label class="grey" for="pc-12">
                                <input type="radio" id="pc-12"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-5.jpg"
                    >
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Balo da</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$31.37</h5>
                        <div class="product__color__select">
                            <label for="pc-13">
                                <input type="radio" id="pc-13"/>
                            </label>
                            <label class="active black" for="pc-14">
                                <input type="radio" id="pc-14"/>
                            </label>
                            <label class="grey" for="pc-15">
                                <input type="radio" id="pc-15"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
            >
                <div class="product__item sale">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-6.jpg"
                    >
                        <span class="label">Giảm giá</span>
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Giày bốt cổ chân</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$98.49</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16"/>
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17"/>
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-7.jpg"
                    >
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Áo thun túi tương phản</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$49.66</h5>
                        <div class="product__color__select">
                            <label for="pc-19">
                                <input type="radio" id="pc-19"/>
                            </label>
                            <label class="active black" for="pc-20">
                                <input type="radio" id="pc-20"/>
                            </label>
                            <label class="grey" for="pc-21">
                                <input type="radio" id="pc-21"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div
                    class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales"
            >
                <div class="product__item">
                    <div
                            class="product__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/product/product-8.jpg"
                    >
                        <ul class="product__hover">
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/heart.png"
                                        alt=""/></a>
                            </li>
                            <li>
                                <a href="#"
                                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/compare.png"
                                      alt=""/>
                                    <span>So sánh</span></a
                                >
                            </li>
                            <li>
                                <a href="#"><img
                                        src="${pageContext.request.contextPath}/views/views_customer/img/icon/search.png"
                                        alt=""/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>Khăn quàng cổ cơ bản</h6>
                        <a href="#" class="add-cart">+ Thêm vào giỏ hàng</a>
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>$26.28</h5>
                        <div class="product__color__select">
                            <label for="pc-22">
                                <input type="radio" id="pc-22"/>
                            </label>
                            <label class="active black" for="pc-23">
                                <input type="radio" id="pc-23"/>
                            </label>
                            <label class="grey" for="pc-24">
                                <input type="radio" id="pc-24"/>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Categories Section Begin -->
<section class="categories spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="categories__text">
                    <h2>
                        Quần áo nóng <br/>
                        <span>Bộ sưu tập giày</span> <br/>
                        Phụ kiện
                    </h2>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="categories__hot__deal">
                    <img src="${pageContext.request.contextPath}/views/views_customer/img/product-sale.png" alt=""/>
                    <div class="hot__deal__sticker">
                        <span>Giảm giá</span>
                        <h5>$29.99</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-1">
                <div class="categories__deal__countdown">
                    <span>Ưu đãi trong tuần</span>
                    <h2>Túi ngực nhiều ngăn màu đen</h2>
                    <div class="categories__deal__countdown__timer" id="countdown">
                        <div class="cd-item">
                            <span>3</span>
                            <p>Ngày</p>
                        </div>
                        <div class="cd-item">
                            <span>1</span>
                            <p>Giờ</p>
                        </div>
                        <div class="cd-item">
                            <span>50</span>
                            <p>Phút</p>
                        </div>
                        <div class="cd-item">
                            <span>18</span>
                            <p>Giây</p>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/cua-hang/hien-thi" class="primary-btn">Mua ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Instagram Section Begin -->
<section class="instagram spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="instagram__pic">
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-1.jpg"
                    ></div>
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-2.jpg"
                    ></div>
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-3.jpg"
                    ></div>
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-4.jpg"
                    ></div>
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-5.jpg"
                    ></div>
                    <div
                            class="instagram__pic__item set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/instagram/instagram-6.jpg"
                    ></div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="instagram__text">
                    <h2>Instagram</h2>
                    <p>
                        Khám phá phong cách thời trang nam hiện đại và đẳng cấp, cập
                        nhật xu hướng mới nhất mỗi ngày.
                    </p>
                    <h3>#tranxuanvjnh</h3>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Instagram Section End -->

<!-- Latest Blog Section Begin -->
<section class="latest spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>Tin tức mới nhất</span>
                    <h2>Xu hướng thời trang mới</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog__item">
                    <div
                            class="blog__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/blog/blog-1.jpg"
                    ></div>
                    <div class="blog__item__text">
                <span
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/calendar.png" alt=""/> 16 tháng 2,
                  2020</span
                >
                        <h5>Những chiếc máy uốn tóc nào là tốt nhất</h5>
                        <a href="#">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog__item">
                    <div
                            class="blog__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/blog/blog-2.jpg"
                    ></div>
                    <div class="blog__item__text">
                <span
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/calendar.png" alt=""/> 21 tháng 2,
                  2020</span
                >
                        <h5>Những chiếc nhẫn vĩnh cửu thực sự tồn tại mãi mãi</h5>
                        <a href="#">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog__item">
                    <div
                            class="blog__item__pic set-bg"
                            data-setbg="${pageContext.request.contextPath}/views/views_customer/img/blog/blog-3.jpg"
                    ></div>
                    <div class="blog__item__text">
                <span
                ><img src="${pageContext.request.contextPath}/views/views_customer/img/icon/calendar.png" alt=""/> 28 tháng 2,
                  2020</span
                >
                        <h5>Lợi ích sức khỏe của kính râm</h5>
                        <a href="#">Đọc thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Blog Section End -->

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
