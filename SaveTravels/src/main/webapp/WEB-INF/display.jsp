<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
</head>
<body>
<h1>Expense Details</h1>
	<a href="/">Go Back</a>

<h3>Expense Name:</h3> <c:out value="${expense.name}"></c:out>
<h3>Expense Description:</h3> <c:out value="${expense.description}"></c:out>	
<h3>Vendor:</h3> <c:out value="${expense.vendor}"></c:out>
<h3>Amount Spent:</h3>$<c:out value="${expense.amount}"></c:out>

	
</body>
</html>