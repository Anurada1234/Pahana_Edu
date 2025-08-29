<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.BookBean, dao.BookDao, model.CustomerBean, dao.BillingDao" %>
<%
    String itemCode = request.getParameter("itemCode");
    BookBean book = null;
    if (itemCode != null && !itemCode.trim().isEmpty()) {
        book = BookDao.getBookByItemCode(itemCode);
    }
    java.util.List<CustomerBean> customers = BillingDao.getAllCustomers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Billing – Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
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
        }
    </style>
</head>
<body>
<!-- Back Button -->
<a href="dashboard.jsp" class="btn btn-outline-dark back-btn">
    <i class="bi bi-arrow-left-circle"></i> Back
</a>

<div class="card">
    <h3 class="text-center mb-4"><i class="bi bi-receipt-cutoff me-2"></i>Generate Bill</h3>

    <!-- Item code search -->
    <form method="get" action="billing.jsp" class="mb-3">
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-upc-scan"></i></span>
            <input type="text" name="itemCode" class="form-control" placeholder="Enter Item Code"
                   value="<%= itemCode != null ? itemCode : "" %>" required/>
            <button type="submit" class="btn btn-primary" title="Search"><i class="bi bi-search"></i></button>
        </div>
    </form>

    <% if (book != null) { %>
        <form action="<%= request.getContextPath() %>/BillingServlet" method="post">
            <input type="hidden" name="itemCode" value="<%= book.getItem_code() %>"/>

            <!-- Customer dropdown -->
            <div class="mb-3">
                <label class="form-label">Customer</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                    <select name="customerName" class="form-select" required>
                        <option value="">-- Select Customer --</option>
                        <% for(CustomerBean c : customers) { %>
                            <option value="<%= c.getName() %>"><%= c.getName() %></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <!-- Title -->
            <div class="mb-3">
                <label class="form-label">Title</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-book-fill"></i></span>
                    <input type="text" class="form-control" value="<%= book.getTitle() %>" readonly/>
                </div>
            </div>

            <!-- Price -->
            <div class="mb-3">
                <label class="form-label">Price</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                    <input type="text" class="form-control" value="<%= book.getPrice() %>" readonly/>
                </div>
            </div>

            <!-- Quantity -->
            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-123"></i></span>
                    <input type="number" name="quantity" class="form-control" min="1" required/>
                </div>
            </div>

            <!-- Submit -->
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-success mt-2">
                    <i class="bi bi-receipt me-1"></i>Generate Bill
                </button>
            </div>
        </form>
    <% } %>
</div>
</body>
</html>
