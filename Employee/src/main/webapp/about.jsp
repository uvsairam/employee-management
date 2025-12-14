<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us | Employee Management System</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      padding-top: 70px; /* space for fixed navbar */
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .about-section {
      background: linear-gradient(to right, #e9ecef, #f8f9fa);
      padding: 80px 0;
    }

    .about-section h1 {
      font-weight: 700;
      margin-bottom: 30px;
    }

    .about-section p {
      font-size: 1.1rem;
      color: #495057;
    }

    .team-section {
      background-color: #fff;
      padding: 80px 0;
    }

    .team-card {
      border: none;
      border-radius: 15px;
      transition: transform 0.3s;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .team-card:hover {
      transform: translateY(-10px);
    }

    .team-card img {
      border-radius: 50%;
      height: 160px;
      width: 160px;
      object-fit: cover;
      margin-top: -80px;
      border: 5px solid #fff;
    }

    .mission-section {
      background-color: #f8f9fa;
      padding: 80px 0;
    }

    footer {
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 20px 0;
      margin-top: 40px;
    }
  </style>
</head>
<body>

  <!-- About Section -->
  <section class="about-section text-center">
    <div class="container">
      <h1>About Employee Management System</h1>
      <p class="lead">
        The Employee Management System (EMS) is a modern, web-based platform designed to streamline employee data management, 
        track attendance, monitor departmental performance, and simplify HR operations.
      </p>
      <p>
        EMS helps organizations automate critical HR tasks such as employee registration, payroll management, leave tracking, and attendance monitoring, 
        saving time and enhancing productivity.
      </p>
    </div>
  </section>

  <!-- Team Section -->
  <section class="team-section text-center">
    <div class="container">
      <h2 class="mb-5">Meet the Developer</h2>
      <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
          <div class="card team-card p-4 text-center">
            <img src="images/venkat.jpg" alt="Venkata Sai Ram">
            <div class="card-body mt-3">
              <h5 class="card-title">Venkata Sai Ram</h5>
              <p class="text-muted">Project Developer</p>
              <div class="mt-2">
                <a href="#" class="text-dark me-3"><i class="fab fa-linkedin fa-lg"></i></a>
                <a href="#" class="text-dark me-3"><i class="fab fa-github fa-lg"></i></a>
                <a href="#" class="text-dark"><i class="fas fa-envelope fa-lg"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Mission Section -->
  <section class="mission-section text-center">
    <div class="container">
      <h2>Our Mission</h2>
      <p class="lead mt-3">
        To empower organizations by providing a secure, efficient, and user-friendly Employee Management System that automates HR operations, 
        ensures transparency, and improves workforce performance.
      </p>
    </div>
  </section>

  <!-- Call-to-Action Section -->
  <section class="text-center py-5">
    <div class="container">
      <h3>Get Started with EMS</h3>
      <p class="mb-4">Streamline your employee management process today and focus on what matters most — your business.</p>
      <a href="viewAttendance" class="btn btn-primary btn-lg">View Attendance Records</a>
    </div>
  </section>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@ include file="footer.jsp" %>
</html>
