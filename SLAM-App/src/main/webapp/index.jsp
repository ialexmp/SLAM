<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="imgs/me.png">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	$.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!	
	$(document).on("click",".menu", async function(event) {
		//$('#content').load('ContentController',{content: $(this).attr('id')});
		//const response = await fetch($(this).attr('id'));
		//$('#content').html(await response.text());
		$('#content').load($(this).attr('id'));
		event.preventDefault();
	});
	$(document).on("submit","form", function(event) {
		$('#content').load($(this).attr('action'),$(this).serialize());
	    event.preventDefault();
	});
});
</script>
</head>
<body>

 	<!-- Begin Navigation -->
 	<div class="w3-bar " id="navigation">
    <jsp:include page="${menu}" />
 	</div>
 	<!-- End Navigation -->
 	<hr>
	<!-- Begin Content -->
	<div class="w3-container w3-card-4 w3-padding-24" id="content">
	<jsp:include page="${content}" />
	</div>
	<!-- End Content -->
	<hr>
	<script>
		function stack() {
  			var x = document.getElementById("stack");
  			if (x.className.indexOf("w3-show") == -1) {
    			x.className += " w3-show";
  			} else { 
    		x.className = x.className.replace(" w3-show", "");
  			}
		}
	</script>

  </body>
</html>