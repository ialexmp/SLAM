<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title> SLAM Login Form</title>
<style>

#length.valid, #lowercase.valid, #uppercase.valid, #digit.valid, #special.valid {
    color: green;
}
#length.invalid, #lowercase.invalid, #uppercase.invalid, #digit.invalid, #special.invalid{
	color: red;
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
   bottom: 0;
   width: 100%;
   height: 10%;
   color: white;
   text-align: center;
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
  color: blue;
  text-decoration: none;
}
.redirects:hover{
  text-decoration: underline;
}

.tahoma, .redirects, #redirect_p, input, title, legend, h2, .error, dd{
  font-family: Tahoma, "Trebuchet MS", sans-serif;
}
.error{
  font-weight: bold;
  font-size: 12px;
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



</style>
</head>
<body>
<form action="ChangePasswordController" method="POST">
	<fieldset>
		<a href="ViewLoginForm.jsp" ><img src="imgs/logoIcon.png" href="ViewLoginForm.jsp" alt="Logo" width = 60, height = 60/></a>
		<legend style = "color:white;"><b>Changing password of ${login.user} </b> </legend>		
		<table align="center">
			<tr>
	           <td>
					<label class = "tahoma" for="newpwd"> New Password: </label><br>
					<input type="password" id="newpwd" name="newpwd" minlength = "8" placeholder="Password" title="Minimum 8 characters, At least 1 lowercase letter, At least 1 uppercase letter, At least 1 number, At least 1 special character" value="${login.newpwd}" required pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$">
					<c:if test = "${login.error[2]}">
						<p class = "error" style = "color:white"> The new password can't be equal to the original! </p>
					</c:if>								
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
					<label class = "tahoma" for="newpwd2"> Confirm Password: </label><br>
					<input type="password" id="newpwd2" name="newpwd2" minlength = "8" placeholder="Password" title="Minimum 8 characters, At least 1 lowercase letter, At least 1 uppercase letter, At least 1 number, At least 1 special character" value="${login.newpwd2}" required pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$"><br><br>
				</td>
			</tr>
			<tr>
				<td>
					<label class = "tahoma" for="securityAnswer"> Answer to the security question: ${login.securityQuestion} </label><br>
					<input type="text" id="securityAnswer" name="securityAnswer" placeholder="Answer to the question" value="${login.securityAnswer}" >
					<c:if test = "${login.error[3]}">
						<p class = "error" style = "color:white"> Incorrect answer! </p>
					</c:if>							
				</td>
			</tr>
		</table>
		<div id="button-container">
			<button id="SubmitButton"> Change Password </button>
		</div>
	</fieldset>            
</form>
</body>
<footer>
<br>
	<hr>
		<i>We are committed to keeping your personal data safe and secure, and will never share or sell it to third parties without your explicit consent.</i>
		<p>&copy; 2023 SLAM. All Rights Reserved.<p>
	
</footer>
<script>

const pwd1 = document.getElementById("newpwd");
const pwd2 = document.getElementById("newpwd2");

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

form.addEventListener("submit", function (event) {
	checkPasswordValidity();
	if (!this.checkValidity()) {
		this.reportValidity();
		event.preventDefault();
	} 
}, false);

</script>
</html>

