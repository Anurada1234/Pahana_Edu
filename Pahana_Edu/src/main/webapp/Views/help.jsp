<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pahana Edu Bookshop Help Center</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: #ffffff;
      margin: 0;
      min-height: 100vh;
      position: relative;
    }

    /* Back button style */
    .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      z-index: 10;
    }

    .help-container {
      display: flex;
      flex-direction: row;
      min-height: 100vh;
      max-width: 1200px;
      margin: 0 auto;
      background: #ffffff;
    }

    .sidebar {
      width: 280px;
      background: #ffffff;
      padding: 24px 20px;
      border-right: none;
      position: sticky;
      top: 0;
      height: 100vh;
      overflow-y: auto;
      margin-top: 40px;  
      margin-left: -50px; 
    }

    .sidebar h2 {
      font-weight: 700;
      font-size: 1.4rem;
      margin-bottom: 1.5rem;
      color: #202124;
    }

    .sidebar nav a {
      display: block;
      color: #000;
      text-decoration: none;
      font-size: 1rem;
      margin-bottom: 14px;
      padding: 6px 8px;
      border-radius: 4px;
      transition: background-color 0.2s ease;
    }
    .sidebar nav a:hover,
    .sidebar nav a.active {
      background-color: #f0f0f0;
      color: #000;
      font-weight: 600;
    }

    .help-content {
      flex: 1;
      padding: 40px 40px 60px 40px;
      background: #ffffff;
    }

    .help-content h1 {
      font-weight: 700;
      font-size: 2.5rem;
      color: #000;
      margin-bottom: 20px;
    }

    .search-box {
      margin-bottom: 30px;
      max-width: 600px;
    }

    .search-box input {
      width: 100%;
      padding: 12px 16px;
      font-size: 1.1rem;
      border: 1.5px solid #ccc;
      border-radius: 24px;
    }

    .search-box input:focus {
      outline: none;
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0,123,255,0.3);
    }

    .help-topic {
      margin-bottom: 32px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 20px;
    }

    .help-topic h2 {
      font-weight: 600;
      font-size: 1.5rem;
      margin-bottom: 12px;
      color: #007bff;
      cursor: pointer;
    }

    .help-topic-content {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.3s ease;
      padding-left: 15px;
    }

    .help-topic.open .help-topic-content {
      max-height: 1000px;
    }

    .help-topic p,
    .help-topic ul {
      color: #000;
      line-height: 1.6;
      font-size: 1.1rem;
      margin-bottom: 12px;
    }

    @media (max-width: 768px) {
      .help-container {
        flex-direction: column;
        max-width: 100%;
        height: auto;
      }

      .sidebar {
        width: 100%;
        height: auto;
        position: relative;
        border-right: none;
        border-bottom: 1px solid #ddd;
        padding: 20px 15px;

        margin-top: 0;
        margin-left: 0;
      }

      .help-content {
        padding: 30px 20px 40px 20px;
      }
    }
  </style>
</head>
<body>

  <!-- Back Button Added -->
  <a href="dashboard.jsp" class="btn btn-outline-dark back-btn">
    <i class="bi bi-arrow-left-circle me-1"></i> Back
  </a>

  <div class="help-container">
    <aside class="sidebar" aria-label="Help Topics">
      <h2>Help Topics</h2>
      <nav id="sidebarNav">
        <a href="#login" class="active">Login Instructions</a>
        <a href="#customer-details">Customer Details</a>
        <a href="#customer-operations">Search & Manage Customers</a>
        <a href="#item-details">Item Details</a>
        <a href="#item-operations">Search & Manage Items</a>
        <a href="#billing-system">Billing System</a>
        <a href="#contact-info">Contact</a>
      </nav>
    </aside>

    <main class="help-content">
      <h1>Pahana Edu Bookshop Help Center</h1>

      <div class="search-box">
        <input type="search" id="helpSearch" placeholder="Search help topics..." aria-label="Search help topics" oninput="filterHelpTopics()" />
      </div>

      <!-- All your existing help topics remain unchanged -->
      <section id="login" class="help-topic open">
        <h2 tabindex="0">Login Instructions</h2>
        <div class="help-topic-content">
          <p>Only the admin user can access the billing system.</p>
          <ul>
            <li>Enter your valid username and password on the login page.</li>
            <li>Click the "Login" button to access the dashboard.</li>
            <li>If credentials are incorrect, an error message will be shown.</li>
          </ul>
        </div>
      </section>

      <section id="customer-details" class="help-topic">
        <h2 tabindex="0">Enter Customer Details</h2>
        <div class="help-topic-content">
          <p>Manage your customers easily:</p>
          <ul>
            <li>Navigate to the "Customers" section in the dashboard.</li>
            <li>Fill in customer account number, name, address, and contact details.</li>
            <li>Click "Save" to add new customers.</li>
          </ul>
        </div>
      </section>

      <section id="customer-operations" class="help-topic">
        <h2 tabindex="0">Search & Manage Customers</h2>
        <div class="help-topic-content">
          <h3>Search Customer</h3>
          <ul>
            <li>Use the search bar to enter the customer's account number.</li>
            <li>Click "Search" to find the customer.</li>
            <li>If found, details will auto-populate the form fields.</li>
          </ul>

          <h3>Update Customer</h3>
          <ul>
            <li>Edit any fields you want to change.</li>
            <li>Click "Update" to save changes.</li>
          </ul>

          <h3>Delete Customer</h3>
          <ul>
            <li>After searching, click "Delete" to remove the customer.</li>
            <li>Confirm the action in the popup.</li>
          </ul>
        </div>
      </section>

      <section id="item-details" class="help-topic">
        <h2 tabindex="0">Enter Item Details</h2>
        <div class="help-topic-content">
          <p>Add and manage book items in your inventory:</p>
          <ul>
            <li>Go to the "Items" or "Books" section.</li>
            <li>Enter book title, author, price, and stock quantity.</li>
            <li>Click "Add" or "Save" to store the item.</li>
          </ul>
        </div>
      </section>

      <section id="item-operations" class="help-topic">
        <h2 tabindex="0">Search & Manage Items</h2>
        <div class="help-topic-content">
          <h3>Search Item</h3>
          <ul>
            <li>Enter the item or book name in the search bar.</li>
            <li>Click "Search" to find the item.</li>
            <li>Item details will appear for editing.</li>
          </ul>

          <h3>Update Item</h3>
          <ul>
            <li>Edit fields like price or stock quantity.</li>
            <li>Click "Update" to save changes.</li>
          </ul>

          <h3>Delete Item</h3>
          <ul>
            <li>Click "Delete" after selecting the item.</li>
            <li>Confirm deletion to remove the item.</li>
          </ul>
        </div>
      </section>

      <section id="billing-system" class="help-topic">
        <h2 tabindex="0">About the Billing System</h2>
        <div class="help-topic-content">
          <p>Create bills quickly by selecting customers and adding items:</p>
          <ul>
            <li>Select an existing customer or add a new one before billing.</li>
            <li>Add items and quantities to the bill.</li>
            <li>Review totals, taxes, and discounts.</li>
            <li>Print or save invoices for your records.</li>
          </ul>
        </div>
      </section>

      <section id="contact-info" class="help-topic">
        <h2 tabindex="0">Contact Information</h2>
        <div class="help-topic-content">
          <p>If you need assistance or find issues, contact the system administrator:</p>
          <ul>
            <li><strong>Email:</strong> support@pahanaedu.lk</li>
            <li><strong>Phone:</strong> +94 11 1234 567</li>
            <li><strong>Address:</strong> Pahana Edu Bookshop, Colombo</li>
          </ul>
        </div>
      </section>
    </main>
  </div>

  <!-- Scripts -->
  <script>
    document.querySelectorAll('.help-topic h2').forEach((header) => {
      header.addEventListener('click', () => {
        const section = header.parentElement;
        section.classList.toggle('open');
      });
      header.addEventListener('keypress', (e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          header.click();
        }
      });
    });

    function filterHelpTopics() {
      const query = document.getElementById('helpSearch').value.toLowerCase();
      const topics = document.querySelectorAll('.help-topic');

      topics.forEach((topic) => {
        const text = topic.textContent.toLowerCase();
        if (text.includes(query)) {
          topic.style.display = '';
          topic.classList.add('open');
        } else {
          topic.style.display = 'none';
          topic.classList.remove('open');
        }
      });

      const sidebarLinks = document.querySelectorAll('.sidebar nav a');
      sidebarLinks.forEach(link => {
        const targetId = link.getAttribute('href').substring(1);
        const targetTopic = document.getElementById(targetId);
        link.style.display = (targetTopic && targetTopic.style.display !== 'none') ? '' : 'none';
      });
    }

    const sidebarLinks = document.querySelectorAll('.sidebar nav a');
    sidebarLinks.forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        sidebarLinks.forEach(l => l.classList.remove('active'));
        link.classList.add('active');
        const id = link.getAttribute('href').substring(1);
        document.getElementById(id).scrollIntoView({ behavior: 'smooth' });
      });
    });

    window.addEventListener('scroll', () => {
      let current = '';
      const offset = 150;
      document.querySelectorAll('.help-topic').forEach(section => {
        const sectionTop = section.offsetTop;
        if (pageYOffset >= sectionTop - offset) {
          current = section.getAttribute('id');
        }
      });

      sidebarLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').substring(1) === current) {
          link.classList.add('active');
        }
      });
    });
  </script>
</body>
</html>
