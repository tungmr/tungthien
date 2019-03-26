<%@page import="java.util.Formatter"%>
<%@page import="web.model.VatPham"%>
<%@page import="java.util.Map"%>
<%@page import="web.model.GioHang"%>
<%@page import="web.model.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="web.model.TheLoai"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.DanhMuc"%>
<%@page import="java.util.List"%>
<%@page import="web.dao.DanhMucDAO"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<link rel="stylesheet" href="zoom/css/normalize.css" />
<link rel="stylesheet" href="zoom/css/foundation.css" />
<link rel="stylesheet" href="zoom/css/demo.css" />
<script src="zoom/js/vendor/modernizr.js"></script>
<script src="zoom/js/vendor/jquery.js"></script>
<!-- xzoom plugin here -->
<script type="text/javascript" src="zoom/dist/xzoom.min.js"></script>
<link rel="stylesheet" type="text/css" href="zoom/css/xzoom.css"
	media="all" />

<!-- hammer plugin here -->
<script type="text/javascript"
	src="hammer.js/1.0.5/jquery.hammer.min.js"></script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link type="text/css" rel="stylesheet" media="all"
	href="fancybox/source/jquery.fancybox.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="magnific-popup/css/magnific-popup.css" />
<script type="text/javascript"
	src="zoom/fancybox/source/jquery.fancybox.js"></script>
<script type="text/javascript"
	src="zoom/magnific-popup/js/magnific-popup.js"></script>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=257869411834839&autoLogAppEvents=1"></script>

</head>

<body>

	<%
		DanhMucDAO getDanhMuc = new DanhMucDAO();
		List<DanhMuc> listDanhMuc = getDanhMuc.getDanhMuc();

		TheLoaiDAO getSanPham = new TheLoaiDAO();
		List<TheLoai> listTheLoai = getSanPham.getTheLoai();

		GioHang gioHang = (GioHang) session.getAttribute("cart");
		if (gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("cart", gioHang);
		}

		DecimalFormat formatter = new DecimalFormat("###,###,###");

		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}
	%>
	<div class="container">
		<%
			if (user != null) {
		%>
		<div class="hello-user"
			style="display: flex; padding-right: 8px; justify-content: flex-end; align-content: center; font-size: 20px; padding-left: 8px;">
			<p>
				Xin chào,<%=user.getUserName()%></p>
			<a href="Logout" style="margin-left: 10px;">Đăng xuất <img alt=""
				src="images/logout.png"></a>
		</div>

		<%
			} else {
		%>

		<div class="log-in-out"
			style="display: flex; padding-right: 8px; justify-content: flex-end; align-content: center; font-size: 20px; padding-left: 8px;">
			<a href="login.jsp" style="margin-right: 20px;">Đăng nhập <img
				alt="" src="images/login.png"></a> <a href="register.jsp">Đăng
				kí <img alt="" src="images/register.png">
			</a>
		</div>
		<%
			}
		%>
	</div>
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
				<a href="#">CHECKOUT</a>
				<ul class="icon1 sub-icon1">

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
										<div class="alert-close"></div>
										<div class="list_img">
											<img src="<%=list.getValue().getSanPham().getAnhSanPham()%>"
												class="img-responsive" alt="">
										</div>
										<div class="list_desc">
											<h4>
												<a
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
									<a href="checkout.jsp" class="check">CHECKOUT</a>
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
					href="category.jsp?idDanhMuc=<%=listDanhMuc.get(i).getiD()%>"><%=listDanhMuc.get(i).getTenDanhMuc()%>
						<img src="images/down.png" width="11px" height="11px"></a> <%
 	
 %><ul class="sub-menu">
						<%
							for (int j = 0; j < listTheLoai.size(); j++) {
									if (listTheLoai.get(j).getDanhMuc() == listDanhMuc.get(i).getiD()) {
						%>
						<li><a
							href="product.jsp?idTheLoai=<%=listTheLoai.get(j).getiD()%>"><%=listTheLoai.get(j).getTenTheLoai()%></a></li>
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


	<%
		int idSanPham = 0;
		if (request.getParameter("idSanPham") != null) {
			idSanPham = Integer.parseInt(request.getParameter("idSanPham"));

		}
		SanPham sp = SanPhamDAO.getSanPhamByIdSanPham(idSanPham);
	%>


	<div class="container">
		<div style="margin: 20px 0px;">
			<h4>Xem chi tiết sản phẩm</h4>
		</div>
		<div class="contai-detail">
			<div class="contai-zoom">
				<!-- default start -->
				<section id="default" class="padding-top0">
					<div class="row">

						<div class="large-12 column">
							<div class="xzoom-container">
								<img class="xzoom" id="xzoom-default"
									src="<%=sp.getAnhSanPham()%>"
									xoriginal="<%=sp.getAnhSanPham()%>" width="100%" height="100%" />
								<div class="xzoom-thumbs">
									<a href="<%=sp.getAnhSanPham()%>"> <img
										class="xzoom-gallery" width="80" src="<%=sp.getAnhSanPham()%>"
										xpreview="<%=sp.getAnhSanPham()%>">
									</a> <a href="<%=sp.getAnhSanPham()%>"> <img
										class="xzoom-gallery" width="80" src="<%=sp.getAnhSanPham()%>">
									</a> <a href="<%=sp.getAnhSanPham()%>"> <img
										class="xzoom-gallery" width="80" src="<%=sp.getAnhSanPham()%>">
									</a> <a href="<%=sp.getAnhSanPham()%>"> <img
										class="xzoom-gallery" width="80" src="<%=sp.getAnhSanPham()%>">
									</a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div class="detail-content">
				<div>
					<h3><%=sp.getTenSanPham()%></h3>
				</div>
				<div class="price-cart">
					<div class="detail-price">
						<h4><%=formatter.format(sp.getGiaSanPham())%>
							VNĐ
						</h4>
					</div>
					<div class="addcart">
						<a href="CartServlet?c=them&idSanPham=<%=sp.getIdSanPham()%>"
							class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "
							id="add-cart" style="font-weight: bold;">THÊM VÀO GIỎ HÀNG</a>
					</div>

					<div>
						<p>
							Mô tả:
							<%=sp.getMoTaSanPham()%></p>
					</div>
				</div>
				<div class="available">
					<h6>Tùy chọn :</h6>
					<ul>
						<li>Màu sắc: <select>
								<option>Trắng</option>
								<option>Đen</option>
								<option>Vàng</option>
								<option>Đỏ</option>
						</select></li>
						<li>Size:<select>
								<option>XL</option>
								<option>L</option>
								<option>M</option>
								<option>S</option>
						</select></li>
						<li>Số lượng:<select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select></li>
					</ul>
				</div>
			</div>
		</div>


	</div>

	<div class="container">
		<div class="fb-comments"
			data-href="http://localhost:8080/LapTrinhWeb/detail.jsp?idSanPham=<%=sp.getIdSanPham() %>"
			data-width="55em" data-numposts="5"></div>
	</div>



	<div class="bottom">
		<div class="container">
			<div class="about">
				<div class="info">
					<h2 style="text-align: center;">TTShop.vn</h2>
					<ul>
						<li style="font-size: 20px;">Chất lượng
							<ul>
								<li>TTShop cam kết chất lượng cho tất cả sản phẩm bán tại
									cửa hàng TTShop bằng chính sách bảo hành 365 ngày và chăm sóc
									trọn đời sau khi hết bảo hành.</li>
							</ul>
						</li>
						<li style="font-size: 20px;">Phục vụ
							<ul>
								<li>TTShop cam kết chất lượng phục vụ tốt nhất, chuyên
									nghiệp nhất cho mọi khách hàng bằng chính sách hoàn tiền và
									tặng quà nếu nhân viên phục vụ quí khách không chu đáo.</li>
							</ul>
						</li>
						<li style="font-size: 20px;">Hỗ trợ
							<ul>
								<li>Nếu bạn gặp rắc rối về sản phẩm hay chất lượng dịch vụ
									của TTShop, hãy gọi ngay đến số 098686868.</li>
							</ul>
						</li>
					</ul>
				</div>

				<div class="help">
					<h2 style="text-align: center;">Trợ giúp và tư vấn</h2>
					<ul>
						<li><img src="images/right-arrow.png" width="11px"
							height="11px"> <a href="#">Liện hệ</a></li>
						<li><img src="images/right-arrow.png" width="11px"
							height="11px"> <a href="#">Cách chọn size quần áo</a></li>
						<li><img src="images/right-arrow.png" width="11px"
							height="11px"> <a href="#">Câu hỏi thường gặp</a></li>
						<li><img src="images/right-arrow.png" width="11px"
							height="11px"> <a href="#">Chính sách đổi hàng</a></li>
					</ul>
				</div>

				<div class="contact">
					<h2 style="text-align: center;">Kết nối</h2>
					<ul>
						<li><a href="#" title="Đi đến trang facebook chúng tôi"><img
								src="images/facebook.png"></a></li>
						<li><a href="#" title="Đi đến trang instagram chúng tôi"><img
								src="images/instagram.png"></a></li>
						<li><a href="#" title="Đi đến trang youtube chúng tôi"><img
								src="images/youtube.png"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer" style="margin-top: 10px">
			<p>&copy; Copyright 2019 TungMR, ThienLe</p>
		</div>
	</div>

	<!-- Cuộn trơn -->
	<script type="text/javascript">
		document.querySelectorAll('a[href^="#"]').forEach(anchor => {
		    anchor.addEventListener('click', function (e) {
		        e.preventDefault();
		        document.querySelector(this.getAttribute('href')).scrollIntoView({
		            behavior: 'smooth'
		        });
		    });
		});
	</script>
	<script src="zoom/js/foundation.min.js"></script>
	<script src="zoom/js/setup.js"></script>
</body>
</html>
