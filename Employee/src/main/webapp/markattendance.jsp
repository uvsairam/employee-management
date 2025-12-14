<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h2 class="text-center mb-4">Admin - Mark Attendance</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="markAttendance" method="post" class="border p-4 rounded shadow-sm bg-light">
                <div class="mb-3">
                    <label for="empId" class="form-label">Employee ID</label>
                    <input type="number" id="empId" name="empId" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="attendanceDate" class="form-label">Date</label>
                    <input type="date" id="attendanceDate" name="attendanceDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select id="status" name="status" class="form-select" required>
                        <option value="Present">Present</option>
                        <option value="Absent">Absent</option>
                        <option value="Late">Late</option>
                        <option value="Leave">Leave</option>
                    </select>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Save Attendance</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <a href="viewAttendance" class="btn btn-secondary">View All Attendance</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
