<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>
<h3 align="center">Category Page</h3>
<form  action="<c:url value="/addCategory"/>" method="post">
<table align="center">
<tr>
<td>Category ID</td>
<td><input type="text" name="categoryId"></td>
</tr>
<tr>
<td>Category Name</td>
<td><input type="text" name="categoryName"></td>
</tr>
<tr>
<td>Category Desc</td>
<td><input type="text" name="categoryDesc"></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Add Category"></td>
</tr>
</table>
</form>
<br><br><br>
<table align="center">
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
</body>
</html>