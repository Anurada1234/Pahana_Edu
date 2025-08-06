package dao;

import model.ShowCustomerBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowCustomerDao {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "");
    }

    public List<ShowCustomerBean> getAllCustomers() throws Exception {
        List<ShowCustomerBean> list = new ArrayList<>();

        String sql = "SELECT * FROM customers";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                ShowCustomerBean customer = new ShowCustomerBean();
                customer.setAccNumber(rs.getString("accnumber"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setContact(rs.getString("contact"));
                list.add(customer);
            }
        }

        return list;
    }
}
