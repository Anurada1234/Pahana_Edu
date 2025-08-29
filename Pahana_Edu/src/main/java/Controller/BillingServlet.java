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
        String customerName = request.getParameter("customerName"); // <-- from dropdown

        BookBean book = BookDao.getBookByItemCode(itemCode);

        if (book != null && customerName != null && !customerName.isEmpty()) {
            double price = book.getPrice();
            double total = price * quantity;

            BillBean bill = new BillBean();
            bill.setItemCode(itemCode);
            bill.setTitle(book.getTitle());
            bill.setPrice(price);
            bill.setQuantity(quantity);
            bill.setTotal(total);
            bill.setCustomerName(customerName);

            BillingDao.saveBill(bill);

            request.setAttribute("bill", bill);
            request.getRequestDispatcher("Views/billreceipt.jsp").forward(request, response);
        } else {
            response.sendRedirect("Views/billing.jsp?error=notfound");
        }
    }
}
