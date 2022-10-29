<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>

  <div class="d-flex justify-content-around">

 		<form:form action="/register" method="post" modelAttribute="newUser" class="col-4 p-4 bg-success text-dark" style="height:100%; margin-top:60px;" >
 		<h1>Register </h1>
			<div class="form-group" style="margin-top:20px;">
				<form:label path="userName">User Name:</form:label>
				<form:input path="userName" class="form-control"/>
				<form:errors path="userName" style="color:red"></form:errors>
			</div>
			<div class="form-group" style="margin-top:20px;">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control"/>
				<form:errors path="email" style="color:red"></form:errors>
			</div>
			<div class="form-group" style="margin-top:20px;">
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password" class="form-control"/>
				<form:errors path="password" style="color:red"></form:errors>
			</div>
			<div class="form-group" style="margin-top:20px;">
				<form:label path="confirm">Confirm Password:</form:label>
				<form:input path="confirm" type="password" class="form-control"/>
				<form:errors path="confirm" style="color:red"></form:errors>
			</div>
			<button type="submit" class="btn btn-warning" style="margin-top:20px;">Register</button>
		</form:form> 
		
		
 			<form:form action="/login" method="post" modelAttribute="newLogin" class="col-4 p-4 bg-dark text-light" style="margin-top:60px;">
			<h1>Login</h1>				
			<div class="form-group" style="margin-top:20px;">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control"/>
				<form:errors path="email" style="color:red"></form:errors>
			</div>
			<div class="form-group" style="margin-top:20px;">
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password" class="form-control"/>
				<form:errors path="password" style="color:red"></form:errors>
			</div>
			
						<button type="submit" class="btn btn-success" style="margin-top:20px;">Login</button>
			</form:form>
		
	</div>
</body> 
</html>