<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title> SLAM Login Form</title>
<style>

header {
  text-align: center;
  padding: 20px;
}

header img {
  display: block;
  margin: 0 auto;
  max-width: 100%;
  height: auto;
}

@media (max-width: 600px) {
  header img {
    max-width: 80%;
  }
}
body{
	margin-top: 3%;
	background-image: url("imgs/bg.gif");
    	background-repeat: repeat;
  	 	background-size: cover;
  	 
}
fieldset {
	width: 47%;
	margin: 0 auto;
	background: rgba(0,0,0,0.4);
}
legend {
	margin: 0 auto;
	font-size:200%;
}

td{
	margin-left:5%;
	margin-right:5%;
}

input{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#SubmitButton {
  position: relative;
  display: block;
  width: 200px;
  height: 36px;
  border-radius: 15px;
  background-color: #1c89ff;
  border: solid 1px transparent;
  color: #fff;
  font-size: 18px;
  font-weight: 300;
  cursor: pointer;
  transition: all .1s ease-in-out;
  &:hover {
    background-color: transparent;
    border-color: #fff;
    transition: all .1s ease-in-out;
  }
}
#button-container {
  display: flex;
  justify-content: center;
  margin-top: 10px; 
  margin-bottom: 10px; 
}

footer {
   left: 0;
   bottom: 3%;
   width: 100%;
   height: 10%;
   color: white;
   text-align: center;
   position: fixed;   
}

label{
  font-weight: bold;
  color: white;
}
#redirect_p{
  display: flex;
  justify-content: center;
  margin-top: 15px; 
  color: white;
}
.redirects {
  color: red;
  text-decoration: none;
}
.redirects:hover{
  text-decoration: underline;
}

.tahoma, .redirects, #redirect_p, input, title, legend, h2, .error{
  font-family: Tahoma, "Trebuchet MS", sans-serif;
}
.error{
  font-weight: bold;
  font-size: 12px;
}

</style>
</head>
<header>
	<a href="index.jsp" ><img src="imgs/logoIcon.png" href="index.jsp" alt="Logo"  width = 60, height = 60/></a>
</header>
<body>

<form action="LoginController" method="POST">
	<fieldset>
		<legend style = "color:white;"><b>Log in to Slam </b> </legend>
		<br><br>
		<table align="center">
			<tr>
	           <td>
		           <label class = "tahoma" for="user">Username: </label>
		           <input type="text" name="user" value="${login.user}" placeholder="Enter your username" required>
					<c:if test = "${login.error[0]}">
						<p class = "error" style = "color:white"> Username is wrong! </p>
					</c:if>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
		           <label class = "tahoma" for="pwd1">Password: </label>
		           <input type="password" name="pwd1" value="${login.pwd1}" placeholder="Enter your password" required>
					<c:if test = "${login.error[1]}">
						<p class = "error" style = "color:white"> Password is wrong!&nbsp;&nbsp;
						<a class = "redirects" href= 'ChangePasswordController' > Did you forget the password? </a>
						</p>
					</c:if>
				</td>
			</tr>
		</table>
		<br>
		<div id="button-container">
			<button id="SubmitButton"> Submit </button>
		</div>
		
		<div>
			<p id = redirect_p>You don't have an account yet?&nbsp;&nbsp;
			<a class = "redirects" href = 'ViewRegisterForm.jsp'>Register</a></p>  
		</div>
		<br><br>	
	</fieldset>            
</form>
</body>
<footer>
<br>
	<hr>
		<i>We are committed to keeping your personal data safe and secure, and will never share or sell it to third parties without your explicit consent.</i>
		<p>&copy; 2023 SLAM. All Rights Reserved.<p>
	
</footer>
<script></script>
</html>

