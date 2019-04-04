<%@page import="java.text.DecimalFormat"%>
<%@page import="web.model.VatPham"%>
<%@page import="java.util.Map"%>
<%@page import="web.model.GioHang"%>
<%@page import="web.model.User"%>
<%@page import="web.model.TheLoai"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="java.util.List"%>
<%@page import="web.dao.DanhMucDAO"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
<link rel="stylesheet" type="text/css" href="./style.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>

	<%
		List<DanhMuc> listDanhMuc = DanhMucDAO.getDanhMuc();

		List<TheLoai> listTheLoai = TheLoaiDAO.getTheLoai();

		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}

		GioHang gioHang = (GioHang) session.getAttribute("cart");
		if (gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("cart", gioHang);
		}

		DecimalFormat formatter = new DecimalFormat("###,###,###");
	%>
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
		style="margin-bottom: 0;border: none;border-radius: none;">
		<%
			if (user != null) {
		%>
		<div class="container">
		<ul class="navbar-nav ml-auto">
			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow">
			<a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size: 18px;">Xin chào, <%=user.getUserName() %>
						</span> <img class="img-profile rounded-circle"
					src="images/user.png">
			</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#" style="font-size: 18px;"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Thông tin cá nhân
					</a>

					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="Logout" style="font-size: 18px;"> 
					<i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Đăng xuất
					</a>
				</div></li>

		</ul>

		<%
			} else {
		%>
		<div class= "container">
			<ul class="navbar-nav ml-auto" >
			<li><a href="login.jsp" style="margin-right: 20px;color: #FCA311; text-decoration: none;">Đăng nhập <img alt="" src="images/login.png"></a> </li> 
			<li><a href="register.jsp" style="color: #FCA311; text-decoration: none;">Đăng kí <img alt="" src="images/register.png" ></a></li>
			</ul>
		</div>
		<%
			}
		%>
		</div>
	</nav>
	<div class="">
		<div class="header" id="topne">
			<div class="logo">
				<a href="index.jsp"><img src="images/name.png" width="150px"
					height="50px"></a>
			</div>
			<div class="searchtt">
				<div class="input-search">
					<form action="search.jsp">
						<div>
							<input type="text" name="keyword"
								placeholder="Nhập từ khóa tìm kiếm...">
						</div>

					</form>
				</div>
			</div>
			<div class="cart"
				style="display: flex; justify-content: flex-start; align-items: center;">
				<a href="cart.jsp">XEM GIỎ HÀNG</a>
				<ul class="icon1 sub-icon1" style="width: 300px;">

					<li><div class="cart">
							<a href="#" class="cart-in"><img alt=""
								src="images/shopping-cart.png" width="30px" height="30px"></a>
							<span> <%=gioHang.DemVatPham()%></span>
						</div>
						<ul class="sub-icon1 list">
							<h3>
								Các vật phẩm (<%=gioHang.DemVatPham()%>)
							</h3>
							<div class="shopping_cart">

								<%
									for (Map.Entry<Long, VatPham> list : gioHang.getCacVatPham().entrySet()) {
								%>

								<div class="cart_box">
									<div class="message">
										<div class="alert-close">
											<a
												href="CartServlet?c=xoa&idSanPham=<%=list.getValue().getSanPham().getIdSanPham()%>"><img
												src="images/cancel.png"></a>
										</div>
										<div class="list_img">
											<img
												src="/LapTrinhWeb/images/<%=list.getValue().getSanPham().getAnhSanPham()%>"
												class="img-responsive" alt="">
										</div>
										<div class="list_desc">
											<h4>
												<a style="font-size: 35px; font-weight: bold;"
													href="detail.jsp?idSanPham=<%=list.getValue().getSanPham().getIdSanPham()%>"><%=list.getValue().getSanPham().getTenSanPham()%></a>
											</h4>
											<%=list.getValue().getSoLuong()%>
											<h4 style="font-size: 15px;"><%=formatter.format(list.getValue().getSanPham().getGiaSanPham())%>
												VNĐ
											</h4>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<%
									}
								%>
							</div>
							<div class="total">
								<div class="total_left">Tổng tiền :</div>

								<%
									if (gioHang != null) {
								%>
								<div class="total_right" style="font-size: 20px;"><%=formatter.format(gioHang.TinhTienGioHang())%>
									VNĐ
								</div>

								<%
									} else {
								%>
								<div class="total_right">0</div>
								<%
									}
								%>

								<div class="clearfix"></div>
							</div>
							<div class="checkout">
								<div class="check">
									<a href="checkout.jsp" class="check">Đặt hàng</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
						</ul></li>
				</ul>



			</div>
		</div>
		<div class="menu" id="idmenu">
			<ul class="ulmenu">
				<li><a href="index.jsp">Trang chủ</a></li>
				<li><a href="#">Giới thiệu</a></li>
				<%
					for (int i = 0; i < listDanhMuc.size(); i++) {
				%>
				<li><a
					href="category.jsp?idDanhMuc=<%=listDanhMuc.get(i).getiD()%>&page=1"><%=listDanhMuc.get(i).getTenDanhMuc()%>
						<img src="images/down.png" width="11px" height="11px"></a> <%
 	
 %><ul class="sub-menu">
						<%
							for (int j = 0; j < listTheLoai.size(); j++) {
									if (listTheLoai.get(j).getDanhMuc() == listDanhMuc.get(i).getiD()) {
						%>
						<li><a
							href="product.jsp?idTheLoai=<%=listTheLoai.get(j).getiD()%>&page=1"><%=listTheLoai.get(j).getTenTheLoai()%></a></li>
						<%
							}
								}
						%>
					</ul> <%
 	
 %></li>
				<%
					}
				%>

				<li><a href="contact.jsp">Kết nối</a></li>
				<li><a href="#vechungtoi">Về chúng tôi</a></li>
			</ul>
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin-2.min.js"></script>
</body>
</html>