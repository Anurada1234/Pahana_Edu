package Controller;

import dao.ShowCustomerDao;
import model.ShowCustomerBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/ShowCustomerServlet")
public class ShowCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ShowCustomerDao dao = new ShowCustomerDao();
        try {
            List<ShowCustomerBean> customerList = dao.getAllCustomers();
            request.setAttribute("customerList", customerList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Views/customerlist.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Failed to fetch customer list: " + e.getMessage());
            request.getRequestDispatcher("Views/customerlist.jsp").forward(request, response);
        }
    }
}
