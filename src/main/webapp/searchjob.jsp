<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: cadetblue;
            margin-top: 20px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* Two columns with equal width */
            grid-gap: 20px;
            max-width: 900px;
            margin: 150px auto; /* Adjust margin to center vertically */
            padding: 20px;
        }
        .grid-item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .grid-item h3 {
            margin-top: 0;
            text-align: center;
        }
        .grid-item p {
            margin-bottom: 0;
            text-align: center;
        }
        .apply-button-wrapper {
            display: flex;
            justify-content: center;
        }
        .apply-button {
            padding: 8px 16px;
            text-align: center;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .apply-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Search Results</h1>
    <div class="grid-container">
        <c:forEach var="job" items="${jobs}">
            <div class="grid-item">
                <h3>Job Title: ${job.jobPosition}</h3>
                <p>Job Description: ${job.jobDescription}</p>
                <p>Job Link: ${job.jobLink}</p>
                <p>Job Posted Dates: ${job.dateAdded}</p>
                <br>
                <div class="apply-button-wrapper">
                    <button class="apply-button" type="button" onclick="openFormInNewTab('${job.jobLink}')">Apply</button>
                </div>
            </div>
        </c:forEach>
    </div>
    <script>
        function openFormInNewTab(jobLink) {
            window.open('/addstudent?jobLink=' + encodeURIComponent(jobLink), '_blank');
        }
    </script>
</body>
</html>
