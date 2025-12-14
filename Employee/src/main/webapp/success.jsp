<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Success</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: #f2f6fc;
        }
        .success-card {
            margin-top: 120px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }
        .success-icon {
            font-size: 85px;
            color: #28a745;
        }
        .btn-home {
            padding: 10px 25px;
            border-radius: 30px;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="card text-center p-4 success-card">

                    <div class="success-icon mb-3">
                        ✓
                    </div>

                    <h2 class="text-success">Message Sent Successfully!</h2>

                    <p class="mt-2 text-muted">
                        Thank you for contacting us. We will get back to you shortly.
                    </p>

                    <a href="index.jsp" class="btn btn-success btn-home mt-3">
                        Go to Home
                    </a>

                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
