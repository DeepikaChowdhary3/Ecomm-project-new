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
<br><br><br>
<h3 align="center">Update Supplier Page</h3>
<form  action="<c:url value="/updateSupplier"/>" method="post">
<table align="center">
<tr>
<td>Supplier ID</td>
<td><input type="text" id="supplierId" name="supplierId" value="${supplier.supplierId}"></td>
</tr>
<tr>
<td>Supplier Name</td>
<td><input type="text" id="supplierName" name="supplierName" value="${supplier.supplierName}"></td>
</tr>
<tr>
<td>Supplier Address</td>
<td><input type="text" id="supplierAddr" name="supplierAddr" value="${supplier.supplierAddr}"></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" value="Update Supplier"></td>
</tr>
</table>

</form>
</body>
</html>