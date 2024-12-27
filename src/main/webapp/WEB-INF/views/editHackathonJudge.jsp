<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${judge != null ? "Edit Judge" : "Add New Judge"}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>${judge != null ? "Edit Judge" : "Add New Judge"}</h1>
    <form action="/hackathonJudges" method="post">
        <input type="hidden" name="hackathonJudgeId" value="${judge.hackathonJudgeId}" />

        <div class="mb-3">
            <label for="hackathon" class="form-label">Hackathon:</label>
            <select name="hackathon.hackathonId" id="hackathon" class="form-control" required>
                <c:forEach var="hackathon" items="${hackathons}">
                    <option value="${hackathon.hackathonId}" ${judge != null && judge.hackathon.hackathonId == hackathon.hackathonId ? "selected" : ""}>
                        ${hackathon.title}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="user" class="form-label">Judge:</label>
            <select name="user.userId" id="user" class="form-control" required>
                <c:forEach var="user" items="${users}">
                    <option value="${user.userId}" ${judge != null && judge.user.userId == user.userId ? "selected" : ""}>
                        ${user.firstName} ${user.lastName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="role" class="form-label">Role:</label>
            <input type="text" id="role" name="role" class="form-control" value="${judge.role}" required />
        </div>

        <button type="submit" class="btn btn-success">Save</button>
        <a href="/hackathonJudges" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
