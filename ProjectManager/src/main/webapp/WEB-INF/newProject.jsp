<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Project</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
body {margin :10px; padding:10px; align-items:center;}
</style>
</head>

<body>
<h1>Create a Project!</h1>
	<a href="/dashboard">back to the shelves</a>
	
<div >
 <form:form action="/projects/new" method="post" modelAttribute="newProject" class="col-4 p-4 bg-success text-light" style="height:65vh;">

	<div class="form-group" style="margin-top:10px;">
		<form:label path="title">Title: </form:label><br/>
		<form:errors path="title" style="color:red;" />
		<form:input path="title" class="form-control"/>
	</div>
		<div class="form-group" style="margin-top:20px;">
		<form:label path="description">Description: </form:label><br />
		<form:errors path="description" style="color:red;" />
		<form:textarea path="description" class="form-control"></form:textarea>
	</div>
	
	<div class="form-group" style="margin-top:20px;">
		<form:label path="dueDate">Due Date: </form:label><br />
		<form:errors path="dueDate" style="color:red;" />
		<form:input type="date" path="dueDate" class="form-control"/>
	</div>
	
	<div class="form-group" style="margin-top:20px;">
		<form:hidden path="leader" value="${userId }"/>
		<button type="submit" class="btn btn-warning">Add</button>
	</div>
</form:form>  

</div>
</body>
</html>