<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .dashboard {
            display: flex;
            flex-grow: 1;
        }

        aside {
            background-color: #444;
            color: #fff;
            flex: 0 0 250px;
            padding: 20px;
        }

        .logo img {
            border-radius: 50%;
            margin-bottom: 20px;
            width: 100px;
        }

        .navigation {
            list-style: none;
            padding: 0;
        }

        .navigation li {
            margin-bottom: 10px;
        }

        .navigation li a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navigation li a:hover {
            background-color: #555;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        .center {
            text-align: center;
        }

        .back-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="main">
	<div class="center">
    <h2>All Jobs</h2>
    </div>
    <c:if test="${not empty jobs}">
    <table>
        <thead>
            <tr>
                <th>Job Position</th>
                <th>Job Description</th>
                <th>Job Link</th>
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="job" items="${jobs}">
                <tr>
                    <td>${job.jobPosition}</td>
                    <td>${job.jobDescription}</td>
                    <td>${job.jobLink }</td>
                    <td>
                        <form action="/editJob/${job.id}" method="get">
                            <button type="submit" class="edit-btn">Edit</button>
                        </form>
                    </td>
                    <td>
                        <form action="/deleteJob/${job.id}" method="get" onsubmit="return confirm('Are you sure you want to delete this job?')">
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

    <br><br><br>
    <div class=center>
    <button class="back-button" onclick="goToDashboard()">Back to Dashboard</button>
	</div>
	</div>
   
</body>

       <script>
        function goToDashboard() {
            window.location.href = '/dashboard';
        }
    </script>
     
</html>
