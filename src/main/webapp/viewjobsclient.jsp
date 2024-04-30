<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>


<html>
<head>
<title>Your Page Title</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin-top: 50px;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	position: relative;
	
	width: 75%;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 20px;
	text-align: left;
	margin-left: 25px;
}

.login-button {
	padding: 10px 20px;
	position: absolute;
	top: 0;
	right: 0;
	margin-right: 5px;
	text-align: right;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.login-button:hover {
	background-color: #0056b3;
}

.heading {
	margin-top: 50px;
	text-align: center;
	margin-bottom: 20px;
}

.job-card {
	background-color: #fff;
	padding: 20px;
	text-align: center;
	border: 2px solid black;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.job-card h3 {
	margin-top: 0;
	color: cadetblue;
	text-align: center;
}

.job-card p {
	margin-bottom: 10px;
	text-align: center;
}

.apply-button {
	padding: 8px 16px;
	background-color: #28a745;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
}

.apply-button:hover {
	background-color: #218838;
}

.search-form {
	text-align: center;
}

.form-container::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
	background-image: url("logo/job.jpg"); /* Your background image URL */
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	opacity: 0.1; /* Adjust the opacity value as needed */
	z-index: -1; /* Ensure the pseudo-element is behind other content */
}

.form-heading {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

.input-group {
	display: flex;
	align-items: center;
	width: 900px;
	margin-left: 100px;
}

.search-icon {
	margin-right: 10px;
}

.search-input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 12px;
	font-size: 16px;
}

.search-button {
	padding: 10px 20px;
	margin-left: 10px; /* Adjust margin as needed */
	background-color: orange;
	color: #fff;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	font-size: 16px;
}

.search-button:hover {
	background-color: #0056b3;
}

#counter {
	font-size: 18px;
	margin-top: 100px;
	margin-left: 20px;
	color: #555;
	text-align: left;
}

.counters-container {
	display: flex;
	margin-top: 20px;
}

.counter {
	font-size: 35px;
	color: black;
	text-align: left;
}

#counter1 {
	margin-left: 100px;
}

#counter2 {
	margin: 0px 40px 0px 40px;
}

#counter3 {
	margin-right: 280px;
}

@keyframes slides {
  from {
    transform: translateX(0);
  }
  to {
    transform: translateX(-100%);
  }
}

.logos {
  overflow: hidden;
  padding: 30px 0px;
  
  white-space: nowrap;
  position: relative;
}

img
{
margin-left: 100px;
}

.logos:before, .logos:after {
  position: absolute;
  top: 0;
  content: '';
  width: 250px;
  height: 100%;
  z-index: 2;
}

.logos:before {
  left: 0;
  background: linear-gradient(to left, rgba(255,255,255,0), rgb(255, 255, 255));
}

.logos:after {
  right: 0;
  background: linear-gradient(to right, rgba(255,255,255,0), rgb(255, 255, 255));
}

.logo_items {
  display: inline-block;
  animation: 35s slides infinite linear;
}

.logos:hover .logo_items {
  animation-play-state: paused;
}

.logo_items img{
  height: 70px;
}

.center {
	margin-left: 540px;
	margin-top: 150px;
}

.center1 {
	margin-left: 545px;
	color: black;
}

.center2 {
	margin-left: -750px;
	color: blue;
	border: 2px solid black;
	display: inline;
	padding: 10px;
	border-radius: 12px;
	background-color: rgba(235, 235, 235, 0.5);
}
</style>
</head>
<body>

	<button class="login-button" onclick="redirectToLogin()">Login</button>


	<form action="searchjob" method="get" class="search-form">
		<div class="form-container">

			<h1 class="center2">Find Millions of Jobs Opportunities</h1>
			<br> <br> <br> <br>
			<div class="input-group">
				<input type="text" name="jobPosition" class="search-input"
					placeholder="&#128269;    Enter Job Title">
				<button type="submit" class="search-button">Search Job</button>
			</div>

			<br> <br> <br> <br>
			<h2>
				<div class="counters-container">
					<div class="counter" id="counter1"></div>
					<div class="counter" id="counter2"></div>
				</div>

			</h2>
		</div>
	</form>
	<h3 class="center">Top Hiring Companies</h3>
	<div class="logos">
		<div class="logo_items">
			<img src="logo/1.png" alt="Image 1">
<img src="logo/2.png" alt="Image 2">
<img src="logo/3.png" alt="Image 3">
<img src="logo/4.png" alt="Image 4">
<img src="logo/5.png" alt="Image 5">
<img src="logo/6.png" alt="Image 6">
<img src="logo/7.png" alt="Image 7">
<img src="logo/8.png" alt="Image 7">
<img src="logo/10.png" alt="Image 10">
<img src="logo/11.png" alt="Image 11">
<img src="logo/12.png" alt="Image 12">
<img src="logo/13.png" alt="Image 13">
<img src="logo/14.png" alt="Image 14">
<img src="logo/15.png" alt="Image 15">
<img src="logo/16.png" alt="Image 16">
<img src="logo/17.jpg" alt="Image 17">
<img src="logo/18.png" alt="Image 18">
<img src="logo/20.png" alt="Image 19">

<img src="logo/21.png" alt="Image 21">
<img src="logo/22.png" alt="Image 22">
<img src="logo/23.png" alt="Image 23">
<img src="logo/24.png" alt="Image 24">
<img src="logo/25.png" alt="Image 25">
<img src="logo/26.png" alt="Image 26">
<img src="logo/27.png" alt="Image 27">
<img src="logo/28.png" alt="Image 28">
<img src="logo/29.png" alt="Image 29">
<img src="logo/30.png" alt="Image 30">
<img src="logo/31.png" alt="Image 31">
<img src="logo/32.jpg" alt="Image 32">
<img src="logo/33.png" alt="Image 33">
<img src="logo/34.png" alt="Image 34">
<img src="logo/35.png" alt="Image 35">
<img src="logo/36.png" alt="Image 36">
<img src="logo/37.png" alt="Image 37">
<img src="logo/38.png" alt="Image 38">
<img src="logo/39.png" alt="Image 39">
<img src="logo/40.png" alt="Image 40">
<img src="logo/41.png" alt="Image 41">
<img src="logo/42.png" alt="Image 42">
<img src="logo/43.png" alt="Image 43">
<img src="logo/44.png" alt="Image 44">
<img src="logo/45.png" alt="Image 45">
<img src="logo/46.png" alt="Image 46">
<img src="logo/47.png" alt="Image 47">
<img src="logo/48.png" alt="Image 48">
<img src="logo/49.png" alt="Image 49">
<img src="logo/50.png" alt="Image 50">
<img src="logo/51.png" alt="Image 51">
<img src="logo/52.png" alt="Image 52">
<img src="logo/53.png" alt="Image 53">
<img src="logo/54.png" alt="Image 54">
<img src="logo/55.png" alt="Image 55">
<img src="logo/56.png" alt="Image 56">
<img src="logo/57.png" alt="Image 57">
<img src="logo/58.png" alt="Image 58">
<img src="logo/59.png" alt="Image 59">
<img src="logo/60.png" alt="Image 60">
<img src="logo/61.png" alt="Image 61">
<img src="logo/62.png" alt="Image 62">
<img src="logo/63.png" alt="Image 63">
<img src="logo/64.png" alt="Image 64">
<img src="logo/65.png" alt="Image 65">
<img src="logo/66.png" alt="Image 66">
<img src="logo/67.png" alt="Image 67">
<img src="logo/68.png" alt="Image 68">
<img src="logo/69.png" alt="Image 69">
<img src="logo/70.png" alt="Image 70">
<img src="logo/71.png" alt="Image 71">
<img src="logo/72.png" alt="Image 72">
<img src="logo/73.png" alt="Image 73">
<img src="logo/74.png" alt="Image 74">
<img src="logo/75.png" alt="Image 75">
<img src="logo/76.png" alt="Image 76">
<img src="logo/77.png" alt="Image 77">
<img src="logo/78.png" alt="Image 78">
<img src="logo/79.png" alt="Image 79">
<img src="logo/80.png" alt="Image 80">
<img src="logo/81.png" alt="Image 81">
<img src="logo/82.png" alt="Image 82">
<img src="logo/83.png" alt="Image 83">
<img src="logo/84.png" alt="Image 84">
<img src="logo/85.png" alt="Image 85">
<img src="logo/86.png" alt="Image 86">
<img src="logo/87.png" alt="Image 87">
		</div>
	</div>
		<br> <br>
		<c:if test="${not empty jobs}">
			<h3 class="center1">Latest Job's</h3>
			<br>
			<br>
			<div class="container">

				<c:forEach var="job" items="${jobs}">
					<div class="job-card">
						<h3>Job Title : ${job.jobPosition}</h3>
						<p>Job Description : ${job.jobDescription}</p>
						<p>
							Job Link : ${job.jobLink }
							<p>
							Job Posted Date:
							<c:set var="formattedDate"
								value="${job.dateAdded.format(DateTimeFormatter.ofPattern('dd MMMM yyyy'))}" />
                    ${formattedDate}
                </p><button class="apply-button" type="button"
								onclick="openFormInNewTab('${job.jobLink}')">Apply</button>
						</div>
        </c:forEach>
    </div>
</c:if>




<script>
	function startCounter1(range) {
		var counterElement = document.getElementById('counter1');
		var count = 20000;
		var interval = setInterval(function() {
			counterElement.textContent = "Register Members: " + count++;
			if (count > range) {
				clearInterval(interval);
			}
		}, 0.0000001); // 200 milliseconds interval
	}
	// Start the counter
	startCounter1(32550);

	function startCounter2(range) {
		var counterElement = document.getElementById('counter2');
		var count = 0;
		var interval = setInterval(function() {
			counterElement.textContent = "Companies: " + count++;
			if (count > range) {
				clearInterval(interval);
			}
		}, 0.0001); // 50 milliseconds interval1
	}
	// Start the counter
	startCounter2(1587);

	function startCounter3(range) {
		var counterElement = document.getElementById('counter3');
		var count = 0;
		var interval = setInterval(function() {
			counterElement.textContent = "Posted: " + count++;
			if (count > range) {
				clearInterval(interval);
			}
		}, 0.00001); // 100 milliseconds interval
	}
	// Start the counter
	startCounter3(1365);
</script>

<script>
	function openFormInNewTab(jobLink) {
		window.open('/addstudent?jobLink=' + encodeURIComponent(jobLink),
				'_blank');
	}

	function redirectToLogin() {
		window.location.href = '/log';
	}
</script>


</body>
</html>
