package Controller;

import dao.CustomerDao;
import model.CustomerBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/CustomerActionServlet")
public class CustomerActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String accnumber = request.getParameter("accnumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");

        CustomerDao dao = new CustomerDao();
        CustomerBean customer = new CustomerBean();
        customer.setAccNumber(accnumber);
        customer.setName(name);
        customer.setAddress(address);
        customer.setContact(contact);

        try {
            switch (action) {
                case "save":
                    if (dao.insertCustomer(customer)) {
                        request.setAttribute("message", "Customer saved successfully!");
                        request.setAttribute("messageType", "success");
                    } else {
                        request.setAttribute("message", "Customer already exists or failed to save.");
                        request.setAttribute("messageType", "danger");
                    }
                    break;

                case "search":
                    CustomerBean found = dao.searchCustomer(accnumber);
                    if (found != null) {
                        request.setAttribute("customer", found); // Important: sets customer back to JSP
                        request.setAttribute("message", "Customer found.");
                        request.setAttribute("messageType", "info");
                    } else {
                        request.setAttribute("message", "Customer not found.");
                        request.setAttribute("messageType", "warning");
                    }
                    break;

                case "update":
                    if (dao.updateCustomer(customer)) {
                        request.setAttribute("message", "Customer updated successfully!");
                        request.setAttribute("messageType", "success");
                        request.setAttribute("customer", customer);
                    } else {
                        request.setAttribute("message", "Update failed. Customer may not exist.");
                        request.setAttribute("messageType", "danger");
                    }
                    break;

                case "delete":
                    if (dao.deleteCustomer(accnumber)) {
                        request.setAttribute("message", "Customer deleted successfully!");
                        request.setAttribute("messageType", "success");
                        request.setAttribute("customer", null);
                    } else {
                        request.setAttribute("message", "Delete failed. Customer not found.");
                        request.setAttribute("messageType", "danger");
                    }
                    break;

                default:
                    request.setAttribute("message", "Unknown action.");
                    request.setAttribute("messageType", "danger");
            }

        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("messageType", "danger");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Views/customer.jsp");
        dispatcher.forward(request, response);
    }
}
