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
<h1>Edit An Expense:</h1>
	<a href="/">Go Back</a>
<div>
	
<form:form action="/expenses/edit/${editExpense.id}" method="post" modelAttribute="editExpense">
<input type="hidden" name="_method" value="put"> 
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
			<form:label path="description">Description: </form:label><br/>
			<form:errors path="description" style="color:red;"/>
			<form:input style="width:250px;" path="description"/>
		</div>
		
	<div>
		<input type="submit" value="Edit"/>
	</div>
		
	</form:form>
</div>
</body>
</html>