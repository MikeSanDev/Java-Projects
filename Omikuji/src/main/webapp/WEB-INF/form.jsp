<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>おみくじ</title>
<style>
body 	{background-color: powderblue;  }
strong 	{color: blue;}
.omi  	{flex-direction: column; 
	   	width:50%; 
	  	margin: 0px auto;
	  	text-align: center;}
input 	{margin-bottom: 20px;}
</style>
</head>
<body>
<div class="omi">
	<h2>おみくじ</h2>
    <h3>Send an Omikuji!</h3>
    <form action='/show' method='POST'>
    <label for="quantity">Pick any number from 5 to 25:</label> 
    <br/>
  		<input type="number" id="quantity" placeholder="5" name="quantity" min="5" max="25">
  		<br/>
	<label>Enter the name of any city:</label>
	<br/>
    	<input type="text" name='city'>
    		<br/>
	<label>Enter the name of any real person:</label>
			<br/>
    	<input type='text' name='person'>
    		<br/>
    		<label>Enter professional endeavor or hobby:</label>
    		<br/>
    	<input type='text' name='hobby'>
    		<br/>
    		<label>Enter any type of living thing:</label>
    		<br/>
    	<input type='text' name='animal'>
    		<br/>
    	<label>Say something nice to someone:</label>
    	<br/>
    	    	<textarea name="message" rows="5" cols="30">You do not realize how happy you make others.
		</textarea>
			<br/>
		
		<p><em>Send and show a friend</em></p>
    	<input type='submit' value='Submit'>

    </form>
    </div>
</body>
</html>