<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Full Spring Dashboard</title>
</head>
<body>
		<h1>Welcome, ${userName}</h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<a href="/logout">Logout</a>
</body>
</html>