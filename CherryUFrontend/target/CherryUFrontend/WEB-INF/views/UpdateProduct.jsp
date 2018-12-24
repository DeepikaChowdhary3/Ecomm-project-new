<%@include file="Header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CherryU|Update Product</title>
</head>
<body bgcolor="#FFDAB9">
<br><br><br>
<h3 align="center">Update Product Page</h3>
<form:form action="updateProduct" modelAttribute="product" method="post">
<table align="center">

<tr>
<th>Product Name</th>
<td><form:input path="productName" value="${product.productName}"/></td>
</tr>
<tr>
<th>Product Desc</th>
<td><form:input path="productDesc" value="${product.productDesc}"/></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Update Category"></td>
</tr>
</table>
</form:form>
</body>
</html>
<%@include file="Footer.jsp" %>