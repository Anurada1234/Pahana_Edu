<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.BookBean,dao.BookDao" %>
<%
    String itemCode = request.getParameter("itemCode");
    BookBean book = null;
    if (itemCode != null && !itemCode.trim().isEmpty()) {
        book = BookDao.getBookByItemCode(itemCode);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Billing – Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            background: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1920&auto=format&fit=crop') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .card {
            background-color: rgba(255,255,255,0.95);
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
            max-width: 750px;
            width: 100%;
        }
        .form-label {
            font-weight: bold;
        }
        .btn {
            min-width: 120px;
        }
    </style>
</head>
<body>

<div class="card">
    <h2 class="text-center mb-4">
        <i class="bi bi-receipt-cutoff me-2"></i>Generate Bill
    </h2>

    <!-- Search Form -->
    <form method="get" action="billing.jsp" class="mb-4">
        <div class="mb-3">
            <label class="form-label">Enter Item Code</label>
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-upc-scan fs-5"></i></span>
                <input type="text" class="form-control" name="itemCode" 
                       value="<%= itemCode != null ? itemCode : "" %>" required>
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-search"></i> Search
                </button>
            </div>
        </div>
    </form>

    <% if (book != null) { %>
        <!-- Book Details & Billing Form -->
        <form action="<%= request.getContextPath() %>/BillingServlet" method="post">
            <input type="hidden" name="itemCode" value="<%= book.getItem_code() %>"/>
            
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" class="form-control" value="<%= book.getTitle() %>" readonly>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Price (LKR)</label>
                <input type="text" class="form-control" value="<%= book.getPrice() %>" readonly>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Enter Quantity</label>
                <input type="number" class="form-control" name="quantity" min="1" required>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-success">
                    <i class="bi bi-cash-stack me-1"></i> Generate Bill
                </button>
            </div>
        </form>
    <% } else if (itemCode != null) { %>
        <div class="alert alert-danger text-center">
            <i class="bi bi-exclamation-triangle me-2"></i>
            No book found with item code <strong><%= itemCode %></strong>
        </div>
    <% } %>

</div>

</body>
</html>
