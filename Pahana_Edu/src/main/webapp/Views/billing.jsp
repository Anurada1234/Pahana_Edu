<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="model.BookBean,dao.BookDao" %>
<%
    String itemCode = request.getParameter("itemCode");
    BookBean book = null;
    if (itemCode != null && !itemCode.trim().isEmpty()) {
        book = BookDao.getBookByItemCode(itemCode);
    }
%>
<html>
<head>
    <title>Billing – Pahana Bookshop</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; padding: 30px; }
        form, table { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px #ccc; }
        input[type=text], input[type=number] { width: 100%; padding: 8px; margin: 5px 0; }
        input[type=submit] { background: green; color: white; padding: 10px 20px; border: none; border-radius: 5px; }
    </style>
</head>
<body>

<h2>Generate Bill</h2>
<form method="get" action="billing.jsp">
    <label>Enter Item Code:</label>
    <input type="text" name="itemCode" value="<%= itemCode != null ? itemCode : "" %>" required />
    <input type="submit" value="Search" />
</form>

<% if (book != null) { %>
<form action="<%= request.getContextPath() %>/BillingServlet" method="post">
    <input type="hidden" name="itemCode" value="<%= book.getItem_code() %>"/>
    <p><strong>Title:</strong> <%= book.getTitle() %></p>
    <p><strong>Price:</strong> Rs. <%= book.getPrice() %></p>
    <label>Enter Quantity:</label>
    <input type="number" name="quantity" min="1" required />
    <input type="submit" value="Generate Bill" />
</form>
<% } else if (itemCode != null) { %>
<p style="color: red;">No book found with item code <%= itemCode %></p>
<% } %>

</body>
</html>
