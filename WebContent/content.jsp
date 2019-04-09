<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
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
	<div class="container">

		<%
			DecimalFormat formatter = new DecimalFormat("###,###,###");

			ArrayList<SanPham> listSPMoi = SanPhamDAO.getListSanPhamMoi();
			ArrayList<SanPham> listSPNoiBat = SanPhamDAO.getListSanPhamNoiBat();
		%>

		<div class="products">
			<a href="category.jsp?idDanhMuc=1&page=1"><h2>
					Sản phẩm mới <img src="images/right.png" width="11px" height="11px">
				</h2></a>
			<%
				for (SanPham sp : listSPMoi) {
			%>
			<div class="col-md-4 md-col">
				<div class="col-md liprod">
					<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
						class="compare-in"><img
						src="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" alt=""
						id="imgpro" /> </a>
					<div class="">
						<h5
							style="font-size: 18px; text-transform: uppercase; text-align: center; color: black;">
							<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"><%=sp.getTenSanPham()%></a>
						</h5>
						<div class="ulpricecart">
							<ul style="list-style-type: none; text-align: center;">
								<li style="margin-bottom: 10px; font-weight: bold;"><img
									alt="" src="images/price.png"> <%=formatter.format(sp.getGiaSanPham())%>
									VNĐ</li>

								<li class="addprotocart"><a
									href="CartServlet?c=them&idSanPham=<%=sp.getIdSanPham()%>"><img
										alt="" src="images/addtocart.png"> Thêm vào giỏ hàng</a></li>
							</ul>



						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>


		</div>

		<div class="products">
			<a href="category.jsp?idDanhMuc=1&page=1"><h2>
					Những sản phẩm bán chạy <img src="images/right.png" width="11px"
						height="11px">
				</h2></a>
			<%
				for (SanPham sp : listSPNoiBat) {
			%>
			<div class="col-md-4 md-col">
				<div class="col-md liprod">
					<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
						class="compare-in"><img
						src="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" alt=""
						id="imgpro" /> </a>
					<div class="">
						<h5
							style="font-size: 18px; text-transform: uppercase; text-align: center; color: black;">
							<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"><%=sp.getTenSanPham()%></a>
						</h5>
						<div class="ulpricecart">
							<ul style="list-style-type: none; text-align: center;">
								<li style="margin-bottom: 10px; font-weight: bold;"><img
									alt="" src="images/price.png"> <%=formatter.format(sp.getGiaSanPham())%>
									VNĐ</li>

								<li class="addprotocart">
								<%
										if (sp.getSoLuong()==0){
								%>
										<h6 style="font-weight: bold; font-size: 20px;">Đã hết hàng</h6>
								<%
										}else{
									%><a href="CartServlet?c=them&idSanPham=<%=sp.getIdSanPham()%>"><img
										alt="" src="images/addtocart.png"> THÊM VÀO GIỎ HÀNG</a>
										<%
									}
									%>
										
										
										</li>
							</ul>



						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<!-- đây có xóa cái </div> -->

		<div class="video">
			<div>
				<h2>MEN'S OUTFIT INSPIRATION</h2>
				<iframe width="1120" height="720"
					src="https://www.youtube.com/embed/cUxYmYdMZXU" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>

	</div>
</body>
</html>