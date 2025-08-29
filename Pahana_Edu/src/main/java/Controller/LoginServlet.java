package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember"); // checkbox value

        // Check if username, password are correct AND checkbox is ticked
        if (USERNAME.equals(username) && PASSWORD.equals(password) && "on".equals(remember)) {
            // Store user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            response.sendRedirect("Views/dashboard.jsp");
        } else {
            // If credentials correct but checkbox not ticked OR invalid credentials
            response.sendRedirect("Views/index.jsp?error=invalid");
        }
    }
}
