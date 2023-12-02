<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title> SLAM Register Form</title>
<style>
#length.valid, #lowercase.valid, #uppercase.valid, #digit.valid, #special.valid {
    color: green;
}
#length.invalid, #lowercase.invalid, #uppercase.invalid, #digit.invalid, #special.invalid{
	color: red;
}

input:valid {
	border-left: 4px solid green;
}
input:invalid {
	border-left: 4px solid red;
}
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
td{
	margin-left:5%;
	margin-right:5%;
}
input , select{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-family: Verdana;
}
body{
	 background-color: #2c2c2d;
}
fieldset {
	width: 47%;
	margin: 0 auto;
}
legend {
	margin: 0 auto;
	font-size:200%;
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
#password_button{
  position: relative;
  display: block;
  width: 100%;
  height:10%;
  border-radius: 5px;
  background-color: #5a5a5a;	
  border: solid 1px white;
  color: #fff;
  font-size: 14px;
  font-weight: 300;
  cursor: pointer;
}
#button-container {
  display: flex;
  justify-content: center;
  margin-top: 10px; 
  margin-bottom: 10px; 
}

#navigation{
  position: fixed;
}

footer {
   left: 0;
   bottom: 0;
   width: 100%;
   height: 10%;
   
   color: white;
   text-align: center;
}

dd{
  color: white;
}

td {
  padding-left: 20px; 
  padding-right: 20px;
}
label{
  font-weight: bold;
  color: white;
}

#redirect_p{
  display: flex;
  justify-content: center;
  margin-top: 15px; 
  font-weight: bold;
  color: white;
}
.redirect_log {
  font-weight: bold;
  color: blue;
  text-decoration: none;
}
.redirect_log:hover{
  text-decoration: underline;
}

</style>
</head>
<header> 
	<a href="index.jsp" > <img src="imgs/logoIcon.png"   alt="Logo" width = 60, height = 60/></a>
</header>
<body>
<form action="RegisterController" method="POST">
    <fieldset>
		<legend style = "color:white;"><b> Register to SLAM </b> </legend>
		<!-- <h2 align="center" style = "color:white;"> <b>Register Form </b></h2> -->
		<br>
		<table align="center">
			<tr>
				<td id = "leftRow">
					<label for="user">Username*:</label><br>
					<input type="text" id="user" name="user" placeholder="Name" title="Minimum 4 characters, Maximum 20 characters, Not using bad words" value="${model.user}" required pattern = "^(?!.*(admin|badword2|badword3))[a-zA-Z0-9_]{4,20}$">	  
					<ul>
					<c:if test = "${model.error[0]}">
						<li style = "color:white"> Entered username has been already registered </li>
					</c:if>
					</ul> 
				</td>
				<td id = RigthRow>
					<label for="firstName"> First Name*:</label><br>
					<input type="text" id="firstName" name="firstName" placeholder="First Name" value="${model.firstName}" required pattern="[a-zA-Z]+"><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<label for="mail"> Mail*:  </label><br>
					<input type="email" id="mail" name="mail" placeholder="Mail" title ="Must contain a valid domain" value="${model.mail}" required pattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"><br><br>
				</td>
				<td>
					<label for="lastName"> Last Name*: </label><br>
					<input type="text" id="lastName" name="lastName" placeholder="Last Name" value="${model.lastName}" required pattern="[a-zA-Z]+"><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<label for="pwd1"> Password*: </label><br>
					<input type="password" id="pwd1" name="pwd1" minlength = "8" placeholder="Password" title="Minimum 8 characters, At least 1 lowercase letter, At least 1 uppercase letter, At least 1 number, At least 1 special character" value="${model.pwd1}" required pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$"><br><br>			
				</td>
				<td>
					<label for="pwd2"> Confirm Password*: </label><br>
					<input type="password" id="pwd2" name="pwd2" minlength = "8" placeholder="Password" title="Minimum 8 characters, At least 1 lowercase letter, At least 1 uppercase letter, At least 1 number, At least 1 special character" value="${model.pwd2}" required pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$"><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<button id="password_button" type="button" class="collapsible">Password Requirements</button>
					<div class="content" hidden>
						<dl>
							<dt style = "color:white"> Password must contain:</dt>
							<dd id = length> Minimum 8 characters</dd>
							<dd id = lowercase > At least 1 lowercase</dd>
							<dd id = uppercase > At least 1 uppercase</dd>
							<dd id = digit > At least 1 number</dd>
							<dd id = special > At least 1 special character</dd>
						</dl>					
					</div>
					<p></p>
					
				</td>
			</tr>
			
			<tr>
				<td>  
					<label for="birth"> Birth Date*: </label><br>
					<input type="date" id="birth" name="birth" value="${model.birth}" required pattern = "^\d{4}-\d{2}-\d{2}$"><br><br>
				</td>
				<td>  
					<label for="phoneNumber"> Phone Number:</label><br>
					<input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Optional" title = "+[country code] [phone number]" value="${model.phoneNumber}" pattern = "\+\d{1,3}[-.\s]\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,4}"><br><br>
				</td>  
			</tr>
			<tr>
				<td>
					<label for="securityQuestion"> Choose your security question*: </label><br>
					<select name="securityQuestion" required onchange=allowSecAnswer()>
					 	<option value="" disabled selected>Select your security question</option>
					  	<option value="Name of your pet">Pet Name</option>
					  	<option value="Young Nickname">Young nickname</option>
					  	<option value="Favourite sports player">Favourite Sports Player</option>
					</select><br><br>
				</td>
				<td>
					<label for="state"> Select your country: </label><br>
					<select name="state">
					  	<option value="" disabled selected>Select your country</option>
					  	<option value="Spain">Spain</option>
						<option value="United States">United States</option>
						<option value="Uganda">Uganda</option>
						<option value="Norway">Norway</option>
						<option value="Japan">Japan</option>
					</select><br><br>
			 	</td>
				
			</tr>
			<tr>
				<td>AL
					<label for="securityAnswer"> Answer to the question*: </label><br>
					<input type="text" disabled id="securityAnswer" name="securityAnswer" title = "It must be longer than 4 characters and don't contain badwords" placeholder="Answer to the question" value="${model.securityAnswer}" required pattern = "^(?!.*(nigger|asshole|anal)).{4,}$"><br><br>
				</td>
				<td>
					<label for="terms"> I agree to the terms and conditions </label><br>
					<input type="checkbox" id="terms" name="terms" required><br><br>
				</td>
			</tr>
		</table>
		<div id="button-container">
			<button id="SubmitButton"> Submit </button>
		</div>
		<div>
			<p id = redirect_p>You already have an account?&nbsp;&nbsp;
			<a class = "redirect_log" href = 'ViewLoginForm.jsp'>Login</a></p>  
		</div>
				<br>
		
	</fieldset>
</form>

<script>

	const form = document.getElementById("myform");
	const user = document.getElementById("user");
	const firstName = document.getElementById("firstName");
	const lastName = document.getElementById("lastName");
	const email = document.getElementById("mail");
	const pwd1 = document.getElementById("pwd1");
	const pwd2 = document.getElementById("pwd2");
	const phone = document.getElementById("phoneNumber");
	const securityQuestion = document.getElementById("securityQuestion");
	const securityAnswer = document.getElementById("securityAnswer");
	const passwordToggleButton = document.getElementById("password-toggle-button");
	
	var checkPasswordValidity = function() {
		if (pwd2.value !== pwd1.value) {
			pwd2.setCustomValidity("Passwords must match!");
		} else {
			pwd2.setCustomValidity("");
		}
	}
	
	var coll = document.getElementsByClassName("collapsible");
	var i;
	
	for (i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var content = this.nextElementSibling;
	    if (content.style.display === "block") {
	      content.style.display = "none";
	    } else {
	      content.style.display = "block";
	    }
	  });
	}
	
	email.addEventListener("input", function (event) {
	  if (email.validity.typeMismatch) {
	    email.setCustomValidity("I am expecting an e-mail address!");
	  } else {
	    email.setCustomValidity("");
	  }
	});
	
	window.addEventListener('DOMContentLoaded', function() {
	    user.addEventListener('invalid', function() {
	      if (user.validity.patternMismatch) {
	        user.value = "";
	      }
	    });
	    pwd1.addEventListener('invalid', function() {
	        if (pwd1.validity.patternMismatch) {
	          pwd1.value = "";
	        }
	      });
	    pwd2.addEventListener('invalid', function() {
	        if (pwd2.validity.patternMismatch) {
	          pwd2.value = "";
	        }
	      });
	    phoneNumber.addEventListener('invalid', function() {
	        if (phoneNumber.validity.patternMismatch) {
	          phoneNumber.value = "";
	        }
	      });
	    securityAnswer.addEventListener('invalid', function() {
	        if (securityAnswer.validity.patternMismatch) {
	          securityAnswer.value = "";
	        }
	      });
	  });
	
	pwd2.addEventListener("input", checkPasswordValidity, false);
	pwd1.addEventListener("input", function(event) {
	    var lowercaseRegex = /[a-z]/; // matches at least 1 lowercase character
	    var uppercaseRegex = /[A-Z]/; // matches at least 1 uppercase character
	    var digitRegex = /\d/; // matches at least 1 digit
	    var specialCharRegex = /[!@#\$%\^&\*]/; // matches at least 1 special character
	    
	    if (!lowercaseRegex.test(pwd1.value)) {
	        document.getElementById("lowercase").classList.remove("valid");
	        document.getElementById("lowercase").classList.add("invalid");
	    } else {
	        document.getElementById("lowercase").classList.add("valid");
	        document.getElementById("lowercase").classList.remove("invalid");
	    }
	    
	    if (pwd1.value.length < 8) {
	        document.getElementById("length").classList.remove("valid");
	        document.getElementById("length").classList.add("invalid");
	    } else {
	        document.getElementById("length").classList.add("valid");
	        document.getElementById("length").classList.remove("invalid");
	    }
	    
	    if (!uppercaseRegex.test(pwd1.value)) {
	        document.getElementById("uppercase").classList.remove("valid");
	        document.getElementById("uppercase").classList.add("invalid");
	    } else {
	        document.getElementById("uppercase").classList.add("valid");
	        document.getElementById("uppercase").classList.remove("invalid");
	    }
	    
	    if (!digitRegex.test(pwd1.value)) {
	        document.getElementById("digit").classList.remove("valid");
	        document.getElementById("digit").classList.add("invalid");
	    } else {
	        document.getElementById("digit").classList.add("valid");
	        document.getElementById("digit").classList.remove("invalid");
	    }
	    
	    if (!specialCharRegex.test(pwd1.value)) {
	        document.getElementById("special").classList.remove("valid");
	        document.getElementById("special").classList.add("invalid");
	    } else {
	        document.getElementById("special").classList.add("valid");
	        document.getElementById("special").classList.remove("invalid");
	    }
	});
	
	var allowSecAnswer = function() {
		const selectedValue = this.value;
		  
		if (selectedValue !== "") {
			securityAnswer.disabled = false;
		} else {
			securityAnswer.disabled = true;
		}
	}
	
	form.addEventListener("submit", function (event) {
		checkPasswordValidity();
		if (!this.checkValidity()) {
			this.reportValidity();
			event.preventDefault();
		} 
	}, false);
</script>
</body>

<footer>
<br>
	<hr>
		<i>We are committed to keeping your personal data safe and secure, and will never share or sell it to third parties without your explicit consent.</i>
		<p>&copy; 2023 SLAM. All Rights Reserved.<p>
	
</footer>
</html>
