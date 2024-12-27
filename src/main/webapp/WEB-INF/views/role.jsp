<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Role Management</h2>
        <form action="saveRole" method="post" class="mt-4">
            <div class="mb-3">
                <label for="roleName" class="form-label">Select Role</label>
                <input name="roleName" id="roleName" class="form-select" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Role</button>
        </form>
        
        <h3 class="mt-5">Existing Roles</h3>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Role Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="role" items="${roles}">
                    <tr>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>
                            <a href="editRole?id=${role.roleId}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="deleteRole?id=${role.roleId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
