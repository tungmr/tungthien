package web.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.UserDAO;
import web.model.User;

/**
 * Servlet implementation class HandlerUser
 */
@WebServlet("/HandlerUser")
public class HandlerRegister extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (!request.getParameter("username").equals("") && !request.getParameter("email").equals("")
				&& !request.getParameter("password").equals("") 	&& !request.getParameter("repassword").equals("") && !request.getParameter("phoneNumber").equals("")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String hashPassword = MD5.md5(password);
			String email = request.getParameter("email");
			String phoneNumber = request.getParameter("phoneNumber");
			String url = "/index.jsp";
			User user = new User(0, username, hashPassword, email, phoneNumber, 0);
			if (UserDAO.insertUser(user)) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", user);
				RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
				requestDispatcher.forward(request, response);
			} else
				response.sendRedirect("register.jsp?e=1");
		} else {
			response.sendRedirect("register.jsp?e=1");
		}
	}

}
