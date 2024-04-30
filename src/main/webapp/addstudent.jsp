<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.login-container {
    width: 400px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #333;
}

form {
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    color: black;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="file"] {
	color:black;
    width: calc(100% - 12px);
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 15px;
}

input[type="submit"],
input[type="reset"] {
    width: 48%;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff;
    color: #fff;
    transition: background-color 0.3s;
}

input[type="submit"]:hover,
input[type="reset"]:hover {
    background-color: #0056b3;
}

.submit {
    text-align: center;
}

@media only screen and (max-width: 500px) {
    .login-container {
        width: 90%;
    }

    input[type="submit"],
    input[type="reset"] {
        width: 100%;
        margin-bottom: 10px;
    }
}
	
    </style>
</head>

<body>

    

    <div class="login-container">

        <h2>Registration Form</h2>

        <form action="addstudentinfo" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        	
        	 <input type="hidden" id="jobLink" name="jobLink" value="${param.jobLink}">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required><br>

            <label for="graduationdetails">Graduation Details:</label>
            <input type="text" name="graduationdetails" required><br>

            <label for="masterdetails">Master Details (Optional):</label>
            <input type="text" name="masterdetails" ><br>

            <label for="resume">Upload Resume:</label>
            <input type="file" id="resume" name="resume" accept=".pdf, .doc, .docx"><br>

            <div class="submit"><input type="submit" value="Submit" onclick="showConfirmation()">
            <input type="reset" value="Clear">
            </div>
        </form>

    </div>

</body>

</html>
