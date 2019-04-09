<%@page import="java.util.ArrayList"%>
<%@page import="web.model.GioHang"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.dao.TheLoaiDAO"%>
<%@page import="web.model.SanPham"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
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
</head>
<body>

	<%
		String theLoai = request.getParameter("idTheLoai");
		/* if (request.getParameter("idTheLoai") != null) {
			theLoai = Integer.parseInt(request.getParameter("idTheLoai"));
		} */
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		GioHang gioHang = (GioHang) session.getAttribute("cart");
		if (gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("cart", gioHang);
		}

		int pages = 0, start = 0, max = 0, total = 0;
		if (request.getParameter("page") != null) {
			pages = Integer.parseInt(request.getParameter("page"));
		}

		total = SanPhamDAO.demTongSanPhamTheoTheLoai(Integer.parseInt(theLoai));
		if (total <= 9) {
			start = 0;
			max = total;
		} else {
			start = (pages - 1) * 9;
			max = 9;
		}

		ArrayList<SanPham> listSP = SanPhamDAO.getListSanPhamByTheLoai(Integer.parseInt(theLoai), start, max);

		
	%>


	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">

		<div class="haigrid">
			<div class="filter-pro">
				<div>
					<h3>BỘ LỌC SẢN PHẨM</h3>
				</div>
				<div>
					<form action="filterpro.jsp" method="post">
						<ul class="ulfilter">
							<li><input type="radio" name="filterpro" value="a">
								Dưới 100K</li>
							<li><input type="radio" name="filterpro" value="b">
								Từ 100K đến 300k</li>
							<li><input type="radio" name="filterpro" value="c">
								Từ 300k đến 500K</li>
							<li><input type="radio" name="filterpro" value="d">
								Từ 500K đến 1000K</li>
							<li><input type="radio" name="filterpro" value="e">
								Trên 1000K</li>
								
						</ul>
						<input type="hidden" name="idTheLoai" value="<%=theLoai%>">
						<input type="submit" value="XEM">
					</form>

				</div>
			</div>

			<div class="products">
				<h3>Sản phẩm</h3>
				<div class="">

					<%
						for (SanPham sp : listSP) {
					%>

					<div class="col-md-4 md-col">
						<div class="col-md liprod">
							<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
								class="compare-in"><img src="/LapTrinhWeb/images/<%=sp.getAnhSanPham()%>" alt=""
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

				<%
					int p = Integer.parseInt(request.getParameter("page"));
				%>


				<div class="col-md-12" style="text-align: center;">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link"
								href="product.jsp?idTheLoai=<%=theLoai%>&page=<%=p - 1%>"
								aria-label="Previous" title="Trang trước"> <span
									aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>

							<%
								for (int i = 1; i <= (total / 9) + 1; i++) {
							%>
							<li class="page-item"><a class="page-link active"
								href="product.jsp?idTheLoai=<%=theLoai%>&page=<%=i%>"><%=i%></a></li>
							<%
								}
							%>

							<li class="page-item"><a class="page-link"
								href="product.jsp?idTheLoai=<%=theLoai%>&page=<%=p + 1%>"
								aria-label="Next" title="Trang tiếp theo"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
				</div>


			</div>





		</div>



	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>