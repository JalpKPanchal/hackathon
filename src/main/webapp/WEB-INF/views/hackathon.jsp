<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hackathon Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Hackathon Management</h1>
        <div class="text-end mb-3">
            <a href="/hackathons/new" class="btn btn-primary">Add New Hackathon</a>
        </div>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Contact</th>
                    <th>Min Team Size</th>
                    <th>Max Team Size</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hackathon" items="${hackathons}">
                    <tr>
                        <td>${hackathon.hackathonId}</td>
                        <td>${hackathon.title}</td>
                        <td>${hackathon.description}</td>
                        <td>${hackathon.contact}</td>
                        <td>${hackathon.minTeamSize}</td>
                        <td>${hackathon.maxTeamSize}</td>
                        <td>${hackathon.startDate}</td>
                        <td>${hackathon.endDate}</td>
                        <td>${hackathon.status}</td>
                        <td>
                            <a href="/hackathons/view/${hackathon.hackathonId}" class="btn btn-info btn-sm">View</a>
                            <a href="/hackathons/edit/${hackathon.hackathonId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="/hackathons/delete/${hackathon.hackathonId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this hackathon?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
