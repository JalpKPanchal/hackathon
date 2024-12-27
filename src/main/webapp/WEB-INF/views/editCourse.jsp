<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Edit Course</h1>
        <form action="/updateCourse" method="post">
            <input type="hidden" name="courseid" value="${course.courseid}">
            <div class="mb-3">
                <label for="courseName" class="form-label">Course Name</label>
                <input type="text" class="form-control" id="courseName" name="courseName" value="${course.courseName}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="/courses" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
