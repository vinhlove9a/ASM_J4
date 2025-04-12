<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <!-- Liên kết CSS và JS của Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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
            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Đăng nhập</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">Đăng ký</button>
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
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                    <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>
        </div>

        <!-- Tab Đăng ký -->
        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
            <form action="${pageContext.request.contextPath}/LoginControl" method="post" id="registerForm">
                <input type="hidden" name="action" value="register">
                <div class="mb-3">
                    <label for="name" class="form-label">Tên đầy đủ <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                    <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" required>
                    <small class="form-text text-muted">Nhập 10 chữ số</small>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>
                <div class="mb-3">
                    <label for="register-password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
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

    <!-- JavaScript để xử lý -->
    <script>
        document.getElementById('login-tab').addEventListener('click', function () {
            console.log('Tab Đăng nhập được chọn');
        });

        document.getElementById('register-tab').addEventListener('click', function () {
            console.log('Tab Đăng ký được chọn');
        });

        // Kiểm tra định dạng số điện thoại
        document.getElementById('phone').addEventListener('input', function (e) {
            this.value = this.value.replace(/[^0-9]/g, '');
            if (this.value.length > 10) {
                this.value = this.value.slice(0, 10);
            }
        });

        // Validate form trước khi submit
        document.getElementById('registerForm').addEventListener('submit', function (e) {
            const phone = document.getElementById('phone').value;
            if (phone.length !== 10) {
                e.preventDefault();
                alert('Số điện thoại phải có đúng 10 chữ số');
            }
        });
    </script>
</div>