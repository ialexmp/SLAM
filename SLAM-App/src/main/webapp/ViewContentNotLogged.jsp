<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<title>SLAM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
  font-family: "Open Sans", sans-serif;
}

footer {
  left: 0;
  bottom: 3%;
  width: 100%;
  height: 10%;
  color: white;
  text-align: center;
}

.w3-round {
  border-radius: 20px; /* Adjust the value to increase or decrease the roundness */
}

.w3-col.m3 {
  height: 100%;
  width: 22%;
  padding-right: 5%; /* Add space to the right of the left column */
}

.w3-col.m7 {
  padding-left: 5%; /* Add space to the left of the right column */
  margin-left: 25%;
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
  margin-left: 20%;
  top: 0;
}
.w3-left-align{
	margin-left: 20%;
}
p{
	font-size:120%
}
.fixed_column{
	position: fixed;
}
</style>


<body class="w3-theme-d1">

 
<!-- Page Container -->
<div class="w3-container w3-content w3-round-xlarge" style="max-width:80%;margin-top:3%">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m4 fixed_column">
   	  <div class="w3-left-align w3-large">
		  <p><a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a></p>
		  <p><a href="#" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
		  <p><a href="#" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
		  <p><a href="LoginController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Login"><i class="fa fa-sign-in w3-margin-right"></i>Login</a><p>
		  <p><a href="RegisterController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Register"><i class="fa fa-sign-in w3-margin-right"></i>Register</a><p>
      </div>
      
    <!-- End Left Column -->
    </div>
   <div class="verticalLine"></div>
    <!-- Middle Column -->
    <div class="w3-col m7 w3-theme-d1 ">
       <!-- Logo -->
   	  <div style="display: flex; justify-content: center; align-items: center;">
   	  	<a href="MenuController" ><img src="imgs/logoIcon.png" href="index.jsp" alt="Logo" width = 70, height = 70/></a>
   	  </div>
   	  <br>
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white w3-theme-l4">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Publish a New Tweet</h6>
              <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
              <a class="w3-button w3-theme" href = "AddTweet"><i class="fa fa-pencil"></i> &nbsp;Post</a> 
            </div>
          </div>
        </div>
      </div> 
	  <div class="separator">WHAT'S GOING ON</div>
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="imgs/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>John Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="imgs/lights.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            </div>
            <div class="w3-half">
              <img src="imgs/nature.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
          </div>
        </div>
        <a class="w3-button w3-theme-d1 w3-margin-bottom" href=EditLike><i class="fa fa-thumbs-up"></i> &nbsp;Like</a> 
        <button type = "button" class="w3-button w3-theme-d2 w3-margin-bottom comment"><i class="fa fa-comment"></i> &nbsp;Comment</button>
		<div class="w3-card w3-round w3-white w3-theme-l4" hidden>
			<div class="w3-container w3-padding">
              <p contenteditable="true" class="w3-border w3-padding">Answer to the tweet</p>
              <a class="w3-button w3-theme" href = "AddTweet"><i class="fa fa-comment"></i> &nbsp;Comment</a> 
            </div>			
		</div>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="imgs/avatar5.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">16 min</span>
        <h4>Jane Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a class="w3-button w3-theme-d1 w3-margin-bottom" href=EditLike><i class="fa fa-thumbs-up"></i> &nbsp;Like</a> 
        <button type = "button" class="w3-button w3-theme-d2 w3-margin-bottom comment"><i class="fa fa-comment"></i> &nbsp;Comment</button>
        <div class="w3-card w3-round w3-white w3-theme-l4" hidden>
			<div class="w3-container w3-padding">
              <p contenteditable="true" class="w3-border w3-padding">Answer to the tweet</p>
              <a class="w3-button w3-theme" href = "AddTweet"><i class="fa fa-comment"></i> &nbsp;Comment</a> 
            </div>			
		</div>
         
      </div>  

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="imgs/avatar6.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">32 min</span>
        <h4>Angie Jane</h4><br>
        <hr class="w3-clear">
        <p>Have you seen this?</p>
        <img src="imgs/nature.jpg" style="width:100%" class="w3-margin-bottom">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a class="w3-button w3-theme-d1 w3-margin-bottom" href=EditLike><i class="fa fa-thumbs-up"></i> &nbsp;Like</a> 
        <button type = "button" class="w3-button w3-theme-d2 w3-margin-bottom comment"><i class="fa fa-comment"></i> &nbsp;Comment</button>
        <div class="w3-card w3-round w3-white w3-theme-l4" hidden>
			<div class="w3-container w3-padding">
              <p contenteditable="true" class="w3-border w3-padding">Answer to the tweet</p>
              <a class="w3-button w3-theme" href = "AddTweet"><i class="fa fa-comment"></i> &nbsp;Comment</a> 
            </div>			
		</div> 
      </div> 
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <!--  <div class="w3-col m2">-->
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-col m7">
  <i>We are committed to keeping your personal data safe and secure, and will never share or sell it to third parties without your explicit consent.</i>
		<p>&copy; 2023 SLAM. All Rights Reserved.<p>
</footer>

 
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
