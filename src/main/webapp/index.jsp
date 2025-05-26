<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Mini‑Dashboard</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-X8d3JdQYhK2zlZA5QhZTO4XBoK1CqY99u7gopBZ5S8ZmJwM2gClZ4UcHxpsqXyR8EzBNqBG2qgbrl4uP3dcx0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;600&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            /* LIGHT THEME */
            --bg-gradient: linear-gradient(135deg, #ebf4ff 0%, #f0fdf4 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --card-shadow: 0 22px 45px rgba(5, 26, 55, 0.14);
            --text-color: #1e293b;
            --text-muted: #64748b;
            --accent: #4f46e5;
            --accent-hover: #4338ca;
            --accent-light: rgba(79, 70, 229, 0.12);
            --border: #e2e8f0;
            --info-bg: rgba(59, 130, 246, 0.08);
            --success: #10b981;
            --success-light: rgba(16, 185, 129, 0.1);
            --separator: rgba(203, 213, 225, 0.5);
        }
        
        body.dark {
            /* DARK THEME */
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #111827 100%);
            --card-bg: rgba(30, 41, 59, 0.9);
            --card-shadow: 0 22px 45px rgba(0, 0, 0, 0.4);
            --text-color: #e2e8f0;
            --text-muted: #94a3b8;
            --accent: #818cf8;
            --accent-hover: #6366f1;
            --accent-light: rgba(129, 140, 248, 0.15);
            --border: #334155;
            --info-bg: rgba(59, 130, 246, 0.12);
            --success: #34d399;
            --success-light: rgba(52, 211, 153, 0.12);
            --separator: rgba(71, 85, 105, 0.5);
        }

        * { 
            box-sizing: border-box; 
            margin: 0; 
            padding: 0; 
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--bg-gradient);
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: var(--text-color);
            position: relative;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 25% 35%, rgba(79, 70, 229, 0.03) 0%, transparent 45%),
                radial-gradient(circle at 85% 25%, rgba(16, 185, 129, 0.03) 0%, transparent 45%),
                radial-gradient(circle at 50% 80%, rgba(236, 72, 153, 0.03) 0%, transparent 45%);
            z-index: -1;
        }
        
        body.dark::before {
            background-image: 
                radial-gradient(circle at 25% 35%, rgba(99, 102, 241, 0.06) 0%, transparent 45%),
                radial-gradient(circle at 85% 25%, rgba(52, 211, 153, 0.06) 0%, transparent 45%),
                radial-gradient(circle at 50% 80%, rgba(244, 114, 182, 0.06) 0%, transparent 45%);
        }
        
        .card {
            background: var(--card-bg);
            padding: 3rem;
            border-radius: 24px;
            width: 100%;
            max-width: 540px;
            box-shadow: var(--card-shadow);
            position: relative;
            backdrop-filter: blur(10px);
            border: 1px solid var(--border);
        }
        
        /* Header Section */
        .dashboard-header {
            display: flex;
            align-items: center;
            margin-bottom: 2.5rem;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-right: auto;
        }
        
        .logo-icon {
            font-size: 1.8rem;
            color: var(--accent);
            margin-right: 0.5rem;
            height: 42px;
            width: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--accent-light);
            border-radius: 12px;
        }
        
        .logo-text {
            display: flex;
            flex-direction: column;
        }
        
        .logo-main {
            font-weight: 700;
            font-size: 1.4rem;
            letter-spacing: -0.02em;
            line-height: 1.1;
        }
        
        .logo-sub {
            font-size: 0.8rem;
            color: var(--text-muted);
            letter-spacing: 0.03em;
            text-transform: uppercase;
        }
        
        /* Theme Toggle Button */
        .theme-toggle {
            background: var(--accent-light);
            border: none;
            color: var(--accent);
            width: 44px;
            height: 44px;
            border-radius: 12px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: all 0.25s ease;
        }
        
        .theme-toggle:hover {
            background: var(--accent);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(79, 70, 229, 0.25);
        }
        
        body.dark .theme-toggle:hover {
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.3);
        }
        
        /* Greeting Section */
        .greeting {
            margin-bottom: 2rem;
        }
        
        h1 {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, var(--accent) 0%, #8b5cf6 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: inline-block;
        }
        
        .subtitle {
            color: var(--text-muted);
            font-size: 1.1rem;
            font-weight: 400;
        }
        
        /* Status Indicators */
        .status-bar {
            display: flex;
            margin-bottom: 2rem;
            gap: 1rem;
        }
        
        .status-item {
            flex: 1;
            padding: 1rem;
            background: var(--accent-light);
            border-radius: 14px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .status-item.success {
            background: var(--success-light);
        }
        
        .status-icon {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        
        .status-item.success .status-icon {
            color: var(--success);
        }
        
        .status-item:not(.success) .status-icon {
            color: var(--accent);
        }
        
        .status-label {
            font-size: 0.85rem;
            font-weight: 500;
            font-family: 'JetBrains Mono', monospace;
        }
        
        /* Form Section */
        form {
            margin-top: 1.5rem;
            background: rgba(255, 255, 255, 0.05);
            padding: 1.5rem;
            border-radius: 16px;
            border: 1px solid var(--border);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            font-weight: 500;
            margin-bottom: 0.6rem;
            display: block;
            font-size: 0.95rem;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 0.9rem 1rem;
            border: 1px solid var(--border);
            border-radius: 12px;
            background: var(--card-bg);
            color: var(--text-color);
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            outline: none;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        
        input[type="text"]:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px var(--accent-light);
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.9rem 1.8rem;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.25s ease;
            gap: 0.5rem;
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.2);
        }
        
        .btn:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(79, 70, 229, 0.25);
        }
        
        body.dark .btn {
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.25);
        }
        
        body.dark .btn:hover {
            box-shadow: 0 8px 24px rgba(99, 102, 241, 0.35);
        }
        
        /* User Info Section */
        .user-info {
            margin-top: 2rem;
            background: var(--info-bg);
            backdrop-filter: blur(8px);
            border-radius: 16px;
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
            border: 1px solid var(--border);
        }
        
        .user-info::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--accent);
        }
        
        .user-info-label {
            text-transform: uppercase;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            color: var(--text-muted);
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .user-name {
            font-size: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .user-name i {
            color: var(--accent);
            font-size: 1.2rem;
        }
        
        /* Separator */
        .separator {
            height: 1px;
            background: var(--separator);
            margin: 2rem 0;
            position: relative;
        }
        
        .separator::before {
            content: '';
            position: absolute;
            width: 15%;
            height: 3px;
            background: var(--accent);
            top: -1px;
            border-radius: 3px;
        }
        
        /* Footer */
        .footer {
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 1rem;
        }
        
        .footer a {
            color: var(--text-color);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            background: var(--accent-light);
            font-weight: 500;
            transition: all 0.25s ease;
        }
        
        .footer a:hover {
            background: var(--accent);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(79, 70, 229, 0.25);
        }
        
        body.dark .footer a:hover {
            box-shadow: 0 8px 24px rgba(99, 102, 241, 0.3);
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .card > * {
            animation: fadeIn 0.4s ease-out forwards;
            opacity: 0;
        }
        
        .dashboard-header { animation-delay: 0.1s; }
        .greeting { animation-delay: 0.2s; }
        .status-bar { animation-delay: 0.3s; }
        form { animation-delay: 0.4s; }
        .user-info { animation-delay: 0.5s; }
        .separator { animation-delay: 0.6s; }
        .footer { animation-delay: 0.7s; }
        
        /* Responsive Adjustments */
        @media (max-width: 600px) {
            .card {
                padding: 2rem;
                border-radius: 20px;
                max-width: 92%;
            }
            
            h1 {
                font-size: 1.8rem;
            }
            
            .status-bar {
                flex-direction: column;
                gap: 0.75rem;
            }
            
            .status-item {
                flex-direction: row;
                justify-content: flex-start;
                padding: 0.75rem 1rem;
                text-align: left;
            }
            
            .status-icon {
                margin-bottom: 0;
                margin-right: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <!-- Header with Logo and Theme Toggle -->
        <div class="dashboard-header">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-rocket"></i>
                </div>
                <div class="logo-text">
                    <div class="logo-main">DevOps</div>
                    <div class="logo-sub">Dashboard</div>
                </div>
            </div>
            
            <!-- Theme Toggle Button -->
            <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">
                <i class="fas fa-moon" id="toggleIcon"></i>
            </button>
        </div>

        <!-- Greeting Section -->
        <div class="greeting">
            <h1>Hello, <span id="displayName">Moshe</span>!</h1>
            <p class="subtitle">Welcome to your devops control center</p>
        </div>
        
        <!-- Status indicators -->
        <div class="status-bar">
            <div class="status-item success">
                <i class="fas fa-check-circle status-icon"></i>
                <span class="status-label">CI Pipeline</span>
            </div>
            <div class="status-item">
                <i class="fas fa-sync-alt status-icon"></i>
                <span class="status-label">Deployments</span>
            </div>
            <div class="status-item success">
                <i class="fas fa-server status-icon"></i>
                <span class="status-label">Infrastructure</span>
            </div>
        </div>

        <!-- User Profile Form -->
        <form id="userForm">
            <div class="form-group">
                <label for="nameInput">Full Name</label>
                <input type="text" id="nameInput" placeholder="Enter your full name" value="Moshe">
            </div>
            <button type="button" class="btn" onclick="updateName()">
                <i class="fas fa-save"></i>
                Update Name
            </button>
        </form>

        <!-- Display Area -->
        <div class="user-info" id="userInfo">
            <span class="user-info-label">Current User</span>
            <div class="user-name" id="userNameDisplay">
                <i class="fas fa-user-circle"></i>
                Moshe
            </div>
        </div>
        
        <!-- Separator Line -->
        <div class="separator"></div>

        <!-- Footer Link -->
        <div class="footer">
            <a href="greeting.jsp">
                <i class="fas fa-handshake"></i>
                Go to Greeting Page
            </a>
        </div>
    </div>

    <script>
        /* ========== Full‑name update ========== */
        function updateName() {
            const nameInput = document.getElementById('nameInput').value.trim();
            if (nameInput) {
                document.getElementById('displayName').innerText = nameInput;
                document.getElementById('userNameDisplay').innerText = nameInput;
                
                // Add success effect
                const userInfo = document.getElementById('userInfo');
                userInfo.style.transition = 'all 0.3s ease';
                userInfo.style.boxShadow = '0 0 0 2px var(--success)';
                
                setTimeout(() => {
                    userInfo.style.boxShadow = 'none';
                }, 1500);
            }
        }

        /* ========== Dark‑mode toggle ========== */
        const toggleBtn   = document.getElementById('themeToggle');
        const toggleIcon  = document.getElementById('toggleIcon');
        const storageKey  = 'devops-dashboard-theme';

        // Apply saved theme on load
        const savedTheme = localStorage.getItem(storageKey);
        if (savedTheme === 'dark') {
            document.body.classList.add('dark');
            toggleIcon.classList.replace('fa-moon', 'fa-sun');
        }

        toggleBtn.addEventListener('click', () => {
            document.body.classList.toggle('dark');
            const isDark = document.body.classList.contains('dark');
            toggleIcon.classList.toggle('fa-sun', isDark);
            toggleIcon.classList.toggle('fa-moon', !isDark);
            localStorage.setItem(storageKey, isDark ? 'dark' : 'light');
        });
        
        /* ========== Simulated DevOps animation ========== */
        setInterval(() => {
            const deploymentStatus = document.querySelectorAll('.status-item')[1];
            deploymentStatus.classList.toggle('success');
        }, 5000);
    </script>
</body>
</html>