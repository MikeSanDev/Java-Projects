<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>One Dojo</title>
</head>
<body>
	<div>
			<h1><c:out value="${dojo.name}"/>  Ninjas</h1>
			
			<table>
				<thead>
				<tr>
			    	<th>First Name</th>
			      	<th>Last Name</th>
			      	<th>Age</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="eachNinja" items="${dojo.ninjas}">
						<tr>
					<td><c:out value="${eachNinja.firstName}"/></td>
				    <td><c:out value="${eachNinja.lastName}"/></td>
				    <td><c:out value="${eachNinja.age}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</body>
</html>