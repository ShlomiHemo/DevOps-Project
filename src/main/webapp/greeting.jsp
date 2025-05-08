<html>
<head>
    <title>Shlomi's Web App</title>
</head>
<body>
    <h1>Hello from Shlomi Hemo!</h1>
    <%
        String userInput = request.getParameter("userInput");
        if (userInput != null && !userInput.isEmpty()) {
            out.println("<p>You entered: " + userInput + "</p>");
        } else {
            out.println("<p>No input provided.</p>");
        }
    %>
</body>
</html>
