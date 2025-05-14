<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Project Dashboard</title>
    <!-- Use standard link to Font Awesome that works with JSP -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --secondary: #10b981;
            --dark: #1f2937;
            --light: #f9fafb;
            --danger: #ef4444;
            --warning: #f59e0b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0;
            color: var(--dark);
            position: relative;
            overflow-x: hidden;
        }

        .header {
            width: 100%;
            background-color: var(--primary);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            font-size: 1.5rem;
        }

        .main-container {
            width: 100%;
            max-width: 1200px;
            margin: 2rem auto;
            display: flex;
            gap: 2rem;
            padding: 0 1rem;
        }

        .sidebar {
            flex: 0 0 250px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            height: fit-content;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 0.5rem;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 0.75rem 1rem;
            color: var(--dark);
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: rgba(79, 70, 229, 0.1);
            color: var(--primary);
        }

        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .welcome-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        .welcome-content {
            position: relative;
            z-index: 2;
        }

        .welcome-card::after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 200px;
            height: 200px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.3) 0%, rgba(16, 185, 129, 0.3) 100%);
            border-radius: 50%;
            transform: translate(30%, -30%);
            z-index: 1;
        }

        .welcome-card h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .card-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .user-card .card-icon {
            background-color: var(--primary);
        }

        .project-card .card-icon {
            background-color: var(--secondary);
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 500;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background-color: var(--primary);
            color: white;
        }

        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: none;
            position: relative;
        }

        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            border: 1px solid var(--secondary);
            color: var(--secondary);
        }

        .alert-danger {
            background-color: rgba(239, 68, 68, 0.1);
            border: 1px solid var(--danger);
            color: var(--danger);
        }

        .alert-close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            color: inherit;
            opacity: 0.7;
            transition: opacity 0.2s ease;
        }

        .alert-close:hover {
            opacity: 1;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 1rem;
            padding: 1rem;
            background-color: rgba(79, 70, 229, 0.05);
            border-radius: 8px;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1.25rem;
        }

        .user-details {
            flex: 1;
        }

        .user-name {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .user-role {
            color: #6b7280;
            font-size: 0.9rem;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .stat-item {
            background-color: rgba(79, 70, 229, 0.05);
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
        }

        .stat-label {
            font-size: 0.9rem;
            color: #6b7280;
        }

        .footer {
            margin-top: auto;
            width: 100%;
            background-color: white;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 -4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .footer a {
            color: var(--primary);
            text-decoration: none;
        }

        .animation-float {
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }
            .sidebar {
                flex: 0 0 auto;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <i class="fas fa-cubes"></i>
            <span>DevOps Dashboard</span>
        </div>
        <div>
            <span>Welcome, Guest</span>
        </div>
    </div>

    <div class="main-container">
        <div class="sidebar">
            <ul class="sidebar-menu">
                <li><a href="#" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="#"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li><a href="#"><i class="fas fa-code-branch"></i> Pipelines</a></li>
                <li><a href="#"><i class="fas fa-server"></i> Environments</a></li>
                <li><a href="#"><i class="fas fa-chart-line"></i> Analytics</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
        </div>

        <div class="content">
            <div class="welcome-card">
                <div class="welcome-content">
                    <h1>Hello, Moshe!</h1>
                    <p>Welcome to your DevOps dashboard. Here you can manage your projects, pipelines, and deployments.</p>
                </div>
            </div>

            <div class="card-container">
                <div class="card user-card">
                    <div class="card-header">
                        <h2 class="card-title">User Profile</h2>
                        <div class="card-icon">
                            <i class="fas fa-user"></i>
                        </div>
                    </div>
                    
                    <div id="alertContainer"></div>
                    
                    <form id="userForm">
                        <div class="form-group">
                            <label for="nameInput">Full Name</label>
                            <input type="text" class="form-control" id="nameInput" placeholder="Enter your full name">
                        </div>
                        <div class="form-group">
                            <label for="usernameInput">Username</label>
                            <input type="text" class="form-control" id="usernameInput" placeholder="Enter your username">
                        </div>
                        <div class="form-group">
                            <label for="roleInput">Role</label>
                            <select class="form-control" id="roleInput">
                                <option value="developer">Developer</option>
                                <option value="devops">DevOps Engineer</option>
                                <option value="manager">Project Manager</option>
                                <option value="admin">Administrator</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-primary" id="saveProfileBtn" onclick="updateProfile()">
                            <i class="fas fa-save"></i> Save Profile
                        </button>
                    </form>

                    <div class="user-info" id="userInfoDisplay" style="display: none;">
                        <div class="user-avatar" id="userAvatar">M</div>
                        <div class="user-details">
                            <div class="user-name" id="displayName">Moshe</div>
                            <div class="user-role" id="displayUsername">@moshe</div>
                            <div class="user-role" id="displayRole">DevOps Engineer</div>
                        </div>
                    </div>
                </div>

                <div class="card project-card">
                    <div class="card-header">
                        <h2 class="card-title">Project Status</h2>
                        <div class="card-icon">
                            <i class="fas fa-rocket"></i>
                        </div>
                    </div>
                    
                    <div class="stats-container">
                        <div class="stat-item">
                            <div class="stat-value">8</div>
                            <div class="stat-label">Projects</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">12</div>
                            <div class="stat-label">Pipelines</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">95%</div>
                            <div class="stat-label">Success</div>
                        </div>
                    </div>
                    
                    <div style="margin-top: 1.5rem;">
                        <h3 style="margin-bottom: 1rem;">Recent Deployments</h3>
                        <div style="display: flex; justify-content: space-between; padding: 0.75rem; background-color: rgba(79, 70, 229, 0.05); border-radius: 8px; margin-bottom: 0.5rem;">
                            <span>Frontend</span>
                            <span style="color: var(--secondary);"><i class="fas fa-check-circle"></i> Success</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding: 0.75rem; background-color: rgba(79, 70, 229, 0.05); border-radius: 8px; margin-bottom: 0.5rem;">
                            <span>API Service</span>
                            <span style="color: var(--secondary);"><i class="fas fa-check-circle"></i> Success</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding: 0.75rem; background-color: rgba(79, 70, 229, 0.05); border-radius: 8px;">
                            <span>Database</span>
                            <span style="color: var(--warning);"><i class="fas fa-exclamation-circle"></i> Warning</span>
                        </div>
                    </div>
                    
                    <div style="margin-top: 1.5rem; text-align: center;">
                        <a href="projects.jsp" class="btn btn-outline">View All Projects</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2025 DevOps Project. All rights reserved. <a href="greeting.jsp">Go to Greeting Page</a></p>
    </div>

    <script>
        // Form validation and user profile management
        function updateProfile() {
            var nameInput = document.getElementById("nameInput");
            var usernameInput = document.getElementById("usernameInput");
            var roleInput = document.getElementById("roleInput");
            var alertContainer = document.getElementById("alertContainer");
            
            // Simple input validation
            if (nameInput.value.trim() == "" || usernameInput.value.trim() == "") {
                showAlert("Please fill in all required fields", "danger");
                return;
            }
            
            // XSS prevention by encoding user input
            var name = encodeHTML(nameInput.value.trim());
            var username = encodeHTML(usernameInput.value.trim());
            var role = roleInput.options[roleInput.selectedIndex].text;
            
            // Update profile display
            document.getElementById("userInfoDisplay").style.display = "flex";
            document.getElementById("displayName").innerText = name;
            document.getElementById("displayUsername").innerText = "@" + username;
            document.getElementById("displayRole").innerText = role;
            
            // Update avatar with first letter of name
            var firstLetter = name.charAt(0).toUpperCase();
            document.getElementById("userAvatar").innerText = firstLetter;
            
            // Show success message
            showAlert("Profile updated successfully!", "success");
            
            // Update header welcome message
            document.querySelector(".header div span").innerText = "Welcome, " + name;
            
            // For demo purposes - normally this would be saved to a database
            console.log("Profile updated:", { name: name, username: username, role: role });
        }
        
        // Helper function to show alerts - MODIFIED to persist alerts
        function showAlert(message, type) {
            const alertContainer = document.getElementById("alertContainer");
            // Build the alert HTML with a close button
            var iconClass = (type == 'success') ? 'check-circle' : 'exclamation-circle';
            alertContainer.innerHTML = 
                '<div class="alert alert-' + type + '" style="display: block;">' +
                    '<i class="fas fa-' + iconClass + '"></i> ' + message +
                    '<span class="alert-close" onclick="closeAlert()"><i class="fas fa-times"></i></span>' +
                '</div>';
            
            // No more auto-dismiss timer - alert will remain until closed manually
        }
        
        // New function to close alert manually
        function closeAlert() {
            const alert = document.querySelector(".alert");
            if (alert) {
                alert.style.display = "none";
            }
        }
        
        // Helper function to prevent XSS attacks by encoding HTML
        function encodeHTML(str) {
            return String(str)
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#39;');
        }
        
        // Initialize with some data for demonstration
        window.onload = function() {
            // Pre-fill the name field with "Moshe" for demonstration
            document.getElementById("nameInput").value = "Moshe";
        };
    </script>
</body>
</html>