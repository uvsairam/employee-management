<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us | Employee Management System</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <style>
    body {
      padding-top: 70px; /* for fixed navbar */
    }
    footer {
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 15px 0;
      margin-top: 40px;
    }
    .contact-section {
      background-color: #f8f9fa;
      padding: 60px 0;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #0d6efd;
    }
  </style>
</head>

<body>

  <!-- Contact Section -->
  <section class="contact-section">
    <div class="container">
      <div class="text-center mb-5">
        <h1>Contact Us</h1>
        <p class="lead">Have questions or feedback? We’d love to hear from you!</p>
      </div>

      <div class="row justify-content-center">
        <!-- Contact Form -->
        <div class="col-md-6">
          <form action="ContactController" method="post">
            <div class="mb-3">
              <label for="name" class="form-label">Full Name</label>
              <input type="text" class="form-control" id="name" name="fullname" placeholder="Enter your full name" required>
            </div>

            <div class="mb-3">
              <label for="email" class="form-label">Email Address</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="mb-3">
              <label for="subject" class="form-label">Subject</label>
              <input type="text" class="form-control" id="subject" name="subject" placeholder="Message subject" required>
            </div>

            <div class="mb-3">
              <label for="message" class="form-label">Message</label>
              <textarea class="form-control" id="message" name="message" rows="5" placeholder="Type your message here..." required></textarea>
            </div>

            <button type="submit" class="btn btn-primary w-100">Send Message</button>
          </form>
        </div>
      </div>

      <!-- Contact Info -->
      <div class="row text-center mt-5">
        <div class="col-md-4">
          <h5><i class="bi bi-geo-alt-fill"></i> Address</h5>
          <p>14-13 Office Street, Hyderabad, India</p>
        </div>
        <div class="col-md-4">
          <h5><i class="bi bi-telephone-fill"></i> Phone</h5>
          <p>+91 88978 28175</p>
        </div>
        <div class="col-md-4">
          <h5><i class="bi bi-envelope-fill"></i> Email</h5>
          <p>venkatasairamuriti@employeems.com</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Google Map Embed -->
  <div class="container my-5">
    <div class="ratio ratio-16x9">
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.508452745602!2d78.48667167493418!3d17.385044783515037!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb974bb5f4c1c7%3A0x8aef01f68b1b91b7!2sHyderabad%2C%20Telangana!5e0!3m2!1sen!2sin!4v1699959999999"
        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy">
      </iframe>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
