<!DOCTYPE html>
<html>
<head>
<title>Not Logged-in User Menu</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	body {
	 	background-image: url("imgs/bg.gif");
    	background-repeat: repeat;
  	 	background-size: cover;
  	 	position: fixed;
	}
	.container {
		width: 115%;
		max-width: 1200px;
		margin: 0 auto;
		box-shadow: 0px 0px 50px rgba(255, 255, 255, 0.5);
		background: transparent;
		border-radius: 10px;
		padding: 50px;
	}

	.title {
		text-align: center;
		width: 100%;
		color: white;
		font-size: 1.5vw;
		margin-top: 2%;
		margin-bottom: 3%;
	}
	.row {
		flex: 1;
		padding: 1%;
		margin: 1.5%;
		background-color: #2c2c2d;
		cursor: pointer;
		width: 45%;
		height: auto;
		margin: 0 auto;
		margin-bottom: 5%;
		border-radius: 15px;
		display: flex;
		align-items: center;
		justify-content: center;
		border: 2px solid white;
	}
	.row:hover {
		background-color: #F79D51;
		transition: all .1s ease-in-out;
	}
	.row h3 {
		font-size: 1.2rem;
		margin: 2%;
		color: white;
   		text-shadow: black 1px 0px 2px; /* color offset-x offset-y blur-radius */
	}
	.separator {
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
		font-family: Arial, sans-serif;
		font-weight: bold;
		margin: 20px 0;
		width: 35%;
		margin-left: auto;
		margin-right: auto;
	}
	.separator::before,
	.separator::after {
		content: "";
		flex-grow: 1;
		background-color: white;
		height: 1px;
		margin: 0 10px;
	}
	footer {
		left: 0;
		bottom: 0;
		width: 100%;
		padding: 2% 0;
		color: white;
		text-align: center;
		position: fixed;
	}
	footer p {
		margin: 0;
	}
	
	/* Styles for the covering box */
	.covering-box {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		z-index: 999;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	/* Additional styles to center the content within the box */
	.covering-box-content {
		text-align: center;
		color: white;
	}
	
	/* Media queries for responsiveness */
	@media (max-width: 1200px) {
		.container {
			width: 90%;
		}
	}
	
	@media (max-width: 600px) {
		.title {
			font-size: 6vw;
		}
		.row {
			width: 90%;
		}
	}
</style>
</head>
<body>
	<div class="covering-box">
		<div class="covering-box-content">
			<div class="container">
				<div class="title">
					<a>
						<img src="imgs/logoIcon.png" alt="Logo" width="60" height="60"/>
						WELCOME TO SLAM
						<img src="imgs/logoIcon.png" alt="Logo" width="60" height="60"/>
					</a>
				</div>
		
				<div class="row" onclick="location.href='ViewLoginForm.jsp';">
					<h3 style="font-family: Arial, sans-serif; font-weight: bold;">Login</h3>
				</div>
		
				<div class="row" onclick="location.href='ViewRegisterForm.jsp';">
					<h3 style="font-family: Arial, sans-serif; font-weight: bold;">Register</h3>
				</div>
		
				<div class="separator">or</div>
				<div class="row" onclick="location.href='MenuController?anonymous=true';">
					<h3 style="font-family: Arial, sans-serif; font-weight: bold;">Anonymous</h3>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
	<hr>
	<i>We are committed to keeping your personal data safe and secure, and will never share or sell it to third parties without your explicit consent.</i>
	<p>&copy; 2023 SLAM. All Rights Reserved.</p>
</footer>
</html>
