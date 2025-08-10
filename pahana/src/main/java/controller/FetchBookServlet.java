package controller;

import com.google.gson.Gson;
import dao.BookDao;
import model.BookBean;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/FetchBookServlet")
public class FetchBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao;

    public void init() {
        bookDao = new BookDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemCode = request.getParameter("item_code");
        BookBean book = bookDao.getBookByItemCode(itemCode);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (book != null) {
            String json = new Gson().toJson(book);
            out.print(json);
        } else {
            out.print("{}");  // Return empty JSON if not found
        }

        out.flush();
    }
}
