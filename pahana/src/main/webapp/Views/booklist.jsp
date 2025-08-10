<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.ShowBookBean" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book List – Pahana Edu Bookshop</title>

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
      max-width: 1100px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
      backdrop-filter: blur(10px); /* Glassmorphic effect */
    }

    h3 {
      font-weight: bold;
    }

    .table th, .table td {
      vertical-align: middle;
    }

    img {
      border-radius: 5px;
      object-fit: cover;
    }
  </style>
</head>
<body>
  <div class="card">
    <h3 class="text-center mb-4">
      <i class="bi bi-book-half me-2"></i>All Book Records
    </h3>

    <%
        List<ShowBookBean> bookList = (List<ShowBookBean>) request.getAttribute("bookList");
    %>

    <table class="table table-bordered table-hover text-center align-middle">
      <thead class="table-dark">
        <tr>
          <th>Item Code</th>
          <th>Title</th>
          <th>Author</th>
          <th>Publisher</th>
          <th>Price (LKR)</th>
          <th>Quantity</th>
          <th>Cover Image</th>
        </tr>
      </thead>
      <tbody>
      <%
          if (bookList != null && !bookList.isEmpty()) {
              for (ShowBookBean book : bookList) {
      %>
          <tr>
            <td><%= book.getItem_code() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublisher() %></td>
            <td><%= book.getPrice() %></td>
            <td><%= book.getQuantity() %></td>
            <td>
              <% if (book.getBase64Image() != null) { %>
                <img src="data:image/jpeg;base64,<%= book.getBase64Image() %>" width="80" height="100" />
              <% } else { %>
                <span>No Image</span>
              <% } %>
            </td>
          </tr>
      <%
              }
          } else {
      %>
          <tr>
            <td colspan="7" class="text-center text-muted">No books found.</td>
          </tr>
      <%
          }
      %>
      </tbody>
    </table>
  </div>
</body>
</html>
