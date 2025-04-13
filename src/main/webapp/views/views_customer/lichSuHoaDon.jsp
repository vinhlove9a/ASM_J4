<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lịch Sử Hóa Đơn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Lịch Sử Hóa Đơn</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/thanh-toan/lich-su-hoa-don" method="get" class="mb-4">
        <div class="form-group">
            <label for="soDienThoai">Nhập Số Điện Thoại:</label>
            <input type="text" class="form-control" id="soDienThoai" name="soDienThoai" placeholder="Nhập số điện thoại">
        </div>
        <button type="submit" class="btn btn-primary">Xem Lịch Sử</button>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>Mã Hóa Đơn</th>
            <th>Ngày Tạo</th>
            <th>Tổng Tiền</th>
            <th>Phương Thức Thanh Toán</th>
            <th>Trạng Thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${hoaDonList}">
            <tr>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.maHoaDon}</td>
                <td>${hoaDon.ngayTao}</td>
                <td>${hoaDon.tongTien}</td>
                <td>${hoaDon.phuongThucThanhToan}</td>
                <td>
                    <c:choose>
                        <c:when test="${hoaDon.trangThai}">
                            Đang Hoạt Động
                        </c:when>
                        <c:otherwise>
                            Đã Hoàn Tất
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>