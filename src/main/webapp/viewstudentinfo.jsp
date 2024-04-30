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
            background-color: #f2f2f2;
        }
        .main {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .center {
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .back-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        table
        {
        border: 2px solid black;
        }
         .download-button {
        padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        transition: background-color 0.3s ease; 
    }

    .download-button:hover {
        background-color: #218838; /* Darker green on hover */
    }
    </style>
</head>
<body>
    <div class="main">
        <div class="center">
            <h2>All Student Data</h2>
        </div>
        <table border="2">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Graduation Details</th>
                    <th>Master Details</th>
                    <th>Resume Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="detail" items="${details}">
                    <tr>
                        <td>${detail.fullname}</td>
                        <td>${detail.email}</td>
                        <td>${detail.phone}</td>
                        <td>${detail.graduation_details}</td>
                        <td>${detail.master_details}</td>
                        <td>${detail.resumename}</td>
                        <td><button onclick="viewPdf('${detail.id}')">View PDF</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br><br>
        <div class="center">
        	
            <button class="back-button" onclick="goToDashboard()">Back to Dashboard</button>
            <button class="download-button" onclick="downloadCsv()">Download PDF</button>
        </div>
    </div>
    <script>
        function goToDashboard() {
            window.location.href = '/dashboard';
        }
        function viewPdf(detailId) {
            window.open('viewPdf/' + detailId, '_blank');
        }
        function downloadCsv() {
            fetch('/downloadCsv')
                .then(response => {
                    if (response.ok) {
                        return response.blob();
                    }
                    throw new Error('Network response was not ok.');
                })
                .then(blob => {
                    const link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = 'student_data.csv';
                    link.click();
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    </script>
</body>
</html>
