<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ShowCustomerBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer List – Pahana Edu Bookshop</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

  <style>
    body {
      background: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
      padding: 20px;
    }

    .card {
      background-color: rgba(255, 255, 255, 0.65); /* More transparent */
      padding: 30px;
      border-radius: 15px;
      width: 100%;
      max-width: 1000px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
      backdrop-filter: blur(10px); /* Stronger glass effect */
    }

    .table th, .table td {
      vertical-align: middle;
    }

    h3 {
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="card">
    <h3 class="text-center mb-4">
      <i class="bi bi-people-fill me-2"></i>All Customers
    </h3>

    <table class="table table-bordered table-hover align-middle mb-0">
      <thead class="table-dark">
        <tr>
          <th>Account Number</th>
          <th>Name</th>
          <th>Address</th>
          <th>Contact</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<ShowCustomerBean> customerList = (List<ShowCustomerBean>) request.getAttribute("customerList");
          if (customerList != null && !customerList.isEmpty()) {
            for (ShowCustomerBean c : customerList) {
        %>
          <tr>
            <td><%= c.getAccNumber() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getContact() %></td>
          </tr>
        <%
            }
          } else {
        %>
          <tr>
            <td colspan="4" class="text-center text-muted">No customer records found.</td>
          </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</body>
</html>
