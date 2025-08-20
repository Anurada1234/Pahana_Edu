package Controller;

import dao.BookDao;
import dao.BillingDao;
import model.BookBean;
import model.BillBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemCode = request.getParameter("itemCode");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        BookBean book = BookDao.getBookByItemCode(itemCode);

        if (book != null) {
            double price = book.getPrice();
            double total = price * quantity;

            BillBean bill = new BillBean();
            bill.setItemCode(itemCode);
            bill.setTitle(book.getTitle());
            bill.setPrice(price);
            bill.setQuantity(quantity);
            bill.setTotal(total);

            BillingDao.saveBill(bill);

            request.setAttribute("bill", bill);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Views/billreceipt.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("Views/billing.jsp?error=notfound");
        }
    }
}
