<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Male_Fashion Template" />
    <meta name="keywords" content="Male_Fashion, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thời Trang Nam | Cửa Hàng</title>

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

    <!-- Offcanvas Menu End -->

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
              <li class="active"><a href="./shop.jsp">Cửa hàng</a></li>
              <li><a href="blog.jsp">Blog</a></li>
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
    <section class="breadcrumb-option">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb__text">
              <h4>Cửa hàng</h4>
              <div class="breadcrumb__links">
                <a href="index.jsp">Trang chủ</a>
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
                  <input type="text" placeholder="Tìm kiếm..." />
                  <button type="submit">
                    <span class="icon_search"></span>
                  </button>
                </form>
              </div>
              <div class="shop__sidebar__accordion">
                <div class="accordion" id="accordionExample">
                  <div class="card">
                    <div class="card-heading">
                      <a data-toggle="collapse" data-target="#collapseOne"
                        >Danh mục</a
                      >
                    </div>
                    <div
                      id="collapseOne"
                      class="collapse show"
                      data-parent="#accordionExample"
                    >
                      <div class="card-body">
                        <div class="shop__sidebar__categories">
                          <ul class="nice-scroll">
                            <li><a href="#">Nam (20)</a></li>
                            <li><a href="#">Nữ (20)</a></li>
                            <li><a href="#">Túi xách (20)</a></li>
                            <li><a href="#">Quần áo (20)</a></li>
                            <li><a href="#">Giày (20)</a></li>
                            <li><a href="#">Phụ kiện (20)</a></li>
                            <li><a href="#">Trẻ em (20)</a></li>
                            <li><a href="#">Trẻ em (20)</a></li>
                            <li><a href="#">Trẻ em (20)</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-heading">
                      <a data-toggle="collapse" data-target="#collapseTwo"
                        >Thương hiệu</a
                      >
                    </div>
                    <div
                      id="collapseTwo"
                      class="collapse show"
                      data-parent="#accordionExample"
                    >
                      <div class="card-body">
                        <div class="shop__sidebar__brand">
                          <ul>
                            <li><a href="#">Louis Vuitton</a></li>
                            <li><a href="#">Chanel</a></li>
                            <li><a href="#">Hermes</a></li>
                            <li><a href="#">Gucci</a></li>
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
                      <a data-toggle="collapse" data-target="#collapseFour"
                        >Kích thước</a
                      >
                    </div>
                    <div
                      id="collapseFour"
                      class="collapse show"
                      data-parent="#accordionExample"
                    >
                      <div class="card-body">
                        <div class="shop__sidebar__size">
                          <label for="xs"
                            >xs
                            <input type="radio" id="xs" />
                          </label>
                          <label for="sm"
                            >s
                            <input type="radio" id="sm" />
                          </label>
                          <label for="md"
                            >m
                            <input type="radio" id="md" />
                          </label>
                          <label for="xl"
                            >xl
                            <input type="radio" id="xl" />
                          </label>
                          <label for="2xl"
                            >2xl
                            <input type="radio" id="2xl" />
                          </label>
                          <label for="xxl"
                            >xxl
                            <input type="radio" id="xxl" />
                          </label>
                          <label for="3xl"
                            >3xl
                            <input type="radio" id="3xl" />
                          </label>
                          <label for="4xl"
                            >4xl
                            <input type="radio" id="4xl" />
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-heading">
                      <a data-toggle="collapse" data-target="#collapseFive"
                        >Màu sắc</a
                      >
                    </div>
                    <div
                      id="collapseFive"
                      class="collapse show"
                      data-parent="#accordionExample"
                    >
                      <div class="card-body">
                        <div class="shop__sidebar__color">
                          <label class="c-1" for="sp-1">
                            <input type="radio" id="sp-1" />
                          </label>
                          <label class="c-2" for="sp-2">
                            <input type="radio" id="sp-2" />
                          </label>
                          <label class="c-3" for="sp-3">
                            <input type="radio" id="sp-3" />
                          </label>
                          <label class="c-4" for="sp-4">
                            <input type="radio" id="sp-4" />
                          </label>
                          <label class="c-5" for="sp-5">
                            <input type="radio" id="sp-5" />
                          </label>
                          <label class="c-6" for="sp-6">
                            <input type="radio" id="sp-6" />
                          </label>
                          <label class="c-7" for="sp-7">
                            <input type="radio" id="sp-7" />
                          </label>
                          <label class="c-8" for="sp-8">
                            <input type="radio" id="sp-8" />
                          </label>
                          <label class="c-9" for="sp-9">
                            <input type="radio" id="sp-9" />
                          </label>
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
                    <p>Hiển thị 1–12 của 126 kết quả</p>
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
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-2.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                        <input type="radio" id="pc-4" />
                      </label>
                      <label class="active black" for="pc-5">
                        <input type="radio" id="pc-5" />
                      </label>
                      <label class="grey" for="pc-6">
                        <input type="radio" id="pc-6" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item sale">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-3.jpg"
                  >
                    <span class="label">Giảm giá</span>
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                        <input type="radio" id="pc-7" />
                      </label>
                      <label class="active black" for="pc-8">
                        <input type="radio" id="pc-8" />
                      </label>
                      <label class="grey" for="pc-9">
                        <input type="radio" id="pc-9" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-4.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
                      </li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Mũ lưỡi trai chéo</h6>
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
                        <input type="radio" id="pc-10" />
                      </label>
                      <label class="active black" for="pc-11">
                        <input type="radio" id="pc-11" />
                      </label>
                      <label class="grey" for="pc-12">
                        <input type="radio" id="pc-12" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item sale">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-6.jpg"
                  >
                    <span class="label">Giảm giá</span>
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                        <input type="radio" id="pc-16" />
                      </label>
                      <label class="active black" for="pc-17">
                        <input type="radio" id="pc-17" />
                      </label>
                      <label class="grey" for="pc-18">
                        <input type="radio" id="pc-18" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-7.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                        <input type="radio" id="pc-19" />
                      </label>
                      <label class="active black" for="pc-20">
                        <input type="radio" id="pc-20" />
                      </label>
                      <label class="grey" for="pc-21">
                        <input type="radio" id="pc-21" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-8.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                        <input type="radio" id="pc-22" />
                      </label>
                      <label class="active black" for="pc-23">
                        <input type="radio" id="pc-23" />
                      </label>
                      <label class="grey" for="pc-24">
                        <input type="radio" id="pc-24" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-9.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                      <label for="pc-25">
                        <input type="radio" id="pc-25" />
                      </label>
                      <label class="active black" for="pc-26">
                        <input type="radio" id="pc-26" />
                      </label>
                      <label class="grey" for="pc-27">
                        <input type="radio" id="pc-27" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item sale">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-10.jpg"
                  >
                    <span class="label">Giảm giá</span>
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                      <label for="pc-28">
                        <input type="radio" id="pc-28" />
                      </label>
                      <label class="active black" for="pc-29">
                        <input type="radio" id="pc-29" />
                      </label>
                      <label class="grey" for="pc-30">
                        <input type="radio" id="pc-30" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-11.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
                      </li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Mũ lưỡi trai chéo</h6>
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
                      <label for="pc-31">
                        <input type="radio" id="pc-31" />
                      </label>
                      <label class="active black" for="pc-32">
                        <input type="radio" id="pc-32" />
                      </label>
                      <label class="grey" for="pc-33">
                        <input type="radio" id="pc-33" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item sale">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-12.jpg"
                  >
                    <span class="label">Giảm giá</span>
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                      <label for="pc-34">
                        <input type="radio" id="pc-34" />
                      </label>
                      <label class="active black" for="pc-35">
                        <input type="radio" id="pc-35" />
                      </label>
                      <label class="grey" for="pc-36">
                        <input type="radio" id="pc-36" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-13.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                      <label for="pc-37">
                        <input type="radio" id="pc-37" />
                      </label>
                      <label class="active black" for="pc-38">
                        <input type="radio" id="pc-38" />
                      </label>
                      <label class="grey" for="pc-39">
                        <input type="radio" id="pc-39" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/product-14.jpg"
                  >
                    <ul class="product__hover">
                      <li>
                        <a href="#"><img src="img/icon/heart.png" alt="" /></a>
                      </li>
                      <li>
                        <a href="#"
                          ><img src="img/icon/compare.png" alt="" />
                          <span>So sánh</span></a
                        >
                      </li>
                      <li>
                        <a href="#"><img src="img/icon/search.png" alt="" /></a>
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
                      <label for="pc-40">
                        <input type="radio" id="pc-40" />
                      </label>
                      <label class="active black" for="pc-41">
                        <input type="radio" id="pc-41" />
                      </label>
                      <label class="grey" for="pc-42">
                        <input type="radio" id="pc-42" />
                      </label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="product__pagination">
                  <a class="active" href="#">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <span>...</span>
                  <a href="#">21</a>
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
