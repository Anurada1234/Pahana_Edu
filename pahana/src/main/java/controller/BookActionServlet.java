package controller;

import dao.BookDao;
import model.BookBean;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/BookActionServlet")
@MultipartConfig
public class BookActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String itemCode = request.getParameter("itemCode");
        if (itemCode != null) itemCode = itemCode.trim();

        System.out.println("Action: " + action + ", itemCode: " + itemCode);

        try {
            switch (action) {
                case "insert":
                    BookBean newBook = new BookBean();
                    newBook.setItem_code(itemCode);
                    newBook.setTitle(request.getParameter("title"));
                    newBook.setAuthor(request.getParameter("author"));
                    newBook.setPublisher(request.getParameter("publisher"));
                    newBook.setPrice(Double.parseDouble(request.getParameter("price")));
                    newBook.setQuantity(Integer.parseInt(request.getParameter("quantity")));

                    Part imagePart = request.getPart("coverImage");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        newBook.setCoverImage(imagePart.getInputStream());
                    }

                    if (BookDao.saveItem(newBook)) {
                        request.setAttribute("message", "Book saved successfully.");
                    } else {
                        request.setAttribute("message", "Failed to save book.");
                    }
                    break;

                case "search":
                    BookBean book = BookDao.getBookByItemCode(itemCode);
                    if (book != null) {
                        request.setAttribute("book", book);
                        request.setAttribute("message", "Book found.");
                    } else {
                        request.setAttribute("message", "Book not found.");
                    }
                    break;

                case "update":
                    BookBean updateBook = new BookBean();
                    updateBook.setItem_code(itemCode);
                    updateBook.setTitle(request.getParameter("title"));
                    updateBook.setAuthor(request.getParameter("author"));
                    updateBook.setPublisher(request.getParameter("publisher"));
                    updateBook.setPrice(Double.parseDouble(request.getParameter("price")));
                    updateBook.setQuantity(Integer.parseInt(request.getParameter("quantity")));

                    Part updatePart = request.getPart("coverImage");
                    if (updatePart != null && updatePart.getSize() > 0) {
                        updateBook.setCoverImage(updatePart.getInputStream());
                    }

                    if (BookDao.updateItem(updateBook)) {
                        request.setAttribute("message", "Book updated successfully.");
                    } else {
                        request.setAttribute("message", "Failed to update book.");
                    }
                    break;

                case "delete":
                    if (BookDao.deleteItem(itemCode)) {
                        request.setAttribute("message", "Book deleted successfully.");
                    } else {
                        request.setAttribute("message", "Failed to delete book.");
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("Views/item.jsp").forward(request, response);
    }
}
