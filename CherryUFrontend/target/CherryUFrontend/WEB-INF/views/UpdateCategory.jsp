<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CherryU|Update Category</title>
</head>
<body bgcolor="#FFDAB9">
<br><br><br>
<h3 align="center">Update Category Page</h3>
<form  action="<c:url value="/updateCategory"/>" method="post">
<table align="center">
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
</form>
</body>
</html>