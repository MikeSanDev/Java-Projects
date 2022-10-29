<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Fruit Store</title>
</head>
<body>

<h1>Fruit Store</h1>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>

     <c:forEach var="fruitLoop" items="${items}">
         <tr >
      <td>${fruitLoop.name}</td>
      <td>${fruitLoop.price}</td>
         </tr>
      </c:forEach>

  </tbody>
</table>

</body>
</html>