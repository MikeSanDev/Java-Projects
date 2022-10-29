<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saving Travels</title>

</head>
<body>
<h1> Save Travels</h1>

<table >
	<thead> 
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody >
<c:forEach var="expense" items="${expenses}"> 
			<tr>
				<td ><a href="/expenses/display/${expense.id}"><c:out value="${expense.name}"></c:out></a></td>
				<td><c:out value="${expense.vendor}"></c:out></td>
				<td>$<c:out value="${expense.amount}"></c:out></td>
				<td><a href="/expenses/edit/${expense.id }">Edit</a></td>
				<td><form action="/expenses/delete/${expense.id}" method="post">
    				<input type="hidden" name="_method" value="delete">
    				<input type="submit" value="Delete"></form></td>
			</tr>
</c:forEach> 
	</tbody> 
</table>
<br/>

<div>
	<h1>Add An Expense:</h1>
<form:form action="/expenses" method="post" modelAttribute="expense">
		<div>
			<form:label path="name">Expense Name: </form:label><br/>
			<form:errors path="name" style="color:red;"/>
			<form:input style="width:250px;" path="name"/>
		</div>
		<div>
			<form:label path="vendor">Vendor: </form:label><br/>
			<form:errors path="vendor" style="color:red;"/>
			<form:input style="width:250px;" path="vendor"/>
		</div>
		<div>
			<form:label path="amount">Amount: </form:label><br/>
			<form:errors path="amount" style="color:red;"/>
			<form:input style="width:250px;" path="amount"/>
		</div>
		<div>
			<form:label path="description">description: </form:label><br/>
			<form:errors path="description" style="color:red;"/>
			<form:input style="width:250px;" path="description"/>
		</div>
		
	<div>
		<input type="submit" value="Submit"/>
	</div>
		
	</form:form>
</div>
</body>
</html>