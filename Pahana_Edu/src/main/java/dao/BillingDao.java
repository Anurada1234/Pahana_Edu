package dao;

import java.sql.*;
import model.BillBean;

public class BillingDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/store";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static boolean saveBill(BillBean bill) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bills (item_code, title, price, quantity, total, bill_date) VALUES (?, ?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, bill.getItemCode());
            stmt.setString(2, bill.getTitle());
            stmt.setDouble(3, bill.getPrice());
            stmt.setInt(4, bill.getQuantity());
            stmt.setDouble(5, bill.getTotal());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Bill save error: " + e);
            return false;
        }
    }
}
