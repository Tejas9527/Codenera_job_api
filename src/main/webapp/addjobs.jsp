<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application Form</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .center
        {
        text-align: center;
        }

        .login-container {
            background-color: #fff;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back-button {
            background-color: #6c757d;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        .job-entry {
            margin-bottom: 20px;
        }
    </style>
    <script>
        function addJob() {
            // Get the container where new job fields will be added
            var container = document.getElementById("jobContainer");

            // Create elements for new job fields
            var jobDiv = document.createElement("div");
            jobDiv.classList.add("job-entry");

            var jobPositionLabel = document.createElement("label");
            jobPositionLabel.textContent = "Job Position:";
            var jobPositionInput = document.createElement("input");
            jobPositionInput.type = "text";
            jobPositionInput.name = "jobPosition";
            jobPositionInput.required = true;

            var jobDescriptionLabel = document.createElement("label");
            jobDescriptionLabel.textContent = "Job Description:";
            var jobDescriptionInput = document.createElement("input");
            jobDescriptionInput.type = "text";
            jobDescriptionInput.name = "jobDescription";
            jobDescriptionInput.required = true;

            var jobLinkLabel = document.createElement("label");
            jobLinkLabel.textContent = "Job Link:";
            var jobLinkInput = document.createElement("input");
            jobLinkInput.type = "text";
            jobLinkInput.name = "jobLink";
            jobLinkInput.required = true;

            // Append new job fields to the container
            jobDiv.appendChild(jobPositionLabel);
            jobDiv.appendChild(jobPositionInput);
            jobDiv.appendChild(document.createElement("br"));
            jobDiv.appendChild(jobDescriptionLabel);
            jobDiv.appendChild(jobDescriptionInput);
            jobDiv.appendChild(document.createElement("br"));
            jobDiv.appendChild(jobLinkLabel);
            jobDiv.appendChild(jobLinkInput);
            jobDiv.appendChild(document.createElement("br"));

            container.appendChild(jobDiv);
        }

        function goToDashboard() {
        	window.location.href = "/dashboard";
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Job Application Form</h2>
        <form action="addJob" method="post">
            <!-- Container to hold dynamically added job fields -->
            <div id="jobContainer">
                <div class="job-entry">
                    <label for="jobPosition">Job Position:</label>
                    <input type="text" name="jobPosition" required>
                    <br>
                    <label for="jobDescription">Job Description:</label>
                    <input type="text" name="jobDescription" required>
                    <br>
                    <label for="jobLink">Job Link:</label>
                    <input type="text" name="jobLink" required>
                    <br>
                </div>
            </div>
            <button type="button" onclick="addJob()">Add Another Job</button><br><br>
            <button type="submit" value="Submit">Submit</button><br><br>
            </form>
            <div class="center">
            <button class="back-button" onclick="goToDashboard()">Back to Dashboard</button>
        	</div>
    </div>
</body>
</html>
