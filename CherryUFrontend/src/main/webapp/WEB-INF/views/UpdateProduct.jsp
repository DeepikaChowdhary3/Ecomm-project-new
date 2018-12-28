<%@include file="Header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>CherryU|Update Product</title>
</head>
<body bgcolor="#FFDAB9">
<br><br><br>
<h3 align="center">Update Product Page</h3>
<br>
<form:form action="updateProduct" modelAttribute="product" method="post" >
<table align="center">

<tr>
<th>Product Name</th>
<td><form:input path="productName"/></td>
</tr>
<tr>
<th>Product Description</th>
<td><form:input path="productDesc"/></td>
</tr>

<tr>
<th>Supplier</th>
<td>
<form:select path="supplierId">
<form:option value = "0" label = "Select Supplier"/>
<form:options items = "${Supplierslist}" />
</form:select>
</td>
</tr>

<tr>
<th>Category</th>
<td>
<form:select path="categoryId">
<form:option value = "0" label = "Select Category"/>
<form:options items = "${Categorieslist}" />
</form:select>
</td>
</tr>

<tr>
<th>Price</th>
<td><form:input path="price"/></td>
</tr>
<tr>
<th>Stock</th>
<td><form:input path="stock"/></td>
</tr>
<tr>
<th>Experts Rating</th>
<td><form:radiobuttons path="rating" items="${RatingsList}" /></td>
</tr>  
	
<tr>
<td align="center" colspan="2"><input type="submit" value="Update Product">Update Product</td>
</tr>
</table>
</form:form>
</body>
</html>
<%@include file="Footer.jsp" %>