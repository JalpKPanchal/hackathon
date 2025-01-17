<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Team Members</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Team Members</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${teamMembers}">
                <tr>
                    <td>${member.user.firstName} ${member.user.lastName}</td>
                    <td>${member.user.email}</td>
                    <td>${member.role}</td>
                    <td>${member.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
