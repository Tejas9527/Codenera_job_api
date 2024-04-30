<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #login-box {
            width: 400px;
            height: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div id="login-box">
        <h2>Edit Job</h2>
        <form action="/updateJob" method="post">
            <input type="hidden" name="id" value="${job.id}">
            <label for="jobPosition">Job Position:</label>
            <input type="text" id="jobPosition" name="jobPosition" value="${job.jobPosition}" required>
            <br>

            <label for="jobDescription">Job Description:</label>
            <input type="text" name="jobDescription" value="${job.jobDescription}" required>
            <br>
            
            <label for="jobLink">Job Link:</label>
            <input type="text" name="jobLink" value="${job.jobLink}" required>
			<br><br>
            <input type="submit" value="Update">
        </form>
    </div>

</body>

</html>
