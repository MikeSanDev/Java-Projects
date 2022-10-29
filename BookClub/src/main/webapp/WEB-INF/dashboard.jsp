<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<title>Full Spring Dashboard</title>
<style>
body {margin :10px; padding:10px;}
</style>
</head>
<body>
<div>		<h1>Welcome, ${userName}</h1>
		<p>Books from everyone's shelves</p></div>
		<div>
		<a href="/logout" class="btn btn-secondary">Logout </a>
		<span>|</span>
		<a href="/books/new" class="btn btn-primary">Add to my book shelf!</a>
		</div>
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachBook" items="${bookList }">
					<tr>
						<td>${eachBook.id}</td>
						<td>
						<a href="/books/${eachBook.id }">
						<c:out value="${eachBook.title}"/></a></td>
						<td>${eachBook.author}</td>
						<td><c:out value="${eachBook.owner.userName}"/></td>
						 <c:choose>
						 	<c:when test="${userId.equals(eachBook.owner.id)}">
						<td>
						<a href="/books/edit/${eachBook.id }" class="btn btn-success">Edit
						</a></td>
						<td>
							<form action="books/delete/${eachBook.id}" method="post">
							<input type="hidden" name="_method" value="delete"/>
							<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						 	</c:when>
						 	<c:otherwise>
						 	<td></td>
						 	<td></td>
						 	</c:otherwise>
						 </c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table> 
</body>
</html>