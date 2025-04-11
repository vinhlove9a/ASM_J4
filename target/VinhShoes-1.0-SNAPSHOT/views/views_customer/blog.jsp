<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Male_Fashion Template" />
    <meta name="keywords" content="Male_Fashion, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thời Trang Nam | Blog</title>

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
              <li class="active"><a href="./blog.jsp">Blog</a></li>
              <li><a href="contact.jsp">Liên hệ</a></li>
              <li>
                <a href="#">Giỏ hàng</a>
                <ul class="dropdown">
                  <li><a href="shopping-cart.jsp">Chi tiết</a></li>
                  <li><a href="checkout.jsp">Thanh toán</a></li>
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
    <section class="breadcrumb-blog set-bg" data-setbg="img/breadcrumb-bg.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h2>Blog of Vinh's Choice</h2>
            <h3>Nơi chia sẻ tâm sự của chúng tôi</h3>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-1.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 16 Tháng Hai
                  2020</span
                >
                <h5>Những loại máy uốn tóc tốt nhất</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-2.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 21 Tháng Hai
                  2020</span
                >
                <h5>Nhẫn vĩnh cửu thực sự tồn tại mãi mãi</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-3.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 28 Tháng Hai
                  2020</span
                >
                <h5>Lợi ích sức khỏe của kính râm</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-4.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 16 Tháng Hai
                  2020</span
                >
                <h5>Nhắm đến cao hơn với Mastopexy</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-5.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 21 Tháng Hai
                  2020</span
                >
                <h5>Nhẫn cưới - Món quà cho cả đời</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-6.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 28 Tháng Hai
                  2020</span
                >
                <h5>Các phương pháp khác nhau để loại bỏ lông</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-7.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 16 Tháng Hai
                  2020</span
                >
                <h5>Bông tai vòng - Một phong cách từ lịch sử</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-8.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 21 Tháng Hai
                  2020</span
                >
                <h5>Phẫu thuật mắt Lasik - Bạn đã sẵn sàng chưa?</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="blog__item">
              <div
                class="blog__item__pic set-bg"
                data-setbg="img/blog/blog-9.jpg"
              ></div>
              <div class="blog__item__text">
                <span
                  ><img src="img/icon/calendar.png" alt="" /> 28 Tháng Hai
                  2020</span
                >
                <h5>Phẫu thuật mắt Lasik - Bạn đã sẵn sàng chưa?</h5>
                <a href="#">Đọc thêm</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="footer__about">
              <div class="footer__logo">
                <a
                  href="index.jsp"
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
                  Hãy là người đầu tiên biết về hàng mới về, look books, giảm
                  giá & khuyến mãi!
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
