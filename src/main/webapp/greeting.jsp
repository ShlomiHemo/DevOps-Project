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
        }
        .term {
            position: absolute;
            font-size: 1.2em;
            font-weight: bold;
            animation: float 20s infinite;
            opacity: 0.7;
        }
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-50px) rotate(180deg); }
            100% { transform: translateY(0px) rotate(360deg); }
        }
    </style>
</head>
<body>
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
    </script>
    <a href="index.jsp" style="position: absolute; bottom: 20px; left: 20px; color: lightblue; font-size: 18px;">← Back to Home</a>
</body>
</html>
