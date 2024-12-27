<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Language</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Edit Language</h1>
        <form action="/updateLanguage" method="post">
            <input type="hidden" name="languageId" value="${language.languageId}">
            <div class="mb-3">
                <label for="language" class="form-label">Language</label>
                <input type="text" class="form-control" id="language" name="language" value="${language.language}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="/languages" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
