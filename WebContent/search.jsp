<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.Search"%>
<%@page import="web.model.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TTSHOP - Thời trang nam cao cấp</title>
</head>
<body>

	<%
		String search = request.getParameter("keyword");
		List<SanPham> listSP = Search.getSanPhamByName(search);
		DecimalFormat formatter = new DecimalFormat("###,###,###");
	%>


	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">

		<%
			if (listSP.size() == 0) {
		%>
		<div class="no-products">
			<h3>Không tìm thấy sản phẩm nào</h3>
		</div>
		<%
			} else

			{
		%>

		
			<div class="products">
				<h2 class=" products-in">Kết quả tìm kiếm: <%=search %></h2>
				<div class="">
					<%
						for (SanPham sp : listSP) {
					%>
					<div class="col-md-3 md-col">
						<div class="col-md liprod">
							<a href="detail.jsp?idSanPham=<%=sp.getIdSanPham()%>"
								class="compare-in"><img src="<%=sp.getAnhSanPham()%>"
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

		




		<%
			}
		%>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>