<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shlomi Hemo WebApp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }
        h1 {
            color: #333;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-top: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        #output {
            margin-top: 20px;
            font-weight: bold;
        }
        a {
            display: block;
            margin-top: 20px;
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello from Shlomi Hemo!</h1>
        <p>Enter your name and click the button:</p>
        <input type="text" id="nameInput" placeholder="Your name here">
        <br>
        <button onclick="sayHello()">Say Hello</button>
        <div id="output"></div>
        <a href="greeting.jsp">Go to Greeting Page</a>
    </div>

    <script>
        function sayHello() {
            const name = document.getElementById("nameInput").value;
            const output = document.getElementById("output");
            if (name.trim() !== "") {
                output.innerText = "Hello, " + name + "!";
            } else {
                output.innerText = "Please enter your name.";
            }
        }
    </script>
</body>
</html>
