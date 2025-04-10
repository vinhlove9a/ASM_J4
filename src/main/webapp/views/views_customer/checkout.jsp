<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Male_Fashion Template" />
    <meta name="keywords" content="Male_Fashion, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thời Trang Nam | Thanh Toán</title>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
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
              href="index.jsp"
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
              <li><a href="index.jsp">Trang chủ</a></li>
              <li><a href="shop.jsp">Cửa hàng</a></li>
              <li><a href="blog.jsp">Blog</a></li>
              <li><a href="contact.jsp">Liên hệ</a></li>
              <li class="active">
                <a href="#">Giỏ hàng</a>
                <ul class="dropdown">
                  <li><a href="shopping-cart.jsp">Chi tiết</a></li>
                  <li><a href="./checkout.jsp">Thanh toán</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
        <div class="col-lg-3 col-md-3">
          <div class="header__nav__option">
            <a href="#" class="search-switch"
              ><img src="img/icon/search.png" alt=""
            /></a>
            <a href="#"><img src="img/icon/heart.png" alt="" /></a>
            <a href="#"
              ><img src="img/icon/cart.png" alt="" /> <span>0</span></a
            >

            <a href="index.jsp" class="btn btn-primary btn-sm">Đăng nhập</a>
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
                <a href="index.jsp">Giỏ hàng</a>
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
          <form action="#">
            <div class="row">
              <div class="col-lg-8 col-md-6">
                <h6 class="coupon__code">
                  <span class="icon_tag_alt"></span> Có mã giảm giá?
                  <a href="#">Nhấn vào đây</a> để nhập mã
                </h6>
                <h6 class="checkout__title">Chi tiết thanh toán</h6>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Họ<span>*</span></p>
                      <input type="text" />
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Tên<span>*</span></p>
                      <input type="text" />
                    </div>
                  </div>
                </div>
                <div class="checkout__input">
                  <p>Quốc gia<span>*</span></p>
                  <input type="text" />
                </div>
                <div class="checkout__input">
                  <p>Địa chỉ<span>*</span></p>
                  <input
                    type="text"
                    placeholder="Địa chỉ đường phố"
                    class="checkout__input__add"
                  />
                  <input
                    type="text"
                    placeholder="Căn hộ, phòng, đơn vị, v.v. (tùy chọn)"
                  />
                </div>
                <div class="checkout__input">
                  <p>Thành phố<span>*</span></p>
                  <input type="text" />
                </div>
                <div class="checkout__input">
                  <p>Quận/Huyện<span>*</span></p>
                  <input type="text" />
                </div>
                <div class="checkout__input">
                  <p>Mã bưu điện / ZIP<span>*</span></p>
                  <input type="text" />
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Điện thoại<span>*</span></p>
                      <input type="text" />
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Email<span>*</span></p>
                      <input type="text" />
                    </div>
                  </div>
                </div>
                <div class="checkout__input__checkbox">
                  <label for="acc">
                    Tạo tài khoản?
                    <input type="checkbox" id="acc" />
                    <span class="checkmark"></span>
                  </label>
                  <p>
                    Tạo tài khoản bằng cách nhập thông tin bên dưới. Nếu bạn là
                    khách hàng cũ, vui lòng đăng nhập ở đầu trang
                  </p>
                </div>
                <div class="checkout__input">
                  <p>Mật khẩu tài khoản<span>*</span></p>
                  <input type="text" />
                </div>
                <div class="checkout__input__checkbox">
                  <label for="diff-acc">
                    Ghi chú về đơn hàng của bạn, ví dụ, ghi chú đặc biệt cho
                    việc giao hàng
                    <input type="checkbox" id="diff-acc" />
                    <span class="checkmark"></span>
                  </label>
                </div>
                <div class="checkout__input">
                  <p>Ghi chú đơn hàng<span>*</span></p>
                  <input
                    type="text"
                    placeholder="Ghi chú về đơn hàng của bạn, ví dụ, ghi chú đặc biệt cho việc giao hàng."
                  />
                </div>
              </div>
              <div class="col-lg-4 col-md-6">
                <div class="checkout__order">
                  <h4 class="order__title">Đơn hàng của bạn</h4>
                  <div class="checkout__order__products">
                    Sản phẩm <span>Tổng</span>
                  </div>
                  <ul class="checkout__total__products">
                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                    <li>02. German chocolate <span>$ 170.0</span></li>
                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                  </ul>
                  <ul class="checkout__total__all">
                    <li>Tổng phụ <span>$750.99</span></li>
                    <li>Tổng cộng <span>$750.99</span></li>
                  </ul>
                  <div class="checkout__input__checkbox">
                    <label for="acc-or">
                      Tạo tài khoản?
                      <input type="checkbox" id="acc-or" />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adip elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  </p>
                  <div class="checkout__input__checkbox">
                    <label for="payment">
                      Thanh toán bằng séc
                      <input type="checkbox" id="payment" />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <div class="checkout__input__checkbox">
                    <label for="paypal">
                      Paypal
                      <input type="checkbox" id="paypal" />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <button type="submit" class="site-btn">ĐẶT HÀNG</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    <!-- Checkout Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="footer__about">
              <div class="footer__logo">
                <a href="#"><img src="img/footer-logo.png" alt="" /></a>
              </div>
              <p>
                Khách hàng là trung tâm của mô hình kinh doanh độc đáo của chúng
                tôi, bao gồm thiết kế.
              </p>
              <a href="#"><img src="img/payment.png" alt="" /></a>
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
                  Hãy là người đầu tiên biết về hàng mới về, lookbook, giảm giá
                  & khuyến mãi!
                </p>
                <form action="#">
                  <input type="text" placeholder="Email của bạn" />
                  <button type="submit">
                    <span class="icon_mail_alt"></span>
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="footer__copyright__text">
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              <p>
                Bản quyền ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                2020 Tất cả các quyền được bảo lưu | Mẫu này được tạo ra với
                <i class="fa fa-heart-o" aria-hidden="true"></i> bởi
                <a href="https://colorlib.com" target="_blank">Colorlib</a>
              </p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
