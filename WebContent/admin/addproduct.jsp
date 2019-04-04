<%@page import="web.model.User"%>
<%@page import="web.dao.DanhMucDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.TheLoai"%>
<%@page import="java.util.List"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản lý sản phẩm</title>
</head>
<body>
	<%
	User user = null;
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
	}
	if (user != null && user.getRoleUser() == 0) {
		response.sendRedirect("/LapTrinhWeb/index.jsp");
	} else if (user == null) {
		response.sendRedirect("/LapTrinhWeb/login.jsp");
	}
%>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>


	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>THÊM SẢN PHẨM</h2>
		<%
			List<TheLoai> listTL = TheLoaiDAO.getTheLoai();
			List<DanhMuc> listDM = DanhMucDAO.getDanhMuc();
		
		%>
		<form action="/LapTrinhWeb/ProductsManager" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleFormControlInput1">Tên sản phẩm</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập tên sản phẩm" name="tenSanPham">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Giá sản phẩm</label> <input
					type="number" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập giá sản phẩm" name="giaSanPham">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Loại</label> <select
					class="form-control" id="exampleFormControlSelect1" name="theLoai">
					<%for (TheLoai theLoai : listTL){ %>
					<option value="<%=theLoai.getiD()%>"><%=theLoai.getTenTheLoai() %></option>
					<%} %>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Danh mục</label> <select
					class="form-control" id="exampleFormControlSelect1" name="danhMuc">
					<%for (DanhMuc danhMuc : listDM){ %>
					<option value="<%=danhMuc.getiD()%>"><%=danhMuc.getTenDanhMuc() %></option>
					<%} %>
					
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Số lượng</label> <input
					type="number" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập số lượng sản phẩm" name="soLuong">
			</div>
		
			<div class="form-group">
				<label for="exampleFormControlTextarea1">Mô tả</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" name="moTa"></textarea>
			</div>
			<div class="form-group">
				<label for="">Hình ảnh</label>
				<input type="file" name="hinhAnh" accept="image/*"> 
			</div>
			<div class="form-group">
				<input type="submit" value="THÊM">
			</div>
		</form>

	</div>




</body>
</html>