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
      padding: 0;
    }
    body {
      background: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1920&auto=format&fit=crop') center/cover no-repeat fixed;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative; /* required for absolute positioning */
    }
    .card {
      background-color: rgba(255,255,255,0.95);
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      padding: 15px;
      max-width: 750px;
      width: 100%;
    }
    .form-label { font-weight: bold; font-size: 0.9rem; }
    .mb-3 { margin-bottom: 0.5rem !important; }
    .input-group-text { padding: 0.3rem 0.5rem; }
    input, select { padding: 0.25rem 0.4rem !important; font-size: 0.9rem !important; }
    .card h2 {
      font-size: 1.5rem;
      margin-bottom: 1rem;
      padding: 0.5rem 1rem;
      background: linear-gradient(#9999FF);
      color: white;
      text-align: center;
      border-radius: 10px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }
    .card h2 i {
      font-size: 1.6rem;
      vertical-align: middle;
      margin-right: 0.3rem;
    }
    .action-buttons {
      display: flex;
      justify-content: center;
      gap: 5px;
      flex-wrap: wrap;
      margin-top: 0.5rem;
    }
    .action-buttons .btn {
      padding: 0.2rem 0.3rem;
      font-size: 0.8rem;
      font-weight: 400;
      border-width: 1px;
    }
    /* Back button styling */
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
  <h2>
    <i class="bi bi-journal-plus"></i>Manage Book Records
  </h2>

  <!-- Display message -->
  <%
      String message = (String) request.getAttribute("message");
      if (message != null) {
  %>
      <div class="alert alert-info text-center p-2 m-0"><%= message %></div>
  <%
      }
      BookBean book = (BookBean) request.getAttribute("book");
  %>

  <form action="<%=request.getContextPath()%>/BookActionServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" id="formAction" value="insert">

    <!-- Item Code with Search button -->
    <div class="mb-3">
      <label for="itemCode" class="form-label">Item Code</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-upc-scan fs-6"></i></span>
        <input type="text" class="form-control" id="itemCode" name="itemCode"
               value="<%= (book != null) ? book.getItem_code() : "" %>"
               placeholder="e.g. B001" required>
        <button type="submit" class="btn btn-primary btn-sm" onclick="setAction('search')">
          <i class="bi bi-search me-1"></i>Search
        </button>
      </div>
    </div>

    <!-- Title -->
    <div class="mb-3">
      <label for="title" class="form-label">Book Title</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-book fs-6"></i></span>
        <input type="text" class="form-control" id="title" name="title"
               value="<%= (book != null) ? book.getTitle() : "" %>"
               placeholder="Enter title">
      </div>
    </div>

    <!-- Author -->
    <div class="mb-3">
      <label for="author" class="form-label">Author</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-person fs-6"></i></span>
        <input type="text" class="form-control" id="author" name="author"
               value="<%= (book != null) ? book.getAuthor() : "" %>"
               placeholder="Enter author name">
      </div>
    </div>

    <!-- Publisher -->
    <div class="mb-3">
      <label for="publisher" class="form-label">Publisher</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-journal fs-6"></i></span>
        <input type="text" class="form-control" id="publisher" name="publisher"
               value="<%= (book != null) ? book.getPublisher() : "" %>"
               placeholder="Enter publisher">
      </div>
    </div>

    <!-- Price & Quantity in one row -->
    <div class="row mb-3">
      <div class="col">
        <label for="price" class="form-label">Price (LKR)</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-currency-dollar fs-6"></i></span>
          <input type="number" step="0.01" class="form-control" id="price" name="price"
                 value="<%= (book != null) ? book.getPrice() : "" %>" placeholder="500.00">
        </div>
      </div>
      <div class="col">
        <label for="quantity" class="form-label">Quantity</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-box-seam fs-6"></i></span>
          <input type="number" class="form-control" id="quantity" name="quantity"
                 value="<%= (book != null) ? book.getQuantity() : "" %>" placeholder="10">
        </div>
      </div>
    </div>

    <!-- Cover Image -->
    <div class="mb-3">
      <label for="coverImage" class="form-label">Cover Image</label>
      <input class="form-control" type="file" id="coverImage" name="coverImage" accept="image/*">
    </div>

    <!-- Bottom Action Buttons -->
    <div class="action-buttons">
      <button type="submit" class="btn btn-success btn-sm" onclick="setAction('insert')">
        <i class="bi bi-plus-circle me-1"></i>Insert
      </button>
      <button type="submit" class="btn btn-warning btn-sm" onclick="setAction('update')">
        <i class="bi bi-arrow-repeat me-1"></i>Update
      </button>
      <button type="submit" class="btn btn-danger btn-sm" onclick="setAction('delete')">
        <i class="bi bi-trash me-1"></i>Delete
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
