package Controller;

import dao.BillingDao;
import model.BillBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/SaveBillServlet")
public class SaveBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemCode = request.getParameter("itemCode");
        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double total = price * quantity;

        BillBean bill = new BillBean();
        bill.setItemCode(itemCode);
        bill.setTitle(title);
        bill.setPrice(price);
        bill.setQuantity(quantity);
        bill.setTotal(total);

        boolean success = BillingDao.saveBill(bill);

        if (success) {
            request.setAttribute("bill", bill);
            request.getRequestDispatcher("Views/billreceipt.jsp").forward(request, response);
        } else {
            response.getWriter().println("Failed to save bill.");
        }
    }
}
