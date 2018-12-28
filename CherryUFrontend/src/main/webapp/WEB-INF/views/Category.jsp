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
<style>
body{
background-size:cover;
}
h3{
background-color:black;

}
</style>
</head>

<body background="<c:url value="/resources/images/bg9.jpg"/>">
<br><br><br>
<div class="container">
<h3 align="center" style="color:#fa8072"><b>Category Page</b></h3><br>
<form  action="<c:url value="/addCategory"/>" method="post">
<table class="table table-dark">
<tr>
<td>Category ID</td>
<td><input type="text" id="categoryId" name="categoryId"></td>
</tr>
<tr>
<td>Category Name</td>
<td><input type="text" id="categoryName" name="categoryName"></td>
</tr>
<tr>
<td>Category Desc</td>
<td><input type="text" id="categoryDesc" name="categoryDesc"></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Add Category"></td>
</tr>
</table>
</form>
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
<br>
<br><br>
</body>
</html>
<%@include file="Footer.jsp" %>