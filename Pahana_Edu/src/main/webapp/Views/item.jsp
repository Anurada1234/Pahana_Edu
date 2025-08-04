<%@ page import="model.BookBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book Management – Pahana Edu Bookshop</title>
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
    }
    .card {
      background-color: rgba(255,255,255,0.95);
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      padding: 30px;
      max-width: 750px;
      width: 100%;
    }
    .form-label { font-weight: bold; }
    .action-buttons { display: flex; gap: 10px; flex-wrap: wrap; justify-content: space-between; }
  </style>
</head>
<body>
<div class="card">
  <h2 class="text-center">
    <i class="bi bi-journal-plus me-2"></i>Manage Book Records
  </h2>

  <!-- Display message -->
  <%
      String message = (String) request.getAttribute("message");
      if (message != null) {
  %>
      <div class="alert alert-info text-center"><%= message %></div>
  <%
      }

      BookBean book = (BookBean) request.getAttribute("book");
  %>

  <form action="<%=request.getContextPath()%>/BookActionServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" id="formAction" value="insert">

    <!-- Item Code -->
    <div class="mb-3">
      <label for="itemCode" class="form-label">Item Code</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-upc-scan fs-5"></i></span>
        <input type="text" class="form-control" id="itemCode" name="itemCode"
               value="<%= (book != null) ? book.getItem_code() : "" %>"
               placeholder="e.g. B001" required>
      </div>
    </div>

    <!-- Title -->
    <div class="mb-3">
      <label for="title" class="form-label">Book Title</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-book fs-5"></i></span>
        <input type="text" class="form-control" id="title" name="title"
               value="<%= (book != null) ? book.getTitle() : "" %>"
               placeholder="Enter title">
      </div>
    </div>

    <!-- Author -->
    <div class="mb-3">
      <label for="author" class="form-label">Author</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-person fs-5"></i></span>
        <input type="text" class="form-control" id="author" name="author"
               value="<%= (book != null) ? book.getAuthor() : "" %>"
               placeholder="Enter author name">
      </div>
    </div>

    <!-- Publisher -->
    <div class="mb-3">
      <label for="publisher" class="form-label">Publisher</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-journal fs-5"></i></span>
        <input type="text" class="form-control" id="publisher" name="publisher"
               value="<%= (book != null) ? book.getPublisher() : "" %>"
               placeholder="Enter publisher">
      </div>
    </div>

    <!-- Price -->
    <div class="mb-3">
      <label for="price" class="form-label">Price (LKR)</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-currency-dollar fs-5"></i></span>
        <input type="number" step="0.01" class="form-control" id="price" name="price"
               value="<%= (book != null) ? book.getPrice() : "" %>"
               placeholder="e.g. 500.00">
      </div>
    </div>

    <!-- Quantity -->
    <div class="mb-3">
      <label for="quantity" class="form-label">Quantity</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-box-seam fs-5"></i></span>
        <input type="number" class="form-control" id="quantity" name="quantity"
               value="<%= (book != null) ? book.getQuantity() : "" %>"
               placeholder="e.g. 10">
      </div>
    </div>

    <!-- Cover Image -->
    <div class="mb-4">
      <label for="coverImage" class="form-label">Cover Image</label>
      <input class="form-control" type="file" id="coverImage" name="coverImage" accept="image/*">
    </div>

    <!-- Action Buttons -->
    <div class="action-buttons">
      <button type="submit" class="btn btn-success" onclick="setAction('insert')">
        <i class="bi bi-plus-circle me-1"></i>Insert
      </button>
      <button type="submit" class="btn btn-primary" onclick="setAction('search')">
        <i class="bi bi-search me-1"></i>Search
      </button>
      <button type="submit" class="btn btn-warning" onclick="setAction('update')">
        <i class="bi bi-arrow-repeat me-1"></i>Update
      </button>
      <button type="submit" class="btn btn-danger" onclick="setAction('delete')">
        <i class="bi bi-trash me-1"></i>Delete
      </button>
      <button type="reset" class="btn btn-secondary">
        <i class="bi bi-eraser-fill me-1"></i>Clear
      </button>
    </div>
  </form>
</div>

<script>
  function setAction(action) {
    document.getElementById("formAction").value = action;
  }
</script>
</body>
</html>
