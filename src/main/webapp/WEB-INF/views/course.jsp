	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Courses</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	</head>
	<body>
	    <div class="container mt-4">
	        <h1>Courses</h1>
	        <form action="/addCourse" method="post" class="mb-4">
	            <div class="row g-3 align-items-center">
	                <div class="col-auto">
	                    <input type="text" class="form-control" name="courseName" placeholder="Enter Course Name" required>
	                </div>
	                <div class="col-auto">
	                    <button type="submit" class="btn btn-success">Add Course</button>
	                </div>
	            </div>
	        </form>
	        <table class="table table-bordered">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>Course Name</th>
	                    <th>Actions</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="course" items="${courses}">
	                    <tr>
	                        <td>${course.courseid}</td>
	                        <td>${course.courseName}</td>
	                        <td>
	                            <a href="/editCourse?courseid=${course.courseid}" class="btn btn-primary btn-sm">Edit</a>
	                            <a href="/deleteCourse?courseid=${course.courseid}" class="btn btn-danger btn-sm">Delete</a>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</body>
	</html>
