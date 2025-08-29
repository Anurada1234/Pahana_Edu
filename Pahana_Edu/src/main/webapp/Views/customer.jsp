<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CustomerBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Management – Pahana Edu Bookshop</title>

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
      position: relative;
    }
    .card {
      background-color: rgba(255,255,255,0.95);
      padding: 30px;
      border-radius: 15px;
      width: 100%;
      max-width: 600px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }
    .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      z-index: 10;
    }
  </style>
</head>
<body>
  <!-- Back Button -->
  <a href="dashboard.jsp" class="btn btn-outline-light back-btn">
    <i class="bi bi-arrow-left-circle me-1"></i> Back
  </a>

  <div class="card">
    <h3 class="text-center mb-4"><i class="bi bi-person-circle me-2"></i>Customer Management</h3>

    <%
      String message = (String) request.getAttribute("message");
      String messageType = (String) request.getAttribute("messageType");
      CustomerBean customer = (CustomerBean) request.getAttribute("customer");

      if (message != null) {
    %>
      <div class="alert alert-<%= messageType != null ? messageType : "info" %>">
        <%= message %>
      </div>
    <%
      }
    %>

    <form action="<%= request.getContextPath() %>/CustomerActionServlet" method="post">
      <!-- Account Number -->
      <div class="mb-3">
        <label class="form-label">Account Number</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-credit-card-2-front-fill"></i></span>
          <input type="text" class="form-control" name="accnumber" required
                 value="<%= customer != null ? customer.getAccNumber() : "" %>">
          <button class="btn btn-secondary" name="action" value="search" title="Search"><i class="bi bi-search"></i></button>
        </div>
      </div>

      <!-- Name -->
      <div class="mb-3">
        <label class="form-label">Full Name</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
          <input type="text" class="form-control" name="name"
                 value="<%= customer != null ? customer.getName() : "" %>">
        </div>
      </div>

      <!-- Address -->
      <div class="mb-3">
        <label class="form-label">Address</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-house-door-fill"></i></span>
          <textarea class="form-control" name="address" rows="3"><%= customer != null ? customer.getAddress() : "" %></textarea>
        </div>
      </div>

      <!-- Contact -->
      <div class="mb-3">
        <label class="form-label">Contact Number</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
          <input type="text" class="form-control" name="contact"
                 value="<%= customer != null ? customer.getContact() : "" %>">
        </div>
      </div>

      <!-- Buttons -->
      <div class="d-flex justify-content-center gap-3 mt-4 flex-wrap">
        <button type="submit" class="btn btn-success" name="action" value="save"><i class="bi bi-save2-fill me-1"></i>Save</button>
        <button type="submit" class="btn btn-primary" name="action" value="update"><i class="bi bi-pencil-fill me-1"></i>Update</button>
        <button type="submit" class="btn btn-danger" name="action" value="delete"><i class="bi bi-trash-fill me-1"></i>Delete</button>
      </div>
    </form>
  </div>
</body>
</html>
