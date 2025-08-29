<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Bookshop Billing</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <style>
    body {
      display: flex;
      min-height: 100vh;
      background: #f4f6f9;
    }
    #sidebar {
      width: 240px;
      background: #343a40;
      color: #fff;
      flex-shrink: 0;
    }
    #sidebar .nav-link {
      color: #ccc;
    }
    #sidebar .nav-link.active,
    #sidebar .nav-link:hover {
      background: none;
      color: #fff;
    }
    .content-wrapper {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }
    .hero {
      position: relative;
      height: 50vh;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.5);
      z-index: 1;
    }
    .hero img {
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      opacity: 0;
      animation: slide 25s infinite;
      transform: scale(1);
    }
    .hero img:nth-child(1) { animation-delay: 0s; }
    .hero img:nth-child(2) { animation-delay: 5s; }
    .hero img:nth-child(3) { animation-delay: 10s; }
    .hero img:nth-child(4) { animation-delay: 15s; }
    .hero img:nth-child(5) { animation-delay: 20s; }
    .hero h1 { margin-top: 110px; }
    .hero-content {
      position: relative;
      z-index: 2;
      text-align: center;
      color: #fff;
    }
    @keyframes slide {
      0%, 100% { opacity: 0; transform: scale(1); }
      5%, 25% { opacity: 1; transform: scale(1.05); }
      30% { opacity: 0; transform: scale(1.1); }
    }
    .section { padding: 4rem 0; }
    .bg-alt { background: #f8f9fa; }
    @media (max-width: 768px) {
      #sidebar { display: none; }
    }
    #contact { padding-bottom: 110px; }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <nav id="sidebar" class="d-flex flex-column p-3">
    <a href="#" class="d-flex align-items-center mb-3 text-white text-decoration-none">
      <i class="bi bi-book-half fs-4 me-2"></i><span class="fs-4">Pahana Edu</span>
    </a>
    <hr />
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="customer.jsp" class="nav-link">
          <i class="bi bi-people me-2"></i> Customer
        </a>
      </li>
      <li class="nav-item">
        <a href="item.jsp" class="nav-link">
          <i class="bi bi-book me-2"></i> Item
        </a>
      </li>
      <li class="nav-item">
        <a href="billing.jsp" class="nav-link">
          <i class="bi bi-cash-coin me-2"></i> Billing
        </a>
      </li>
    </ul>
    <hr />
    <div class="mt-auto">
      <!-- Help button -->
      <a href="help.jsp" class="btn btn-warning w-100 mb-2">
        <i class="bi bi-question-circle me-1"></i> Help
      </a>
      <!-- Logout with confirmation -->
      <a href="logout.jsp" class="btn btn-danger w-100" onclick="return confirmLogout()">
        <i class="bi bi-box-arrow-right me-1"></i> Logout
      </a>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="content-wrapper">
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm d-md-none">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Bookshop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div id="navMenu" class="collapse navbar-collapse">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="#hero">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#invoices">Invoices</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Hero Slideshow -->
    <header id="hero" class="hero">
      <img src="https://static.vecteezy.com/system/resources/previews/050/391/396/non_2x/empty-wooden-table-top-with-blurred-bookshelves-in-the-background-of-a-bookstore-macro-shot-bookstore-library-background-blurred-design-furniture-book-literature-wooden-table-photo.jpg" alt="" />
      <img src="https://media.istockphoto.com/id/2020715428/photo/books.jpg?s=612x612&w=0&k=20&c=o8R9XFXGvItSpDEikvACtb1-WPNW-OyignUMVJSKOUw=" alt="" />
      <img src="https://media.istockphoto.com/id/1455947864/photo/empty-book-hall-in-a-library.jpg?s=612x612&w=0&k=20&c=Uo7ics6qKPw8gjAwPtVWvHV4mjoQX2Zrx9CKZs0LAIQ=" alt="" />
      <img src="https://offloadmedia.feverup.com/secretldn.com/wp-content/uploads/2020/11/04035636/Bookshop.jpg" alt="" />
      <img src="https://img.freepik.com/premium-photo/book-table-with-many-books-background_1279559-20.jpg" alt="" />
      <div class="hero-content">
        <h1 class="display-4">Welcome to Pahana Edu Bookshop</h1>
        <p class="lead">Quick and easy billing management for the store.</p>
        <a href="<%= request.getContextPath() %>/ShowCustomerServlet" class="btn btn-info me-2">
          <i class="bi bi-people me-1"></i> View All Customers
        </a>
        <a href="<%=request.getContextPath()%>/ShowBookServlet" class="btn btn-info">
          <i class="bi bi-book me-1"></i> View All Books
        </a>
      </div>
    </header>

    <!-- Sections -->
    <section id="about" class="section text-center">
      <div class="container">
        <h2>About Our System</h2>
        <p class="lead">
          First of all, welcome to our Pahana edu bookshop, which is located in Colombo.<br />
          The institution's books are managed through the system.<br />
          We have all types of books in our institution and information about them can be viewed here.
        </p>
      </div>
      <footer class="container">
        <br><br>
        <small>
          📍 No. 123, Main Street, Colombo • ☎️ +94 11 123 4567 • ✉️
          <a href="mailto:info@pahanaedu.lk">info@pahanaedu.lk</a>
        </small>
      </footer>
    </section>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function confirmLogout() {
      return confirm("Are you sure you want to log out?");
    }
  </script>
</body>
</html>
