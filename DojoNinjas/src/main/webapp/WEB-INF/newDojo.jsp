<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>Add a New Dojo</h1>
	<form:form action="/dojos/new" method="post" modelAttribute="newDojo">
				    <h2>
			        <form:label path="name">Name:</form:label>
			        <form:errors style="color:red;" path="name"/>
			        <form:input path="name"/>
			    </h2>
			    <input type="submit" value="Create"/>	
	
	</form:form>


</div>
</body>
</html>