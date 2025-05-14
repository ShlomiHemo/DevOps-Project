<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Project Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0e7ff, #f0fdf4);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            color: #1f2937;
        }

        .container {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #4f46e5;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .form-group {
            text-align: left;
            margin: 1rem 0;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        input[type="text"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
        }

        .btn {
            margin-top: 1rem;
            padding: 0.75rem 1.5rem;
            background-color: #4f46e5;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #4338ca;
        }

        .user-info {
            margin-top: 2rem;
            background-color: #eef2ff;
            padding: 1rem;
            border-radius: 12px;
        }

        .user-name {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .footer {
            margin-top: 2rem;
            font-size: 0.9rem;
        }

        .footer a {
            color: #4f46e5;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello, <span id="displayName">Moshe</span>!</h1>

        <form id="userForm">
            <div class="form-group">
                <label for="nameInput">Full Name</label>
                <input type="text" id="nameInput" placeholder="Enter your full name" value="Moshe">
            </div>
            <button type="button" class="btn" onclick="updateName()">Update Name</button>
        </form>

        <div class="user-info" id="userInfo">
            <div class="user-name" id="userNameDisplay">Moshe</div>
        </div>

        <div class="footer">
            <p><a href="greeting.jsp"><i class="fas fa-smile"></i> Go to Greeting Page</a></p>
        </div>
    </div>

    <script>
        function updateName() {
            const nameInput = document.getElementById("nameInput").value.trim();
            if (nameInput !== "") {
                document.getElementById("displayName").innerText = nameInput;
                document.getElementById("userNameDisplay").innerText = nameInput;
            }
        }
    </script>
</body>
</html>