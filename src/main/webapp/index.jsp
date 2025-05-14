<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DevOps Mini‑Dashboard</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-X8d3JdQYhK2zlZA5QhZTO4XBoK1CqY99u7gopBZ5S8ZmJwM2gClZ4UcHxpsqXyR8EzBNqBG2qgbrl4uP3dcx0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            /* LIGHT THEME */
            --bg-gradient: linear-gradient(135deg, #e0e7ff 0%, #f0fdf4 100%);
            --card-bg: #ffffff;
            --text-color: #1f2937;
            --accent: #4f46e5;
            --accent-hover: #4338ca;
            --border: #d1d5db;
        }
        body.dark {
            /* DARK THEME overrides */
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            --card-bg: #1e293b;
            --text-color: #e2e8f0;
            --accent: #818cf8;
            --accent-hover: #6366f1;
            --border: #334155;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--bg-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: var(--text-color);
            transition: background 0.4s ease; /* smooth theme switch */
        }
        .card {
            background: var(--card-bg);
            padding: 2.5rem 2rem;
            border-radius: 18px;
            width: 100%;
            max-width: 520px;
            box-shadow: 0 18px 40px rgba(0,0,0,0.12);
            position: relative;
        }
        /* DARK/LIGHT toggle button */
        .theme-toggle {
            position: absolute;
            top: 18px;
            right: 18px;
            background: var(--accent);
            border: none;
            color: #fff;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s ease;
        }
        .theme-toggle:hover { background: var(--accent-hover); }
        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
        form { margin-top: 1rem; }
        .form-group { margin-bottom: 1.25rem; text-align: left; }
        label { font-weight: 500; margin-bottom: 0.4rem; display: inline-block; }
        input[type="text"] {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: transparent;
            color: var(--text-color);
            font-size: 1rem;
        }
        .btn {
            display: inline-block;
            margin-top: 0.5rem;
            padding: 0.8rem 1.7rem;
            background: var(--accent);
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.25s ease;
        }
        .btn:hover { background: var(--accent-hover); transform: translateY(-2px); }
        .user-info {
            margin-top: 2rem;
            background: rgba(79, 70, 229, 0.08);
            backdrop-filter: blur(4px);
            border-radius: 14px;
            padding: 1rem 1.2rem;
        }
        .user-name { font-size: 1.35rem; font-weight: 600; text-align: center; }
        /* tweak translucent bg in dark mode */
        body.dark .user-info { background: rgba(129, 140, 248, 0.12); }
        .footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.92rem;
        }
        .footer a { color: var(--accent); text-decoration: none; }
        .footer a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <!-- Dark/Light mode toggle -->
        <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">
            <i class="fas fa-moon" id="toggleIcon"></i>
        </button>

        <!-- Greeting -->
        <h1>Hello, <span id="displayName">Moshe</span>!</h1>

        <!-- User profile form -->
        <form id="userForm">
            <div class="form-group">
                <label for="nameInput">Full Name</label>
                <input type="text" id="nameInput" placeholder="Enter your full name" value="Moshe">
            </div>
            <button type="button" class="btn" onclick="updateName()">Update Name</button>
        </form>

        <!-- Display area -->
        <div class="user-info" id="userInfo">
            <div class="user-name" id="userNameDisplay">Moshe</div>
        </div>

        <!-- footer link -->
        <div class="footer">
            <p><a href="greeting.jsp"><i class="fas fa-handshake"></i> Go to Greeting Page</a></p>
        </div>
    </div>

    <script>
        /* ========== Full‑name update ========== */
        function updateName() {
            const nameInput = document.getElementById('nameInput').value.trim();
            if (nameInput) {
                document.getElementById('displayName').innerText = nameInput;
                document.getElementById('userNameDisplay').innerText = nameInput;
            }
        }

        /* ========== Dark‑mode toggle ========== */
        const toggleBtn   = document.getElementById('themeToggle');
        const toggleIcon  = document.getElementById('toggleIcon');
        const storageKey  = 'devops-dashboard-theme';

        // apply saved theme on load
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
    </script>
</body>
</html>