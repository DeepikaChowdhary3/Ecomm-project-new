<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Supplier</title>
</head>

<body>
<h3 align="center">Supplier Page</h3>

<form  action="<c:url value="/addSupplier"/>" method="post">
<table class="table table-light">
<tr>
<td>Supplier ID</td>
<td><input type="text" id="supplierId" name="supplierId"></td>
</tr>
<tr>
<td>Supplier Name</td>
<td><input type="text" id="supplierName" name="supplierName"></td>
</tr>
<tr>
<td>Supplier Address</td>
<td><input type="text" id="supplierAddr" name="supplierAddr"></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Add Supplier"></td>
</tr>
</table>
</form>
<br>

<table align="center" class="table table-dark table-hover">
<tr>
	<th>Supplier Id</th>
	<th>Supplier Name</th>
	<th>Supplier Address</th>
	<th>Operations</th>
</tr>
<c:forEach items="${Supplierslist}" var="supplier">
<tr>
	<td>${supplier.supplierId}</td>
	<td>${supplier.supplierName}</td>
	<td>${supplier.supplierAddr}</td>
	<td>
	<a href="<c:url value="/editSupplier/${supplier.supplierId}"/>"><button>Edit</button></a>
	<a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>"><button>Delete</button></a>
	</td>
</tr>
</c:forEach>
</table>

</body>
</html>