<%@page import="web.dao.HoaDonDAO"%>
<%@page import="web.model.HoaDon"%>
<%@page import="web.dao.SanPhamDAO"%>
<%@page import="web.model.SanPham"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="web.dao.ChiTietHoaDonDAO"%>
<%@page import="web.model.ChiTietHoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.model.User"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chi tiết hóa đơn</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
</head>
<body>

	<%
		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		} else {
			response.sendRedirect("index.jsp");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h4>Chi tiết hóa đơn</h4>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">STT</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Mã
						hóa đơn</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Tên
						sản phẩm</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Đơn
						giá</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Số
						lượng</th>
					<th scope="col"
						style="color: #fff; background-color: #14213d; border-color: #fca311;">Tổng
						tiền</th>

				</tr>
			</thead>
			<tbody style="color: black;">
				<%
					DecimalFormat formatter = new DecimalFormat("###,###,###");
					HoaDon hoaDon = HoaDonDAO.getHoaDonByID(Long.parseLong(request.getParameter("idHoaDon")));

					ArrayList<ChiTietHoaDon> listChiTietHD = ChiTietHoaDonDAO
							.getListChiTietHoaDon(Long.parseLong(request.getParameter("idHoaDon")));
					for (int i = 0; i < listChiTietHD.size(); i++) {
						SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(listChiTietHD.get(i).getMaSanPham());
				%>
				<tr>
					<th scope="row"><%=i + 1%></th>
					<th><%=listChiTietHD.get(i).getId_HoaDon()%></th>
					<th><%=sanPham.getTenSanPham()%></th>
					<th><%=listChiTietHD.get(i).getGiaSanPham()%></th>
					<th><%=listChiTietHD.get(i).getSoLuong()%></th>
					<th><%=formatter.format(listChiTietHD.get(i).getGiaSanPham() * listChiTietHD.get(i).getSoLuong())%>
						VNĐ</th>


				</tr>
				<%
					}
				%>

			</tbody>
		</table>

		<br> <label>Tổng tiền đơn hàng</label> <%=formatter.format(hoaDon.getTongTien()) %> VNĐ
		<br><br>
		<a href="userprofile.jsp">Quay lại!</a>

	</div>







	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>