<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="w3-bar w3-red">
	<a class="w3-bar-item w3-button" id="LogoutController" href="MenuController"> <i class="fa fa-home" aria-hidden="true"></i> </a>
	<a class="menu w3-bar-item w3-button w3-hide-small" id="LogoutController" href=LogoutController> Logout </a>
	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
</div>

Login for user ${sessionScope.user} done!
</body>
</html>