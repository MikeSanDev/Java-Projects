<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
body {margin :10px; padding:10px;}
</style>
</head>
<body>

<div>

<h1>Welcome, ${firstName} ${lastName}</h1>
<p><a href="/logout">Log Out</a></p>

<h1>All Projects</h1>
<p><a href="/projects/new">New Project</a></p>
</div>
<table class="table">
    <thead> 
    	<tr>
    		<th>Project</th>
    		<th>Team Lead</th>
    		<th>Due Date</th>

    	</tr>
    </thead>
    <tbody>
    	<c:forEach var="eachProject" items="${projectList}">
		<tr>
			
			<td>
				<a href="/projects/${eachProject.id}">${eachProject.title}</a>
			</td>
			<td>
				<c:out value="${eachProject.leader.firstName}"></c:out>
			</td>
			<td>
				<fmt:formatDate value="${eachProject.dueDate}" pattern="MMMM dd"/>
			</td>

		</tr>	
		</c:forEach>
    </tbody>
</table >
<h1>My Projects</h1>
<table class="table">
    <thead> 
    	<tr>
    		<th>Project</th>
    		<th>Team Lead</th>
    		<th>Due Date</th>
    		<th>Actions</th>
    	</tr>
    </thead>
    <tbody>
    	<c:forEach var="eachProject" items="${projectList}">
    	<c:if test="${eachProject.leader.id.equals(userId) }">
		<tr>
			
			<td>
				<a href="/projects/${eachProject.id}">${eachProject.title}</a>
			</td>
			<td>
				<c:out value="${eachProject.leader.firstName}"></c:out>
			</td>
			<td>
				<fmt:formatDate value="${eachProject.dueDate}" pattern="MMMM dd"/>
			</td>
		    <td>
		    	<a href="/projects/edit/${eachProject.id}">Edit</a>
		    </td>
<%-- 		   <td>
		   		<form action="/projects/delete/${eachProject.id}" method="post">
				<input type="hidden" name="_method" value="delete"/>
				<button type="submit" class="btn btn-danger" style="margin-top:10px;">Delete</button>
				</form>
			</td> --%>
		</tr>	
		</c:if>
		</c:forEach>
    </tbody>
</table>
</body>
</html>