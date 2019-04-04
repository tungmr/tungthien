<%@page import="java.text.DecimalFormat"%>
<%@page import="web.model.VatPham"%>
<%@page import="java.util.Map"%>
<%@page import="web.model.GioHang"%>
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		GioHang gioHang = null;
		if (session.getAttribute("cart") != null) {
			gioHang = (GioHang) session.getAttribute("cart");
		}
	%>

	<div class="container">
		<%
			if (gioHang.DemVatPham() == 0) {
		%>
		<h4>
			Trong giỏ hàng hiện không có sản phẩm vào, quay lại <a
				href="index.jsp">trang chủ </a>mua nào!
		</h4>
		<%
			} else {
		%>

		<div>
			<h4>Các sản phẩm trong giỏ hàng</h4>
		</div>

		<div class="cart-details">

			<%
				for (Map.Entry<Long, VatPham> list : gioHang.getCacVatPham().entrySet()) {
			%>

			<div class="cart-pro">

				<div class="pro-img">
					<img alt="" src="/LapTrinhWeb/images/<%=list.getValue().getSanPham().getAnhSanPham()%>"
						class="img-responsive">
				</div>

				<div class="pro-name-desc">
					<div class="pro-name">
						<h6 style="text-align: center;">
							<a style="font-size: 25px; font-weight: bold;"
								href="detail.jsp?idSanPham=<%=list.getValue().getSanPham().getIdSanPham()%>"><%=list.getValue().getSanPham().getTenSanPham()%></a>
						</h6>
					</div>
					<div class="pro-desc">
						<h6 style="font-size: 15px; font-weight: bold;">
							<%=list.getValue().getSanPham().getMoTaSanPham()%>
						</h6>
					</div>
				</div>

				<div class="pro-price-quant" style="margin: 20px 0px; text-align: center;">
					<div class="pro-price">
						<h4 style="font-size: 15px;">
							<b >Giá <br><%=formatter.format(list.getValue().getSanPham().getGiaSanPham())%>
							VNĐ</b>
						</h4>
					</div>
					<div class="pro-quant">
						<h4>
							<b>Số lượng <br><%=list.getValue().getSoLuong()%></b>
						</h4>
						<br>
						<a href="CartServlet?c=themincart&idSanPham=<%=list.getValue().getSanPham().getIdSanPham()%>">
						<img alt="" src="images/addplus.png"></a>
					</div>
				</div>

				<div class="del-pro">
					<div>
						<a
							href="CartDelPro?c=xoa&idSanPham=<%=list.getValue().getSanPham().getIdSanPham()%>"><img
							src="images/cancel.png"></a>
					</div>

				</div>
			</div>


			<%
				}
			%>

			<div  style="text-align: center;">
				<a href="checkout.jsp" id="cartcheck">ĐẶT HÀNG</a>
			</div>


		</div>

		<%
			}
		%>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>