<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>CherryU|Update Category</title>
</head>
<body bgcolor="#FFDAB9">
<br><br><br>
<h3 align="center">Update Category Page</h3>
<form  action="<c:url value="/updateCategory"/>" method="post">
<div class="container">
<table class="table table-light" align="center">
<tr>
<td>Category ID</td>
<td><input type="text" id="categoryId" name="categoryId" value="${category.categoryId}"></td>
</tr>
<tr>
<td>Category Name</td>
<td><input type="text" id="categoryName" name="categoryName" value="${category.categoryName}"></td>
</tr>
<tr>
<td>Category Desc</td>
<td><input type="text" id="categoryDesc" name="categoryDesc" value="${category.categoryDesc}"></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Update Category"></td>
</tr>

</table>
</div>
</form>

</body>
</html>
<%@include file="Footer.jsp" %>