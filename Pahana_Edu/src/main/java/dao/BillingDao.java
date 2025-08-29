package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.BillBean;
import model.CustomerBean;

public class BillingDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/store";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Save bill including customer name
    public static boolean saveBill(BillBean bill) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bills (item_code, title, price, quantity, total, name, bill_date) VALUES (?, ?, ?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, bill.getItemCode());
            stmt.setString(2, bill.getTitle());
            stmt.setDouble(3, bill.getPrice());
            stmt.setInt(4, bill.getQuantity());
            stmt.setDouble(5, bill.getTotal());
            stmt.setString(6, bill.getCustomerName()); // <-- save customer name
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Bill save error: " + e);
            return false;
        }
    }

    // Get all customers from database
    public static List<CustomerBean> getAllCustomers() {
        List<CustomerBean> customers = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT accnumber, name FROM customers";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CustomerBean customer = new CustomerBean();
                customer.setAccNumber(rs.getString("accnumber"));
                customer.setName(rs.getString("name"));
                customers.add(customer);
            }
        } catch (Exception e) {
            System.out.println("Fetch customers error: " + e);
        }
        return customers;
    }
}
