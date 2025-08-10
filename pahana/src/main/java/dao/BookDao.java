package dao;

import java.sql.*;
import model.BookBean;

public class BookDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/store";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found: " + e);
        }
    }

    // Save new book
    public static boolean saveItem(BookBean book) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO books (item_code, title_name, author_name, publisher_name, price_value, quantity_value, cover_image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, book.getItem_code());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getAuthor());
            stmt.setString(4, book.getPublisher());
            stmt.setDouble(5, book.getPrice());
            stmt.setInt(6, book.getQuantity());
            stmt.setBlob(7, book.getCoverImage());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Insert error: " + e);
            return false;
        }
    }

    // Fetch book by item code (used in billing.jsp)
    public static BookBean getBookByItemCode(String itemCode) {
        BookBean book = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM books WHERE item_code = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemCode);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                book = new BookBean();
                book.setItem_code(rs.getString("item_code"));
                book.setTitle(rs.getString("title_name"));
                book.setAuthor(rs.getString("author_name"));
                book.setPublisher(rs.getString("publisher_name"));
                book.setPrice(rs.getDouble("price_value"));
                book.setQuantity(rs.getInt("quantity_value"));
                // Image is optional
            }
        } catch (Exception e) {
            System.out.println("Search error: " + e);
        }
        return book;
    }

    // Update book
    public static boolean updateItem(BookBean book) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql;
            PreparedStatement stmt;

            if (book.getCoverImage() != null) {
                sql = "UPDATE books SET title_name=?, author_name=?, publisher_name=?, price_value=?, quantity_value=?, cover_image=? WHERE item_code=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, book.getTitle());
                stmt.setString(2, book.getAuthor());
                stmt.setString(3, book.getPublisher());
                stmt.setDouble(4, book.getPrice());
                stmt.setInt(5, book.getQuantity());
                stmt.setBlob(6, book.getCoverImage());
                stmt.setString(7, book.getItem_code());
            } else {
                sql = "UPDATE books SET title_name=?, author_name=?, publisher_name=?, price_value=?, quantity_value=? WHERE item_code=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, book.getTitle());
                stmt.setString(2, book.getAuthor());
                stmt.setString(3, book.getPublisher());
                stmt.setDouble(4, book.getPrice());
                stmt.setInt(5, book.getQuantity());
                stmt.setString(6, book.getItem_code());
            }

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Update error: " + e);
            return false;
        }
    }

    // Delete book
    public static boolean deleteItem(String itemCode) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM books WHERE item_code = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemCode);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Delete error: " + e);
            return false;
        }
    }
}
