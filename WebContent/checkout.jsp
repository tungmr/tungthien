<%@page import="java.text.DecimalFormat"%>
<%@page import="web.model.GioHang"%>
<%@page import="web.model.User"%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
 <meta charset="UTF-8">
<title>Đặt hàng</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">

</head>
<body>

	


	<jsp:include page="header.jsp"></jsp:include>
	
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		User user = null;
		if (session.getAttribute("user")!=null){
			user = (User) session.getAttribute("user");
		}
		
		GioHang gioHang = null;
		if (session.getAttribute("cart")!=null){
			gioHang = (GioHang) session.getAttribute("cart");
		}
	
		if (user!=null){
			
			if (gioHang.DemVatPham()!=0){
	%>
	<div class="container centerdathang">
		<div class="dathang">
			<h2>Đặt hàng</h2>
			<form action="CheckOutServlet" method="POST">
				<label>Địa chỉ</label> <input type="text" name="diachi"> <br>
				<label>Hình thức thanh toán</label> 
					<select name="phuongthuc">
					<option value="Trực tiếp">Trực tiếp</option>
				</select> <br>
				<label>Tổng tiền</label> <%=formatter.format(gioHang.TinhTienGioHang())%> VNĐ <br>
				<div style="text-align: center;">
				<input type="submit" value="Đặt hàng">
				<%
				if (request.getParameter("e")!=null)
				if ( request.getParameter("e").equals("1")){
					%>
					<p style="font-size: 18px;color: red;font-weight: bold;text-align: left;">Vui lòng nhập đầy đủ thông tin!</p>
					<%
				}else if (request.getParameter("e").equals("0")){
					%>
					<p style="font-size: 18px;color: blue;font-weight: bold;text-align: left;">Đặt hàng thành công, quay lại <a href="index.jsp">trang chủ</a>!</p>
					<%
					session.removeAttribute("cart");

				}
				%>
				
				</div>
			</form>
		</div>
	</div>
	
	<%		}else{
			%>
				<div class="container">
					<p>Trong giỏ hàng hiện không có sản phẩm nào, Quay lại <a href="index.jsp">trang chủ.</a></p>
				</div>
			<%
			}
		} else{
			%>				
			<div class="container">
				<p>Bạn cần <a href="login.jsp">đăng nhập</a> để đặt hàng!</p>
			</div>
			<%
		}
		
		%>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>