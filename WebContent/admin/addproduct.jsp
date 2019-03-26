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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>


	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<h2>THÊM SẢN PHẨM</h2>
		
		
	
		<form action="/LapTrinhWeb/ProductsManager" method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">Tên sản phẩm</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập tên sản phẩm">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Giá sản phẩm</label> <input
					type="number" class="form-control" id="exampleFormControlInput1"
					placeholder="nhập giá sản phẩm">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Loại</label> <select
					class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Danh mục</label> <select
					class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		
			<div class="form-group">
				<label for="exampleFormControlTextarea1">Mô tả</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="">Hình ảnh</label>
				<input type="file" name="hinhAnh">
			</div>
			<div class="form-group">
				<input type="submit" value="XÁC NHẬN">
			</div>
		</form>

	</div>




</body>
</html>