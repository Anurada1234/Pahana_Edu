package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the session if it exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Remove authentication cookies if present
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("authToken".equals(cookie.getName()) || "JSESSIONID".equals(cookie.getName())) {
                    Cookie deleteCookie = new Cookie(cookie.getName(), "");
                    deleteCookie.setMaxAge(0);
                    deleteCookie.setPath(cookie.getPath() != null ? cookie.getPath() : "/");
                    response.addCookie(deleteCookie);
                }
            }
        }

        // Logout the user from the request context
        try {
            request.logout();
        } catch (ServletException e) {
            // Optional: Handle exception if necessary
            e.printStackTrace();
        }

        // Redirect to the login page
        response.sendRedirect(request.getContextPath() + "Views/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
