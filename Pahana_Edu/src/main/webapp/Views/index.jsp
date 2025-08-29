
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pahana Edu - Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      margin: 0;
      height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: #40E0D0;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      z-index: 0;
      background: url('https://images.pexels.com/photos/877971/pexels-photo-877971.jpeg') no-repeat center center fixed;
      background-size: cover;
    }

    /* Overlay to darken background */
    body::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4); /* dark overlay */
      z-index: -1;
    }

    .login-container {
      max-width: 500px;
      width: 100%;
      padding: 40px 35px;
      border-radius: 12px;
      background-color: rgba(195, 248, 255, 0.85);
      box-shadow: 0 8px 25px rgba(44, 62, 80, 0.2);
      border: 1px solid #d1d9e6;
      transition: box-shadow 0.3s ease;
    }

    .login-container:hover {
      box-shadow: 0 12px 40px rgba(44, 62, 80, 0.35);
    }

    .login-header {
      text-align: center;
      margin-bottom: 35px;
    }

    .login-header h2 {
      font-weight: 700;
      color: #1a2947;
      letter-spacing: 1.2px;
      margin-bottom: 8px;
    }

    .login-header p {
      font-size: 1rem;
      color: #4b5d75;
      margin: 0;
    }

    .form-label {
      font-weight: 600;
      color: #3e4e66;
    }

    .form-control {
      border: 1.8px solid #ced4da;
      transition: border-color 0.3s ease;
    }

    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
    }

    .btn-primary {
      background: linear-gradient(45deg, #0066ff, #0052cc);
      border: none;
      font-weight: 600;
      letter-spacing: 0.8px;
      padding: 12px 0;
      transition: background 0.3s ease;
    }

    .btn-primary:hover {
      background: linear-gradient(45deg, #0052cc, #003d99);
    }

    .form-check-label {
      color: #3e4e66;
      font-weight: 500;
    }

    .text-decoration-none {
      color: #0066ff;
      font-weight: 600;
    }

    .text-decoration-none:hover {
      text-decoration: underline;
      color: #003d99;
    }
  </style>
</head>
<body>
  <main class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="login-container" role="main" aria-label="Login form container">
      <div class="login-header">
        <h2>Pahana Edu Bookshop</h2>
        <p>Login to your account</p>
      </div>

      <form action="<%=request.getContextPath()%>/LoginServlet" method="post" novalidate>
        <div class="mb-4">
          <label for="username" class="form-label">Username</label>
          <input
            type="text"
            class="form-control"
            id="username"
            name="username"
            placeholder="Enter your username"
            required
            aria-required="true"
          />
        </div>
        <div class="mb-4">
          <label for="password" class="form-label">Password</label>
          <input
            type="password"
            class="form-control"
            id="password"
            name="password"
            placeholder="Enter your password"
            required
            aria-required="true"
          />
        </div>
        <div class="mb-4 form-check">
          <input type="checkbox" class="form-check-input" id="rememberMe" name="remember" />
          <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
        <button type="submit" class="btn btn-primary w-100" aria-label="Login button">Login</button>
      </form>
<% if ("invalid".equals(request.getParameter("error"))) { %>
    <p style="color:red;">Invalid credentials or checkbox not ticked. Please try again.</p>
  <% } %>
     
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
