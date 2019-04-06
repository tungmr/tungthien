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

<link rel="stylesheet" href="css/lightbox.min.css" />
<script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script>

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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body>

	<%
		List<DanhMuc> listDanhMuc = DanhMucDAO.getDanhMuc();

		List<TheLoai> listTheLoai = TheLoaiDAO.getTheLoai();

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
	
	
	<jsp:include page="header.jsp"></jsp:include>
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
		<div style="display: grid; grid-template-columns: 70% 30%;">			
			<div class= "gallery">
			<div style="margin-bottom: 20px;">
			<a href="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" data-lightbox="mygallery" >
			<img src ="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>"></a>
			</div>
			
			<ul id="listimgdetail">
				<li><a href="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" data-lightbox="mygallery" >
			<img src ="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>"></a></li>
			<li><a href="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" data-lightbox="mygallery" >
			<img src ="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>"></a></li>
			<li><a href="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" data-lightbox="mygallery" >
			<img src ="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>"></a></li>
			<li><a href="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" data-lightbox="mygallery" >
			<img src ="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>"></a></li>
			</ul>
			
			
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
					<div>
						<p>
							Mô tả:
							<%=sp.getMoTaSanPham()%></p>
					</div>
					<div class="addcart">
					<%
					if (sp.getSoLuong()==0){
						%>
							<h6 class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "
							id="add-cart" style="font-weight: bold;">Đã hết hàng</h6>
						<%
					}else{
						%>
							<a href="CartServlet?c=them&idSanPham=<%=sp.getIdSanPham()%>"
							class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 "
							id="add-cart" style="font-weight: bold;">THÊM VÀO GIỎ HÀNG</a>
						<%
					}
					%>
					
					</div>

					
				</div>
				
			</div>
		</div>


	</div>

	<div class="container" style="margin-top: 100px;">
		<div class="fb-comments"
			data-href="http://localhost:8080/LapTrinhWeb/detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
			data-width="55em" data-numposts="5"></div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin-2.min.js"></script>
</body>
</html>
