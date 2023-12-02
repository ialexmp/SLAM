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

.left-column{
	position: sticky;
	overflow-y: scroll;
	top: 3%;
}
</style>


<body class="w3-theme-d1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function submitForm() {
    document.getElementById("form").submit();
}
</script>
<!-- Page Container -->
<div class="w3-container w3-content w3-round-xlarge" style="max-width:100%;margin-top:3%">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3 left-column">
   	  <div class="w3-left-align w3-large">
		  <c:if test = "${!isAnonymous}">
	 	<p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
	    <p><a href="GetNotFollowedTweets" class="w3-button w3-hide-small w3-padding-large w3-hover-white w3-theme-d4" title="Explore"><i class="fa fa-globe w3-margin-right"></i>Explore</a><p>
	    <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
	    <p><a href="GetOwnTimeline" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Profile</a><p>
	    <p><a href="LogoutController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Logout"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a><p>
	  </c:if> 
 	  <c:if test="${isAnonymous}">
	    <p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
	    <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
	    <p><a href="ViewLoginForm.jsp" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Login</a><p>
	    <p><a href="ViewRegisterForm.jsp" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Logout"><i class="fa fa-sign-out w3-margin-right"></i>Register</a><p>
	  </c:if>
      </div>
      
    <!-- End Left Column -->
    </div>
   <div class="verticalLine"></div>
    <!-- Middle Column -->
    <div class="w3-col m6 w3-theme-d1 ">
       <!-- Logo -->
   	  <div style="display: flex; justify-content: center; align-items: center;">
   	  	<a href="MenuController" ><img src="imgs/logoIcon.png" alt="Logo" width = 70, height = 70/></a>
   	  </div>
   	  <br>
	 
	 <div class="separator">USERS ${user} IS FOLLOWING</div>
	  <!-- ESTRUCTURA DE UN TWEET -->
		<c:forEach var="u" items="${users}">       
			<div id="${u.user}" class="w3-container w3-card w3-round w3-white w3-center w3-section">
    			<img src="imgs/avatar6.png" alt="Avatar" style="width:10%"><br>
    			<div>
    				<a href="GetUserInfo?usr=${u.user}">${u.user}</a><br>
    				<i>${u.firstName} ${u.lastName}</i>
    				<c:forEach var="f" items="${followingUsers}">
					  <c:if test="${u.user ne f.user}">
					   <c:if test="${u.user ne sessionUser}">
					  	<c:if test="${!isAnonymous}">
						    <form id="followUser" action="FollowUser?user=${f.user}" method="POST">
						      <button type="submit" class="w3-button"><i class="fa fa-user-plus"></i></button>
						    </form>
					    </c:if>
					   </c:if>
					  </c:if>
					</c:forEach>
    			</div>
			</div>
		</c:forEach>
      <!--  FIN ESTRUCTURA TWEET -->
    <!-- End Middle Column -->
    </div>
    

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->

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


var coll = document.getElementsByClassName("comment");
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


// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>
</body>
</html> 
