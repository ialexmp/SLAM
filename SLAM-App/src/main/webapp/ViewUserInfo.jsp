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


.left-column{
	position: sticky;
	overflow-y: scroll;
	top: 3%;
}
</style>


<body class="w3-theme-d1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function Delete() {
    document.getElementById("delete").submit();
}
function submitUnfollow() {
    document.getElementById("Unfollow").submit();
}
function submitFollow() {
    document.getElementById("followUser").submit();
}

function submitEdit_likes() {
    document.getElementById("EditLikes").submit();
}

function submitShow_comments() {
    localStorage.setItem("addCommentVisible", true);
    document.getElementById("show_comments").submit();
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
	 	<c:if test="${isAdmin}">
		  <p><a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a></p>
		  <p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
		  <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
		  <p><a href="LogoutController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Logout</a><p>
		</c:if>
		<c:if test="${!isAdmin}">
  			  <p><a href="MenuController" class="w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a></p>
	      <p><a href="GetNotFollowedTweets" class="w3-button w3-hide-small w3-padding-large w3-hover-white w3-theme-d4" title="Explore"><i class="fa fa-globe w3-margin-right"></i>Explore</a><p>
	      <p><a href="GetUsers" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Search User"><i class="fa fa-search w3-margin-right"></i>Search User</a><p>
	      <p><a href="GetOwnTimeline" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Profile"><i class="fa fa-user w3-margin-right"></i>Profile</a><p>
	      <p><a href="LogoutController" class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Logout"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a><p>
	    </c:if>
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
	    <div style="display: flex; justify-content: center; align-items: center;">
	   		<a href="MenuController" ><img src="imgs/logoIcon.png" href="index.jsp" alt="Logo" width = 70, height = 70/></a>
	   	</div>
	   	<br>
         <div class="w3-container w3-white w3-round">
	        <img src="imgs/avatar2.png" alt="Foto de perfil" style="width:10%">

	        <div class="profile-name">
	        	<p style="color:black">@${user.user}</p>
	        </div>
	        
	        <div class="profile-handle">
			    <p style="color:black">${user.firstName}&nbsp;${user.lastName}</p>	        	
	        </div>
	        <div class="w3-row m12">
	            <div class="w3-col m3">
	                <a href="GetFollowedUsers?user=${user.user}">Followers</a> <!-- PONER BONITO ESTE TEXTO, COPIAR A TWITTER -->
	            </div>
	            <div class="w3-col m3">
	                <a href="ShowFollowing?user=${user.user}">Following</a>
				</div>
	            <div class="w3-col m3">	           
	                Tweets
	            </div>
	         </div>
	        <div class="w3-row m12">	         
		         <div class="w3-col m3">
		            ${followers}<!-- SEGUIDOREs -->
		         </div>
		         <div class="w3-col m3">
		            ${following} <!-- SIGUIENDO -->
				 </div>
		         <div class="w3-col m3">	           
		            ${n_tweets} <!-- TWEETS -->
		         </div>
		         <div class="w3-col m3">
		         	<c:if test="${!isAnonymous}">
		         	<c:if test="${!isAdmin}">
		         	<c:set var="isFollowing" value="false" />
		         	<c:forEach var="f" items="${followedUsers}">
				        <c:if  test="${f.user eq sessionUser}">
				            <c:set var="isFollowing" value="true" />
					        <form id="Unfollow" Action="UnFollowUser?user=${user.user}" method="POST">
					        	<button type="button" class="w3-button w3-theme" Onclick="submitUnfollow()"><i class="fa fa-user-times"></i> &nbsp;Unfollow</button>
					        </form>
					    </c:if>    
				    </c:forEach>
				    <c:if test="${not isFollowing}">
					    	<form id="followUser" action="FollowUser?user=${user.user}" method="POST">
							      <button type="submit" class="w3-button w3-theme" Onclick="submitFollow()"><i class="fa fa-user-plus">Follow</i></button>
							</form>
					 </c:if>
					 
				     </c:if>
				     </c:if>
				     <c:if test="${isAdmin}">
							  <form action="DelUser?user=${user.user}" method="POST">
						      <input type="hidden" name="user" value="${user.user}" />
						      <button class="w3-button w3-red w3-margin-bottom" type="submit">
						        <i class="fa fa-trash"></i>&nbsp;Delete
						      </button>
						    </form>
					 </c:if>
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
	        <p>${t.content}</p>
	      	<div class="buttons">
			<c:if test="${isAnonymous}">
	        	<i class="w3-margin-right"><i class="fa fa-thumbs-up"></i> &nbsp;Likes: ${t.likes}</i>
	        </c:if>
	        <c:if test="${!isAnonymous}">	        
	        	<i>${t.likes}</i>
	        	<form id="EditLikes"action="EditLike?likeID=${t.id}" method="POST">
		        	<button type="button" onclick="submitEdit_likes()"class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button>
		        </form>
			</c:if>		    
		       	<i>${t.comments}</i> 
		       	<form id="show_comments" action="MenuController?tID=${t.id}" method="POST">
		        	<button type="button" onclick="submitShow_comments()"class="w3-button w3-theme-d2 w3-margin-bottom comment"><i class="fa fa-comment"></i> &nbsp;Comments</button>
		        </form>
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
