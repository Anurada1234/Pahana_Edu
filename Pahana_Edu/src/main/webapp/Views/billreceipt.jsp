<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="model.BillBean" %>
<%
    BillBean bill = (BillBean) request.getAttribute("bill");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Receipt – Pahana Bookshop</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            padding: 30px 40px;
            max-width: 550px;
            width: 100%;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        h2 {
            font-weight: bold;
            margin-bottom: 25px;
        }

        .receipt-detail {
            font-size: 1.05rem;
            margin-bottom: 8px;
            text-align: left;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 25px;
        }

        /* Hide buttons when printing */
        @media print {
            .btn-group {
                display: none !important;
            }
        }
    </style>

    <script>
        function printReceipt() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="card">
        <h2 class="text-center"><i class="bi bi-receipt-cutoff me-2"></i>Bill Receipt – Pahana Bookshop</h2>
        <hr>

        <div class="receipt-detail"><strong>Item Code:</strong> <%= bill.getItemCode() %></div>
        <div class="receipt-detail"><strong>Customer:</strong> <%= bill.getCustomerName() %></div>
        <div class="receipt-detail"><strong>Title:</strong> <%= bill.getTitle() %></div>
        <div class="receipt-detail"><strong>Price:</strong> Rs. <%= bill.getPrice() %></div>
        <div class="receipt-detail"><strong>Quantity:</strong> <%= bill.getQuantity() %></div>
        <div class="receipt-detail"><strong>Total:</strong> Rs. <%= bill.getTotal() %></div>

        <div class="btn-group">
            <!-- Submit Button -->
            <form action="<%= request.getContextPath() %>/SaveBillServlet" method="post">
                <input type="hidden" name="itemCode" value="<%= bill.getItemCode() %>"/>
                <input type="hidden" name="CustomerName" value="<%= bill.getCustomerName() %>"/>
                <input type="hidden" name="title" value="<%= bill.getTitle() %>"/>
                <input type="hidden" name="price" value="<%= bill.getPrice() %>"/>
                <input type="hidden" name="quantity" value="<%= bill.getQuantity() %>"/>
                <input type="hidden" name="total" value="<%= bill.getTotal() %>"/>
                <button type="submit" class="btn btn-primary" onclick="this.disabled=true; this.form.submit();">
                    <i class="bi bi-check2-circle"></i> Submit
                </button>
            </form>

            <!-- Print Button -->
            <button type="button" class="btn btn-success" onclick="printReceipt()">
                <i class="bi bi-printer"></i> Print
            </button>
        </div>
    </div>
</body>
</html>
