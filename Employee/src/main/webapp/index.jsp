<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Remove unwanted scroll */
html, body {
    overflow-x: hidden !important;
}

/* Reset */
* {
    padding: 0;
    margin: 0;
}

/* Body */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    padding-top: 70px; /* So content is not hidden behind navbar */
}

/* Fix Bootstrap row overflow on mobile */
.row {
    margin-left: 0 !important;
    margin-right: 0 !important;
}

/* Carousel styling */
.carousel-item img {
    height: 500px;
    width: 100%;
    object-fit: cover;
    display: block;
    filter: brightness(0.85);
}

/* Sections */
.section {
    padding: 60px 0;
}

/* Card hover effects */
.card {
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-5px);
}

/* Footer */
.footer {
    background-color: #343a40;
    color: white;
    padding: 30px 0;
}

.footer a {
    color: #ffc107;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}

/* Smooth scroll */
html {
    scroll-behavior: smooth;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>

    <!-- Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://images.unsplash.com/photo-1551836022-4c4c79ecde51" class="d-block w-100" alt="Teamwork">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d" class="d-block w-100" alt="Office">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d" class="d-block w-100" alt="Meeting">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>

        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- About Section -->
    <section id="about" class="section container text-center">
        <h2 class="fw-bold mb-3">About Employee Management System</h2>
        <p class="text-muted">
            Our Employee Management System helps organizations efficiently manage employee records,
            departments, payroll, and daily operations with ease.
        </p>
    </section>

    <!-- Features Section -->
    <section id="features" class="section container text-center">
        <h2 class="fw-bold mb-4">Explore EMS Pages</h2>

        <div class="row justify-content-center">
            <!-- Login -->
            <div class="col-sm-6 col-md-3 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">Login</h5>
                        <p class="card-text">Access your employee dashboard.</p>
                        <a href="login.jsp" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>

            <!-- Register -->
            <div class="col-sm-6 col-md-3 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">Register</h5>
                        <p class="card-text">Create a new account to join EMS.</p>
                        <a href="register.jsp" class="btn btn-success">Go</a>
                    </div>
                </div>
            </div>

            <!-- Employee List -->
            <div class="col-sm-6 col-md-3 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">Employee List</h5>
                        <p class="card-text">View all registered employees.</p>
                        <a href="adminlogin.jsp" class="btn btn-info text-white">Go</a>
                    </div>
                </div>
            </div>

            <!-- Add Employee -->
            <div class="col-sm-6 col-md-3 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">Add Employee</h5>
                        <p class="card-text">Add a new employee to the system.</p>
                        <a href="addEmployee.jsp" class="btn btn-warning text-white">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="section container">
        <h2 class="text-center fw-bold mb-4">Contact Us</h2>

        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Your Name</label>
                        <input type="text" class="form-control" placeholder="Enter your name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Your Email</label>
                        <input type="email" class="form-control" placeholder="Enter your email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Subject</label>
                        <input type="text" class="form-control" placeholder="Message subject">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea class="form-control" rows="3" placeholder="Your message"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
            </div>

            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <img src="https://cdn-icons-png.flaticon.com/512/1256/1256650.png" class="img-fluid" width="200" alt="Contact Icon">
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
