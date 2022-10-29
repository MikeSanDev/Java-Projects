<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Detail</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
body {margin :10px; padding:10px;}
</style>
</head>
<body>
<h1> ${book.title }</h1>

<div>
	<h3>${book.owner.userName} read ${book.title } by ${book.author } </h3>
	<p>Here are ${book.owner.userName}'s thoughts:</p>
	
	<div>
		<p><em>${book.thoughts}</em></p>
	</div>


	<div style="display:flex;">
<a href="/books/edit/${book.id }" class="btn btn-success">Edit</a>
<form action="/books/delete/${book.id}" method="post">
<input type="hidden" name="_method" value="delete"/>
<button type="submit" class="btn btn-danger" style="margin-left:10px;">Delete</button>
</form>
<a href="/dashboard" class="btn btn-primary" style="margin-left:10px;">Home</a> <br/>
	</div>
</div>
</body>
</html>