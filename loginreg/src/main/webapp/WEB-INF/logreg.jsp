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
</head>
<body>
	<div>
		<h1>Register </h1>
		<form:form action="/register" method="post" modelAttribute="newUser">
			<div>
				<form:label path="userName">User Name:</form:label>
				<form:input path="userName"/>
				<form:errors path="userName" style="color:red"></form:errors>
			</div>
						<div>
				<form:label path="email">Email:</form:label>
				<form:input path="email"/>
				<form:errors path="email" style="color:red"></form:errors>
			</div>
						<div>
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password"/>
				<form:errors path="password" style="color:red"></form:errors>
			</div>
						<div>
				<form:label path="confirm">Confirm Password:</form:label>
				<form:input path="confirm" type="password"/>
				<form:errors path="confirm" style="color:red"></form:errors>
			</div>
			<button type="submit">Register</button>
		</form:form>
		
		<h1>Login</h1>
			<form:form action="/login" method="post" modelAttribute="newLogin">
									<div>
				<form:label path="email">Email:</form:label>
				<form:input path="email"/>
				<form:errors path="email" style="color:red"></form:errors>
			</div>
						<div>
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password"/>
				<form:errors path="password" style="color:red"></form:errors>
			</div>
			
						<button type="submit">Login</button>
			</form:form>
		
	</div>
</body> 
</html>