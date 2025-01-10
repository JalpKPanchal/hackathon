<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Response</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body text-center">
                <h3 class="card-title">Hackathon Response</h3>
                <p class="card-text">${message}</p>
                <a href="/teams/list" class="btn btn-primary">Back to Teams</a>
            </div>
        </div>
    </div>
</body>
</html>
