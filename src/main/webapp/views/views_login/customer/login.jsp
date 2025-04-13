<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Liên kết Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Đăng nhập / Đăng ký</title>
    <style>
        .modal-open {
            overflow: hidden; /* Đảm bảo không ảnh hưởng đến bố cục */
            padding-right: 0; /* Loại bỏ padding tự động */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Hiển thị thông báo thành công -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Hiển thị thông báo lỗi -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Bootstrap Tabs -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button"
                    role="tab" aria-controls="login" aria-selected="true">Đăng nhập
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button"
                    role="tab" aria-controls="register" aria-selected="false">Đăng ký
            </button>
        </li>
    </ul>

    <!-- Nội dung Tabs -->
    <div class="tab-content p-3 border border-top-0" id="myTabContent">
        <!-- Tab Đăng nhập -->
        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
            <form action="${pageContext.request.contextPath}/LoginControl" method="post">
                <input type="hidden" name="action" value="login">
                <div class="mb-3">
                    <label for="username" class="form-label">Mã số/SĐT</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <small class="text-muted">
                        Nếu bạn là nhân viên, đăng nhập tạm thời chưa khả dụng.
                    </small>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>
        </div>

        <!-- Tab Đăng ký -->
        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
            <form action="${pageContext.request.contextPath}/LoginControl" method="post">
                <input type="hidden" name="action" value="register">
                <input type="hidden" name="userType" value="customer"> <!-- Loại người dùng: Khách hàng -->
                <!-- Các trường thông tin khách hàng -->
                <div class="mb-3">
                    <label for="name" class="form-label">Tên đầy đủ <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${param.phone}">
                    <c:if test="${not empty sessionScope.errors['phone']}">
                        <small class="text-danger">${sessionScope.errors['phone']}</small>
                    </c:if>
                </div>
                <c:remove var="errors" scope="session"/> <!-- Xóa lỗi sau khi hiển thị -->
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>
                <div class="mb-3">
                    <label for="register-password" class="form-label">Mật khẩu <span
                            class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="register-password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="birthdate" class="form-label">Ngày sinh</label>
                    <input type="date" class="form-control" id="birthdate" name="birthdate">
                </div>
                <div class="mb-3">
                    <label class="form-label">Giới tính <span class="text-danger">*</span></label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="1" checked>
                        <label class="form-check-label" for="female">Nữ</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="0">
                        <label class="form-check-label" for="male">Nam</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-success w-100">Đăng ký</button>
            </form>
        </div>
    </div>
</div>

<!-- Liên kết Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>