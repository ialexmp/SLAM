<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<title>SLAM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
<style>
html, body, h1, h2, h3, h4, h5 {
  font-family: "Poppins", sans-serif;
}

/* Popup Register Form */
.w3-modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

.w3-modal-content {
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 40%;
  background-color: #fff;
}

.w3-modal-content input[type="text"],
.w3-modal-content input[type="email"],
.w3-modal-content input[type="password"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.w3-modal-content button {
  width: auto;
  padding: 10px 18px;
}

footer {
  left: 0;
  bottom: 3%;
  width: 100%;
  height: 10%;
  color: white;
  text-align: center;
}

.w3-col.m2{
  margin-left:5%;
}
.w3-col.m4{
  text-align:center;
}

.w3-round {
  border-radius: 20px; /* Adjust the value to increase or decrease the roundness */
}
.separator {
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
		font-family: Arial, sans-serif;
		font-weight: bold;
		margin: 20px 0;
		width: 75%;
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
.verticalLine{
  border-left: 1px solid white;
  height: 100%;
  position: fixed;
  margin-left: 22%;
  top: 0;
}
.w3-left-align{
	margin-left: 20%;
}

p,input{
	font-size:120%
}

.buttons > *{
    display: inline-block;
    margin-right:10px;
}

.hiddenButton{
	display: none;
}
.left-column{
	position: sticky;
	overflow-y: scroll;
	top: 3%;
}

.w3-margin-left-large {
  margin-left: 75%; /* Adjust the value as needed */
}

.transparent-button {
  background-color: transparent;
}


  .form-row {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
  }

  .form-container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    gap: 20px;
  }

  .form-container .column {
    flex-basis: 45%;
    display: flex;
    flex-direction: column;
    align-items: stretch;
  }

  .form-theme {
    background-color: black;
    color: white;
    padding: 20px;
  }

  .form-theme h2 {
    margin-top: 0;
  }

  .form-theme label {
    font-weight: bold;
  }

  .form-theme input[type="text"],
  .form-theme input[type="email"],
  .form-theme input[type="tel"],
  .form-theme select {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 10px;
    color: black;
    background-color: white;
  }

  .form-theme button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
  }

  .form-theme button[type="submit"]:hover {
    background-color: #45a049;
  }

  .form-theme header {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    text-align: center;
    border-radius: 4px 4px 0 0;
  }

  .form-theme .w3-button {
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
</style>


<body class="w3-theme-d1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function Delete() {
    document.getElementById("delete").submit();
}
function editTweet(tweetId) {
	  var tweetContent = document.querySelector('${tweetId}.editable');
	  tweetContent.removeAttribute("readonly");
	  // Enable contenteditable attribute
	  tweetContent.contentEditable = true;
	  tweetContent.focus(); // Set focus to the editable field
  
	  document.querySelector('${tweetId}.hiddenButton').classList.remove('hiddenButton');
	}

function openPopup() {
  var popup = document.getElementById("editPopup");
  localStorage.setItem("showPopup",true);
  popup.style.display = "block";
}

function closePopup() {
  var popup = document.getElementById("editPopup");
  localStorage.setItem("showPopup",false);
  popup.style.display = "none";
}

//Check if the "addComment" div should be visible on page load
window.addEventListener("load", function() {
    var popup = document.getElementById("editPopup");
    if (${user.error[0]} || ${user.error[11]}) {
    	popup.style.display = "block";
    	localStorage.removeItem("showPopup");
    }
});


</script>
<!-- Page Container -->
<div class="w3-container w3-content w3-round-xlarge" style="max-width:100%;margin-top:3%">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3 left-column">
   	  <div class="w3-left-align w3-large">
		  <p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
		  <p><a href="GetNotFollowedTweets" class="w3-button w3-hide-small w3-padding-large w3-hover-white w3-theme-d4" title="Explore"><i class="fa fa-globe w3-margin-right"></i>Explore</a><p>
		  <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
		  <p><a href="GetOwnTimeline" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Profile</a><p>
		  <p><a href="LogoutController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Logout"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a><p>
      </div>
      
    <!-- End Left Column -->
    </div>
   <div class="verticalLine"></div>
    <!-- Middle Column -->
    
    <div class="w3-col m6 w3-theme-d1 ">
	    <div style="display: flex; justify-content: center; align-items: center;">
	   		<a href="MenuController" ><img src="imgs/logoIcon.png" href="index.jsp" alt="Logo" width = 70, height = 70/></a>
	   	</div>
	   	<br>
         <div class="w3-container w3-white w3-round">
	        <img src="imgs/avatar2.png" alt="Foto de perfil" style="width:10%">
	        <button onclick="openPopup()" class="w3-button w3-theme-d8 w3-margin-bottom w3-margin-left-large transparent-button"><i class="fa fa-edit"></i> Edit</button>
	        
	        <div class="profile-name">
	        	<p style="color:black">@${user.user}</p>
	        </div>
	        
	        <div class="profile-handle">
			    <p style="color:black">${user.firstName}&nbsp;${user.lastName}</p>	        	
	        </div>
	        <div class="w3-row m12">
	            <div class="w3-col m4">
	                <a href="GetFollowedUsers?user=${user.user}">Seguidores</a> <!-- PONER BONITO ESTE TEXTO, COPIAR A TWITTER -->
	            </div>
	            <div class="w3-col m4">
	                <a href="ShowFollowing?user=${user.user}">Siguiendo</a>
				</div>
	            <div class="w3-col m4">	           
	                Tweets
	            </div>
	            
	         </div>
	        <div class="w3-row m12">	         
		         <div class="w3-col m4">
		            ${followers}<!-- SEGUIDOREs -->
		         </div>
		         <div class="w3-col m4">
		            ${following} <!-- SIGUIENDO -->
				 </div>
		         <div class="w3-col m4">	           
		            ${n_tweets} <!-- TWEETS -->
		         </div>
	         </div>
	     </div>
	  <div class="separator">TWEETS</div>
	  <!-- ESTRUCTURA DE UN TWEET -->
	  <c:forEach var="t" items="${tweets}">
	      <div id="${t.id}" class="w3-container w3-card w3-white w3-round w3-margin"><br>
	        <img src="imgs/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	        <span class="w3-right w3-opacity">"${t.created_at}</span>
	        <h4>${t.uname}</h4><br>
	        <hr class="w3-clear">
	        <form id="editTweet" Action="EditTweet?tID=${t.id}" method="POST">
	        	<input type="text"id="content" name="content" value= "${t.content}" class="editable w3-margin-bottom" style="width:80%;border:none" readonly></input>
	        	<button class="hiddenButton w3-button w3-round w3-theme-d2 w3-margin-bottom" ><i class="fa fa-save"></i></button>	        	
	        </form>
	        <div class="buttons">
		        <i>${t.likes}</i>
		        <a class="w3-button w3-theme-d1 w3-margin-bottom" href=EditLike><i class="fa fa-thumbs-up"></i> &nbsp;Like</a>
		       	<i>${t.comments}</i> 
		        <button type = "button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Comment</button>
		        <form id="delete" Action="DelTweet?tID=${t.id}" method="POST">
		        	<button type = "button" Onclick="Delete()" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
		        </form>
		        <button type="button" Onclick="editTweet('${t.id}')" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
	        </div>
		  </div>
	  </c:forEach>
      <!--  FIN ESTRUCTURA TWEET -->
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2 left-column">
	    <c:forEach var="u" items="${users}">       
			<div class="w3-container w3-card w3-round w3-white w3-center w3-section">
				<p>Friend Suggestion</p>
			    <img src="imgs/avatar6.png" alt="Avatar" style="width:25%"><br>
			    <div>
			    	<p style="color:black">user: ${u.user}</p>
			    </div>
			    <form id="followUser" action="FollowUser?user=${u.user}" method="POST">
					      <button type="submit" class="w3-button"><i class="fa fa-user-plus"></i></button>
				</form>
			</div>
		</c:forEach>
	</div>
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->

<!-- Popup Register Form -->
<div id="editPopup" class="w3-modal">
  <div class="w3-modal-content w3-card-5 w3-animate-top form-theme">
    <header class="w3-container w3-theme-d1">
      <span onclick="closePopup()" class="w3-button w3-display-topright">&times;</span>
      <h2>Edit Info</h2>
    </header>
    <div class="w3-container">
      <form id="editForm" action="editUserInfo" method="POST">
        <div class="form-container">
          <div class="column">
            <div class="form-row">
              <label for="user">Username:</label>
              <input type="text" id="user" name="user" value="${user.user}" title="Minimum 4 characters, Maximum 20 characters, Not using bad words" pattern = "^(?!.*(badword1|badword2|badword3))[a-zA-Z0-9_]{4,20}$" required>
              <ul>
					<c:if test = "${user.error[0]}">
						<p id="error" style = "color:white">Entered username has been already registered.</p>
					</c:if>
			  </ul> 
            </div>

            <div class="form-row">
              <label for="firstName">First Name:</label>
              <input type="text" id="firstName" name="firstName" value="${user.firstName}" required pattern="[a-zA-Z]+"> 
            </div>

            <div class="form-row">
              <label for="lastName">Last Name:</label>
              <input type="text" id="lastName" name="lastName" value="${user.lastName}" required pattern="[a-zA-Z]+">
            </div>
          </div>

          <div class="column">
            <div class="form-row">
              <label for="mail">Email:</label>
              <input type="email" id="mail" name="mail" value="${user.mail}" required pattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
            </div>

            <div class="form-row">
              <label for="phoneNumber">Phone Number:</label>
              <input type="tel" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" title = "+[country code] [phone number]" pattern = "\+\d{1,3}[-.\s]\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,4}">
            </div>

            <div class="form-row">
              <label for="state">State:</label>
              <select id="state" name="state">
                <option value="${user.state}" disabled selected>Select your country</option>
			  	<option value="Spain">Spain</option>
				<option value="United States">United States</option>
				<option value="Uganda">Uganda</option>
				<option value="Norway">Norway</option>
				<option value="Japan">Japan</option>
                <!-- Add more options for other states -->
              </select>
              <a class = "redirects" href= 'ChangePasswordController' > Do you want to change password? </a>
            </div>
          </div>
        </div>

        <div class="form-row">
          <label class = "tahoma" for="securityAnswer"> Answer to the security question: ${user.securityQuestion} </label><br>
          <input type="text" id="securityAnswer" name="securityAnswer" placeholder="security answer" required>
	       	<c:if test = "${user.error[11]}">
				<p class = "error" style = "color:white"> Incorrect answer! </p>
			</c:if>				
        </div>
		
        <button type="submit">Submit</button>
      </form>
    </div>
  </div>
</div>


<br>

 
<script>

// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

const error = document.getElementById('error');

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

const form = document.getElementById("myform");
const user = document.getElementById("user");
const firstName = document.getElementById("firstName");
const lastName = document.getElementById("lastName");
const email = document.getElementById("mail");
const phone = document.getElementById("phoneNumber");
const state = document.getElementById("state");
const securityAnswer = document.getElementById("securityAnswer");

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
    phoneNumber.addEventListener('invalid', function() {
        if (phoneNumber.validity.patternMismatch) {
          phoneNumber.value = "";
        }
      });
  });

var allowSecAnswer = function() {
	const selectedValue = this.value;
	  
	if (selectedValue !== "") {
		securityAnswer.disabled = false;
	} else {
		securityAnswer.disabled = true;
	}
}

</script>

</body>
</html> 
