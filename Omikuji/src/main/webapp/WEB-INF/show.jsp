<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>おみくじ</title>
<style>
body 	{background-color: powderblue;  }
strong 	{color: blue;}
.omi  	{flex-direction: column; 
	   	width:50%; 
	  	margin: 0 auto;
	  	text-align: center;}
</style>
</head>
<body>
	<div class="omi">
	<h1>おみくじ!</h1>
	<p> In <strong><c:out value="${quantity}"/></strong> years, you will live in
	<strong><c:out value="${city}"/></strong> with 
	<strong><c:out value="${person}"/></strong> as your roommate, 
	<strong><c:out value="${hobby}"/></strong> for a living. The next time you see a
	<strong><c:out value="${animal}"/></strong>, you will have good luck. Also,
	<strong><c:out value="${message}"/></strong>
	</p>
	<a href="/">Go back</a>
	</div>
</body>
</html>