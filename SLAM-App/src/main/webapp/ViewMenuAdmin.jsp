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

.buttons > *{
    display: inline-block;
    margin-right:10px;
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

.buttons > *{
    display: inline-block;
    margin-right:10px;
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
function submitForm2() {
    document.getElementById("form2").submit();
}
function submitEdit_likes() {
    document.getElementById("EditLikes").submit();
}
function submitShow_comments() {
    localStorage.setItem("addCommentVisible", true);
    document.getElementById("show_comments").submit();
}

function hide_comments(){
	 var comments = document.getElementsByClassName("comments");
	    for (var i = 0; i < comments.length; i++) {
	        comments[i].setAttribute("hidden", true);
	    }}
	    
</script>
<!-- Page Container -->
<div class="w3-container w3-content w3-round-xlarge" style="max-width:100%;margin-top:3%">    
  <!-- The Grid -->
  <div class="w3-row">
    
   	<!-- Left Column -->
    <div class="w3-col m3 left-column">
   	  <div class="w3-left-align w3-large">
		  <p><a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a></p>
		  <p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
		  <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
		  <p><a href="LogoutController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Logout</a><p>
      </div>
    </div>
     <!-- End Left Column -->
     
   <div class="verticalLine"></div>
    
    <!-- Right Column -->
    <div class="w3-col m6 w3-theme-d1 ">
       <!-- Logo -->
   	  <div style="display: flex; justify-content: center; align-items: center;">
   	  	<a href="MenuController" ><img src="imgs/logoIcon.png"  alt="Logo" width = 70, height = 70/></a>
   	  </div>
   	  <br>
      
	  <div class="separator">WHAT'S GOING ON</div>

	 
	  <!-- ESTRUCTURA DE UN TWEET -->
	  <c:forEach var="t" items="${tweets}">
	      <div id="${t.id}" class="w3-container w3-card w3-white w3-round w3-margin"><br>
	        <img src="imgs/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	        <span class="w3-right w3-opacity">"${t.created_at}</span>
    		<a class="w3-large" href="GetUserInfo?usr=${t.uname}">${t.uname}</a><br>
	        <hr class="w3-clear">
	        <p>${t.content}</p>
	        <div class="buttons">
		        <i>${t.likes}</i>
	        	<form id="EditLikes"action="EditLike?likeID=${t.id}" method="POST">
		        	<button type="button" onclick="submitEdit_likes()"class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button>
		        </form>
		        <i>${t.comments}</i> 
		       	<form id="show_comments" action="MenuController?tID=${t.id}" method="POST">
		        	<button type="button" onclick="submitShow_comments()"class="w3-button w3-theme-d2 w3-margin-bottom comment"><i class="fa fa-comment"></i> &nbsp;Comments</button>
		        </form>
		        <!-- Delete button -->
			    <form action="DelTweet?tID=${t.id}" method="POST">
			      <input type="hidden" name="tID" value="${t.id}" />
			      <button class="w3-button w3-red w3-margin-bottom" type="submit">
			        <i class="fa fa-trash"></i>&nbsp;Delete
			      </button>
			    </form>
	        </div>
		        <c:forEach var="c" items="${comments}">
		        	<div id = "comments_list" class="w3-card w3-round w3-gray w3-theme-14 comments">
		        		<img src="imgs/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
				        <span class="w3-right w3-opacity">"${c.created_at}</span>
				        <h4>${c.uname}</h4><br>
				        <hr class="w3-clear">
				        <p>${c.content}</p>
			        	<i>${c.likes}</i>
			        	<div class="buttons">
				        	<form id="EditLikes"action="EditLike?likeID=${c.id}" method="POST">
					        	<button type="button" onclick="submitEdit_likes()"class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button>
					        </form>
					        <form action="DelTweet?tID=${c.id}" method="POST">
						      <input type="hidden" name="cID" value="${c.id}" />
						      <button class="w3-button w3-red w3-margin-bottom" type="submit">
						        <i class="fa fa-trash"></i>&nbsp;Delete
						      </button>
						    </form>
					    </div>
				        <button class="hide" onclick="hide_comments()"><i class="fa fa-eye-slash" ></i>&nbsp;Hide</button>
		        	</div>
	            </c:forEach>
		        
	        </div>
	        
	  </c:forEach>
      <!--  FIN ESTRUCTURA TWEET -->
   
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
