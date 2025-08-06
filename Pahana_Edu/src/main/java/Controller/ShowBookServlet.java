package Controller;

import dao.ShowBookDao;
import model.ShowBookBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/ShowBookServlet")
public class ShowBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ShowBookBean> books = ShowBookDao.getAllBooks();
        request.setAttribute("bookList", books);
        request.getRequestDispatcher("Views/booklist.jsp").forward(request, response);
    }
}
