<%@include file="Header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>CherryU|Category</title>
</head>

<body>
<h3 align="center"><b>Category Page</b></h3>
<div class="container">
<form:form action="addCategory" modelAttribute="category" methos="post">

<table class="table table-light">
<tr>
<th>Category ID</th>
<td><form:input path="categoryId"/></td>
</tr>
<tr>
<th>Category Name</th>
<td><form:input path="categoryName"/></td>
</tr>
<tr>
<th>Category Desc</th>
<td><form:input path="categoryDesc"/></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Add Category"></td>
</tr>
</table>
</form:form>
<br>

<table align="center" class="table table-dark table-hover">
<tr>
	<th>Category Id</th>
	<th>Category Name</th>
	<th>Category Description</th>
	<th>Operations</th>
</tr>
<c:forEach items="${Categorieslist}" var="category">
<tr>
	<td>${category.categoryId}</td>
	<td>${category.categoryName}</td>
	<td>${category.categoryDesc}</td>
	<td>
	<a href="<c:url value="/editCategory/${category.categoryId}"/>"><button>Edit</button></a>
	<a href="<c:url value="/deleteCategory/${category.categoryId}"/>"><button>Delete</button></a>
	</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>