<%@page import="web.model.TheLoai"%>
<%@page import="web.dao.GetTheLoai"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="java.util.List"%>
<%@page import="web.dao.GetDanhMuc"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
<link rel="stylesheet" type="text/css" href="./style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>

	<%
		GetDanhMuc getDanhMuc = new GetDanhMuc();
		List<DanhMuc> listDanhMuc = getDanhMuc.getDanhMuc();
		
		GetTheLoai getSanPham = new GetTheLoai();
		List<TheLoai> listTheLoai = getSanPham.getTheLoai();
	%>

	<div class="">
		<div class="header" id="topne">
			<div class="logo">
				<a href="index.jsp"><img src="images/name.png" width="150px"
					height="50px"></a>
			</div>
			<div class="searchtt">
				<div class="input-search">
					<input type="text" name="" placeholder="Nhập từ khóa tìm kiếm...">
				</div>
				<div>
					<a href="#"><img src="images/search.png" width="32px"
						height="32px"></a>
				</div>
			</div>
			<div class="cart">
				<div>
					<a href="#">Giỏ hàng</a>
				</div>
				<div>
					<a href="#"><img src="images/shopping-cart.png" width="42px"
						height="42px"></a>
				</div>
			</div>
		</div>
		<div class="menu" id="idmenu">
			<ul class="ulmenu">
				<li><a href="index.jsp">Trang chủ</a></li>
				<li><a href="#">Giới thiệu</a></li>
				<%
				for (int i=0;i< listDanhMuc.size();i++ ){
					%>
					<li><a href="#"><%=listDanhMuc.get(i).getTenDanhMuc() %> <img src="images/down.png"
						width="11px" height="11px"></a>
					<%
					
						%><ul class="sub-menu"><%
						for (int j=0;j<listTheLoai.size();j++){
							if(listTheLoai.get(j).getDanhMuc()==listDanhMuc.get(i).getiD()){
								%>			
						<li><a href="#"><%=listTheLoai.get(j).getTenTheLoai() %></a></li>
								<%
							}
						}
						%></ul><%					
					%></li><%
				}
				%>

				<li><a href="contact.jsp">Kết nối</a></li>
				<li><a href="#vechungtoi">Về chúng tôi</a></li>
			</ul>
		</div>
	</div>
</body>
</html>