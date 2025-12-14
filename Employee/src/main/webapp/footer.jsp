<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- footer.jsp -->
<footer class="bg-dark text-white pt-5 pb-3">
    <div class="container text-center text-md-start">

        <!-- Footer Top -->
        <div class="row">

            <!-- About -->
            <div class="col-md-6 mb-4">
                <h5 class="fw-bold">Employee Management System</h5>
                <p class="small">
                    A modern web-based system to manage employees efficiently. Track attendance, departments, payroll, and HR tasks seamlessly.
                </p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-3 mb-4">
                <h5 class="fw-bold">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp" class="text-white text-decoration-none">Home</a></li>
                    <li><a href="about.jsp" class="text-white text-decoration-none">About</a></li>
                    <li><a href="contact.jsp" class="text-white text-decoration-none">Contact</a></li>
                </ul>
            </div>

            <!-- Social Media -->
            <div class="col-md-3 mb-4">
                <h5 class="fw-bold">Connect with Me</h5>
                <a href="#" class="text-white me-3"><i class="fab fa-linkedin fa-lg"></i></a>
                <a href="#" class="text-white me-3"><i class="fab fa-github fa-lg"></i></a>
                <a href="#" class="text-white"><i class="fas fa-envelope fa-lg"></i></a>
            </div>
        </div>

        <hr class="bg-secondary">

        <!-- Footer Bottom -->
        <div class="text-center small">
            &copy; <%= java.time.Year.now() %> Employee Management System. All Rights Reserved by Mr. Venkata Sai Ram Uriti.
        </div>
    </div>
</footer>

<!-- Font Awesome for social icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
footer {
    box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
}

footer a:hover {
    text-decoration: underline;
    color: #0d6efd;
}
</style>
