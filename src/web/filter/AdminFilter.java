package web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.model.User;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/*")
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
   
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String url = req.getRequestURI();
		/*System.out.println(url);
		System.out.println(url.startsWith("/LapTrinhWeb/admin/"));*/
		if (url.startsWith("/LapTrinhWeb/admin/")) {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			if (user!=null) {
				int role = user.getRoleUser();
				if (role == 1) {
					chain.doFilter(request, response);
				}else {
					resp.sendRedirect("/LapTrinhWeb/index.jsp");
				}
			}else {
				resp.sendRedirect("/LapTrinhWeb/login.jsp");
			}
		}else {
			chain.doFilter(request, response);

		}
		
		// pass the request along the filter chain
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
