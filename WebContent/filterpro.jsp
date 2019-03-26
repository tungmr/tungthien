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
<link rel="stylesheet" type="text/css" href="./style.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		String theLoai = "";
		String danhMuc = "";
		if (request.getParameter("idTheLoai") != null) {
			theLoai = request.getParameter("idTheLoai");
		} else if (request.getParameter("idDanhMuc") != null) {
			danhMuc = request.getParameter("idDanhMuc");
		}
		String filterpro = "";
		if (request.getParameter("filterpro") != null) {
			filterpro = request.getParameter("filterpro");
		}
		ArrayList<SanPham> listProFilter = new ArrayList<>();
		switch (filterpro) {
		case "a":
			if (!theLoai.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocTheLoaiTheoKhoangGia(Integer.parseInt(theLoai), 0,
						100000);
			else if (!danhMuc.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocDanhMucTheoKhoangGia(Integer.parseInt(danhMuc), 0,
						100000);

			break;
		case "b":
			if (!theLoai.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocTheLoaiTheoKhoangGia(Integer.parseInt(theLoai), 100000,
						300000);
			else if (!danhMuc.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocDanhMucTheoKhoangGia(Integer.parseInt(danhMuc), 100000,
						300000);

			break;
		case "c":
			if (!theLoai.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocTheLoaiTheoKhoangGia(Integer.parseInt(theLoai), 300000,
						500000);
			else if (!danhMuc.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocDanhMucTheoKhoangGia(Integer.parseInt(danhMuc), 300000,
						500000);

			break;
		case "d":
			if (!theLoai.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocTheLoaiTheoKhoangGia(Integer.parseInt(theLoai), 500000,
						1000000);
			else if (!danhMuc.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocDanhMucTheoKhoangGia(Integer.parseInt(danhMuc), 500000,
						1000000);

			break;
		case "e":
			if (!theLoai.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocTheLoaiTheoKG(Integer.parseInt(theLoai), 1000000);
			else if (!danhMuc.equals(""))
				listProFilter = SanPhamDAO.locSanPhamThuocDanhMucTheoKG(Integer.parseInt(danhMuc), 1000000);
			break;
		default:
			break;
		}
	%>

	<div class="container">

		<div class="haigrid">
			<div class="filter-pro">
				<div>
					<h3>BỘ LỌC SẢN PHẨM</h3>
				</div>
				<div>
					<form action="filterpro.jsp" method="get">
						<ul class="ulfilter">

							<%
								if (filterpro.equals("a")) {
							%>
							<li><input type="radio" name="filterpro" value="a"
								checked="checked"> Dưới 100K</li>
							<%
								} else {
							%>
							<li><input type="radio" name="filterpro" value="a">
								Dưới 100K</li>
							<%
								}

								if (filterpro.equals("b")) {
							%>
							<li><input type="radio" name="filterpro" value="b"
								checked="checked"> Từ 100K đến 300k</li>
							<%
								} else {
							%>
							<li><input type="radio" name="filterpro" value="b">
								Từ 100K đến 300k</li>
							<%
								}
								if (filterpro.equals("c")) {
							%>
							<li><input type="radio" name="filterpro" value="c"
								checked="checked"> Từ 300k đến 500K</li>
							<%
								} else {
							%>
							<li><input type="radio" name="filterpro" value="c">
								Từ 300k đến 500K</li>
							<%
								}
								if (filterpro.equals("d")) {
							%>
							<li><input type="radio" name="filterpro" value="d"
								checked="checked"> Từ 500K đến 1000K</li>
							<%
								} else {
							%>
							<li><input type="radio" name="filterpro" value="d">
								Từ 500K đến 1000K</li>
							<%
								}
								if (filterpro.equals("e")) {
							%>
							<li><input type="radio" name="filterpro" value="e"
								checked="checked"> Trên 1000K</li>
							<%
								} else {
							%>
							<li><input type="radio" name="filterpro" value="e">
								Trên 1000K</li>
							<%
								}
							%>





						</ul>
						<%
						if (!theLoai.equals("")){
							%>
							<input type="hidden" name="idTheLoai" value="<%=theLoai%>">
							<%
						} else if (!danhMuc.equals("")){
							%>
							<input type="hidden" name="idDanhMuc" value="<%=danhMuc%>">
							<%
						}
						%>
						<input type="submit" value="XEM">
					</form>

				</div>
			</div>


			<div class="products">

				<%
					switch (filterpro) {
					case "a":
				%>
				<h3>Các sản phẩm lọc theo khoảng giá dưới 100K</h3>
				<%
					break;
					case "b":
				%>
				<h3>Các sản phẩm lọc theo khoảng giá 100K - 300k</h3>
				<%
					break;
					case "c":
				%>
				<h3>Các sản phẩm lọc theo khoảng giá 300K - 500k</h3>
				<%
					break;
					case "d":
				%>
				<h3>Các sản phẩm lọc theo khoảng giá 500K - 1000k</h3>
				<%
					break;
					case "e":
				%>
				<h3>Các sản phẩm lọc theo khoảng giá trên 1000k</h3>
				<%
					break;
					default:
						break;
					}
				%>

				<div class="">

					<%
						for (SanPham sp : listProFilter) {
					%>

					<div class="col-md-4 md-col">
						<div class="col-md liprod">
							<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
								class="compare-in"><img src="<%=sp.getAnhSanPham()%>" alt=""
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

			</div>



		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>