package dao;

import model.ShowBookBean;

import java.sql.*;
import java.util.*;
import java.util.Base64;
import java.io.InputStream;

public class ShowBookDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/store";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static List<ShowBookBean> getAllBooks() {
        List<ShowBookBean> list = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM books";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ShowBookBean book = new ShowBookBean();
                book.setItem_code(rs.getString("item_code"));
                book.setTitle(rs.getString("title_name"));
                book.setAuthor(rs.getString("author_name"));
                book.setPublisher(rs.getString("publisher_name"));
                book.setPrice(rs.getDouble("price_value"));
                book.setQuantity(rs.getInt("quantity_value"));

                Blob blob = rs.getBlob("cover_image");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    byte[] bytes = inputStream.readAllBytes();
                    String base64Image = Base64.getEncoder().encodeToString(bytes);
                    book.setBase64Image(base64Image);
                }

                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
