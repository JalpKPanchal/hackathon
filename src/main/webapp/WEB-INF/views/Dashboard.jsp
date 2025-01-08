<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Hackathon Dashboard</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #495057;
            margin-bottom: 1rem;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: scale(1.01);
            transition: 0.3s;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hackathon</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Welcome Section -->
        <div class="row">
            <div class="col-12">
                <h1 class="text-center text-primary">Welcome to the Hackathon Dashboard</h1>
                <p class="text-center text-muted">Manage your teams, view announcements, and stay up-to-date with everything hackathon!</p>
            </div>
        </div>

        <!-- Announcements Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h2 class="section-title">Announcements</h2>
                <div class="card p-3">
                    <ul class="list-unstyled mb-0">
                        <li class="mb-2"><strong>[01 Jan 2025]</strong> Hackathon Kickoff Event at 10:00 AM in Auditorium.</li>
                        <li class="mb-2"><strong>[02 Jan 2025]</strong> Workshop on "AI in Hackathons" at 2:00 PM in Lab 1.</li>
                        <li><strong>[03 Jan 2025]</strong> Team submission deadline: 5:00 PM.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Participants Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h2 class="section-title">Participants</h2>
                <div class="card p-3">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>College</th>
                                <th>Email</th>
                                <th>City</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>John Doe</td>
                                <td>ABC College</td>
                                <td>john.doe@example.com</td>
                                <td>New York</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jane Smith</td>
                                <td>XYZ University</td>
                                <td>jane.smith@example.com</td>
                                <td>Los Angeles</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Michael Brown</td>
                                <td>LMN Institute</td>
                                <td>michael.brown@example.com</td>
                                <td>Chicago</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Team Management Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h2 class="section-title">Team Management</h2>
                <div class="card p-3">
                    <p>Create or manage your team for the hackathon. A team must have 3-5 members with at least 1 female member.</p>
                    <a href="/teams/create" class="btn btn-primary">Create Team</a>
                    <a href="/teams/manage" class="btn btn-outline-primary">Manage Team</a>
                    <a href="/teams/list" class="btn btn-success">List Teams</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-4 py-3 bg-primary text-white text-center">
        <p class="mb-0">&copy; 2025 Hackathon | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
