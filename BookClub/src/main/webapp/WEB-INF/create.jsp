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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
body {margin :10px; padding:10px; align-items:center;}
</style>
</head>
<body>
	<h1>Add a Book to Your Shelf!</h1>
	<a href="/dashboard">back to the shelves</a>
	
<div >
 <form:form action="/books/new" method="post" modelAttribute="newBook" class="col-4 p-4 bg-success text-light" style="height:55vh;">

	<div class="form-group" style="margin-top:10px;">
		<form:label path="title">Title: </form:label><br/>
		<form:errors path="title" style="color:red;" />
		<form:input path="title" class="form-control"/>
	</div>
		<div class="form-group" style="margin-top:20px;">
		<form:label path="author">Author: </form:label><br />
		<form:errors path="author" style="color:red;" />
		<form:input path="author" class="form-control"/>
	</div>
	
	<div class="form-group" style="margin-top:20px;">
		<form:label path="thoughts">My Thoughts: </form:label><br />
		<form:errors path="thoughts" style="color:red;" />
		<form:input type="thoughts" path="thoughts" class="form-control"/>
	</div>
	
	<div class="form-group" style="margin-top:20px;">
		<form:hidden path="owner" value="${userId }"/>
		<button type="submit" class="btn btn-warning">Add</button>
	</div>
</form:form>  

</div>
</body>
</html>