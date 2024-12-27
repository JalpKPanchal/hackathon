<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hackathon Judges</title>
</head>
<body>
<h1>Hackathon Judges</h1>
<a href="editHackathonJudge.jsp">Add New Judge</a>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Hackathon</th>
        <th>User</th>
        <th>Role</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="judge" items="${judges}">
        <tr>
            <td>${judge.hackathonJudgeId}</td>
            <td>${judge.hackathon.name}</td>
            <td>${judge.user.name}</td>
            <td>${judge.role}</td>
            <td>
                <a href="editHackathonJudge.jsp?id=${judge.hackathonJudgeId}">Edit</a>
                <a href="deleteHackathonJudge?id=${judge.hackathonJudgeId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
