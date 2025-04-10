<%--
  Created by IntelliJ IDEA.
  User: Vinh
  Date: 4/4/2025
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Quản lý Sản phẩm</h1>

    <!-- Form thêm sản phẩm mới -->
    <form id="sanPhamForm" action="/sanpham/add" method="post" class="mb-4">
        <div class="row">
            <div class="col-md-6">
                <label for="maSanPham" class="form-label">Mã sản phẩm</label>
                <input type="text" class="form-control" id="maSanPham" name="maSanPham"
                       value="${sanPham.maSanPham}">
            </div>
            <div class="col-md-6">
                <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" id="tenSanPham" name="tenSanPham"
                       value="${sanPham.tenSanPham}">
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-4">
                <label for="thuongHieu" class="form-label">Thương hiệu</label>
                <select class="form-select" id="thuongHieu" name="thuongHieu">
                    <c:forEach var="thuongHieu" items="${listThuongHieu}">
                        <option value="${thuongHieu.id}"
                            ${thuongHieu.id == sanPham.chiTietSanPham.thuongHieu.id ? "selected" : ""}>
                                ${thuongHieu.tenThuongHieu}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4">
                <label for="mauSac" class="form-label">Màu sắc</label>
                <select class="form-select" id="mauSac" name="mauSac">
                    <c:forEach var="mauSac" items="${listMauSac}">
                        <option value="${mauSac.id}"
                            ${mauSac.id == sanPham.chiTietSanPham.mauSac.id ? "selected" : ""}>
                                ${mauSac.tenMauSac}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4">
                <label for="kichThuoc" class="form-label">Kích thước</label>
                <select class="form-select" id="kichThuoc" name="kichThuoc">
                    <c:forEach var="kichThuoc" items="${listKichThuoc}">
                        <option value="${kichThuoc.id}"
                            ${kichThuoc.id == sanPham.chiTietSanPham.kichThuoc.id ? "selected" : ""}>
                                ${kichThuoc.tenKichThuoc}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-6">
                <label for="soLuong" class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="soLuong" name="soLuong"
                       value="${sanPham.chiTietSanPham.soLuong}">
            </div>
            <div class="col-md-6">
                <label for="donGia" class="form-label">Đơn giá</label>
                <input type="number" class="form-control" id="donGia" name="donGia"
                       value="${sanPham.chiTietSanPham.donGia}">
            </div>
        </div>
        <div class="text-end mt-3">
            <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
        </div>
    </form>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <!-- Bảng hiển thị danh sách sản phẩm -->
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Thương hiệu</th>
            <th>Màu sắc</th>
            <th>Kích thước</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="sanPham" items="${listSanPham}">
            <tr>
                <td>${sanPham.id}</td>
                <td>${sanPham.maSanPham}</td>
                <td>${sanPham.tenSanPham}</td>
                <td>${sanPham.chiTietSanPham.thuongHieu.tenThuongHieu}</td>
                <td>${sanPham.chiTietSanPham.mauSac.tenMauSac}</td>
                <td>${sanPham.chiTietSanPham.kichThuoc.tenKichThuoc}</td>
                <td>${sanPham.chiTietSanPham.soLuong}</td>
                <td>${sanPham.chiTietSanPham.donGia}</td>
                <td>
                    <a href="/sanpham/detail?id=${sanPham.id}" class="btn btn-info btn-sm">Detail</a>
                    <a href="/sanpham/delete?id=${sanPham.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">Xóa</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
