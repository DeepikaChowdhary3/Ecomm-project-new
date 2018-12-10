<%@include file="Header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CherryU|Update Supplier</title>
</head>
<body>
<h3 align="center">Update Supplier Page</h3>
<form:form action="updateSupplier" modelAttribute="supplier" methos="post">
<table align="center">
<tr>
<td>Supplier ID</td>
<td><form:input path="supplierId" value="${supplier.supplierId}"/></td>
</tr>
<tr>
<td>Supplier Name</td>
<td><form:input path="supplierName" value="${supplier.supplierName}"/></td>
</tr>
<tr>
<td>Supplier Address</td>
<td><form:input path="supplierAddr" value="${supplier.supplierAddr}"/></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Update Supplier"></td>
</tr>
</table>
</form:form>

</body>
</html>