<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Detail</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
body {margin :10px; padding:10px;}
</style>
</head>
<body>


<h1>Project Details</h1>
<P><a href="/dashboard">Dashboard</a></p>
<table class="table">
    <tbody>
    	<tr>
    		<td>Project: </td>
            <td><c:out value="${project.title}"></c:out></td>
        </tr>
        
        <tr>
        	<td>Team Lead:</td>
            <td><c:out value="${project.leader.firstName}"></c:out></td>
        </tr>
        <tr>
        	<td>Description:</td>
            <td><c:out value="${project.description}"></c:out></td>
        </tr>
        
        <tr>
       		 <td>Due Date: </td>
            <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
        </tr>
    </tbody>
</table>
<c:if test = "${project.leader.id==userId}">
   <form action="/projects/delete/${project.id}" method="post">
<input type="hidden" name="_method" value="delete"/>
<button type="submit" class="btn btn-danger" style="margin-top:10px;">Delete</button>
</form>
</c:if>
</body>
</html>