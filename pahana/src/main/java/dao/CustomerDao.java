package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.CustomerBean;

public class CustomerDao {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "");
    }

    // Insert new customer
    public boolean insertCustomer(CustomerBean customer) throws Exception {
        System.out.println(">>> insertCustomer called");

        String sql = "INSERT INTO customers (accnumber, name, address, contact) VALUES (?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, customer.getAccNumber());
            st.setString(2, customer.getName());
            st.setString(3, customer.getAddress());
            st.setString(4, customer.getContact());

            int rowsInserted = st.executeUpdate();
            System.out.println(">>> Rows inserted: " + rowsInserted);
            return rowsInserted > 0;
        } catch (Exception e) {
            System.err.println(">>> Error inserting customer: " + e.getMessage());
            return false;
        }
    }

    // Search customer by account number
    public CustomerBean searchCustomer(String accnumber) throws Exception {
        System.out.println(">>> searchCustomer called for accnumber: " + accnumber);

        String sql = "SELECT * FROM customers WHERE accnumber = ?";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, accnumber);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                CustomerBean customer = new CustomerBean();
                customer.setAccNumber(rs.getString("accnumber"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setContact(rs.getString("contact"));

                System.out.println(">>> Customer found.");
                return customer;
            } else {
                System.out.println(">>> Customer not found.");
            }
        } catch (Exception e) {
            System.err.println(">>> Error searching customer: " + e.getMessage());
        }

        return null;
    }

    // Update customer by account number
    public boolean updateCustomer(CustomerBean customer) throws Exception {
        System.out.println(">>> updateCustomer called for accnumber: " + customer.getAccNumber());

        String sql = "UPDATE customers SET name = ?, address = ?, contact = ? WHERE accnumber = ?";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, customer.getName());
            st.setString(2, customer.getAddress());
            st.setString(3, customer.getContact());
            st.setString(4, customer.getAccNumber());

            int rowsUpdated = st.executeUpdate();
            System.out.println(">>> Rows updated: " + rowsUpdated);
            return rowsUpdated > 0;
        } catch (Exception e) {
            System.err.println(">>> Error updating customer: " + e.getMessage());
            return false;
        }
    }

    // Delete customer by account number
    public boolean deleteCustomer(String accnumber) throws Exception {
        System.out.println(">>> deleteCustomer called for accnumber: " + accnumber);

        String sql = "DELETE FROM customers WHERE accnumber = ?";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, accnumber);

            int rowsDeleted = st.executeUpdate();
            System.out.println(">>> Rows deleted: " + rowsDeleted);
            return rowsDeleted > 0;
        } catch (Exception e) {
            System.err.println(">>> Error deleting customer: " + e.getMessage());
            return false;
        }
    }
}
