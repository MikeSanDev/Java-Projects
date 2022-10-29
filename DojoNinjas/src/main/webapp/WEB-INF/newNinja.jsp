<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Ninja</title>
</head>
	<body>
	<div>
	<h1>New Ninjas</h1>
		<form:form action="/ninjas/new" method="post" modelAttribute="newNinja">
			<h2>
				<form:label path="dojo">Dojo:</form:label>
				<form:select path="dojo">
					<c:forEach items="${dojoList}" var="eachDojo">
						<form:option value="${eachDojo.id }"> ${eachDojo.name} 	
						</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="dojo" style="color:red"/>
			</h2>
							    <h2>
			        <form:label path="firstName">First Name:</form:label>
			        <form:input path="firstName"/>
			        <form:errors path="firstName" style="color:red"/>
			    </h2>
   			    <h2>
			        <form:label path="lastName">Last Name:</form:label>
			        <form:input path="lastName"/>
			        <form:errors path="lastName" style="color:red"/>
			    </h2>
   			    <h2>
			        <form:label path="age">Age:</form:label>
			        <form:input path="age"/>
			        <form:errors path="age" style="color:red"/>
			    </h2>
			    <input type="submit" value="Create"/>
		</form:form>
	</div>
</body>
</html>