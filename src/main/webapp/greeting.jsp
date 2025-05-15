<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevOps Buzzwords Chaos</title>
    <style>
        body {
            background-color: #111;
            color: white;
            font-family: 'Courier New', monospace;
            overflow: hidden;
            margin: 0;
            padding: 0;
        }

        .term {
            position: absolute;
            font-weight: bold;
            animation: float 20s infinite;
            opacity: 0.7;
        }

        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-50px) rotate(180deg); }
            100% { transform: translateY(0px) rotate(360deg); }
        }

        .center-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }

        input[type="number"] {
            padding: 10px;
            font-size: 16px;
            width: 200px;
            border: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: lightblue;
            cursor: pointer;
        }

        .message {
            margin-top: 15px;
            font-size: 18px;
        }
    </style>
</head>
<body>

    <div class="center-box">
        <div>Enter your grade:</div>
        <input type="number" id="gradeInput" placeholder="Grade (0-110)" min="0" max="110">
        <br>
        <button onclick="checkGrade()">Submit</button>
        <div id="message" class="message"></div>
    </div>

    <script>
        const terms = [
            "CI/CD", "Jenkins", "Docker", "Kubernetes", "Terraform", "Git",
            "Monitoring", "Grafana", "Prometheus", "Ansible", "Pipelines",
            "Agile", "Scrum", "Dev", "Ops", "Testing", "Logging", "ELK Stack",
            "Uptime", "Deployment", "Automation", "Build", "Release", "Nexus",
            "Artifacts", "SonarQube", "Load Testing", "Selenium", "Gatling",
            "Cloud", "AWS", "Azure", "GCP", "Infrastructure as Code", "Helm",
            "Rollback", "Failover", "Microservices", "Containers", "Version Control"
        ];

        function getRandomPosition() {
            const x = Math.floor(Math.random() * window.innerWidth);
            const y = Math.floor(Math.random() * window.innerHeight);
            return { x, y };
        }

        terms.forEach(term => {
            const div = document.createElement("div");
            div.className = "term";
            div.innerText = term;

            const pos = getRandomPosition();
            div.style.left = pos.x + "px";
            div.style.top = pos.y + "px";
            div.style.color = `hsl(${Math.random() * 360}, 70%, 70%)`;
            div.style.fontSize = `${Math.random() * 20 + 14}px`;

            document.body.appendChild(div);
        });

        function checkGrade() {
            const input = parseInt(document.getElementById("gradeInput").value);
            const messageDiv = document.getElementById("message");

            if (isNaN(input)) {
                messageDiv.innerText = "Please enter a valid number.";
                messageDiv.style.color = "red";
                return;
            }

            if (input > 110) {
                messageDiv.innerText = "Maximum grade is 110.";
                messageDiv.style.color = "red";
            } else if (input === 110) {
                messageDiv.innerText = "Don't Forget the bonus increase increase !";
                messageDiv.style.color = "lightgreen";
            } else if (input >= 100 && input < 110) {
                messageDiv.innerText = "why not 110 !";
                messageDiv.style.color = "lightblue";
            } else {
                messageDiv.innerText = "You need to increase your grade MOSHE !";
                messageDiv.style.color = "orange";
            }
        }
    </script>

    <a href="index.jsp" style="position: absolute; bottom: 20px; left: 20px; color: lightblue; font-size: 18px;">← Back to Home</a>

</body>
</html>
