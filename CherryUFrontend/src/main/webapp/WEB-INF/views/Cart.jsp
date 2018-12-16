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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<title>CherryU|Cart</title>

<style>
.container{
background:black;
color:#fa8072;
font-family:'Times New Roman';
font-weight:bold;

}
body{
background-size:cover;
}
</style>




</head>
<body background="<c:url value="/resources/images/bg11.jpg"/>">

<div class="container">

<div class="row">


<div class="col-md-9 text-center">
<br>
<h5>&nbsp;&nbsp;<i class="fas fa-shopping-cart">&nbsp;&nbsp; Your Shopping Cart</i></h5>
</div>

<div class="col-md-3 text-right">
<br>
<button type="submit" class="btn btn-md btn-block btn-warning">
<i class="fas fa-share-square">&nbsp;&nbsp; Continue shopping</i>
</button>
</div>

</div>
<br>
</div>


<br>

<b><strong>
<div class="container text-center" style="background:#d3d3d3;color:black;font-weight:bold">
<c:forEach items="${Cartlist}" var="cart">
<br>
<div class="row ">


<div class="col-sm-2"><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="150" height="150">
</div>

<div class="col-sm-3">
<h4 class="product-name">&nbsp;&nbsp;${cart.productName}</h4>
<b>Price: ${cart.price}</b>
</div>

<div class="col-md-5">

<b>${cart.price} <span class="text-muted">x</span></b>
<b>Quantity : <input type="text" value="${cart.quantity}" name="quantity" min="1" max="10" size="1"></b>

<h5>Total: ${cart.quantity * cart.price}</h5>

</div>			
<div class="col-lg-2">

<button type="submit" class="btn btn-link btn-sm">
<i class="fas fa-trash-alt"></i></button>

<button type="submit" class="btn btn-link btn-sm">
<i class="fas fa-edit"></i></button>


</div>
<br>

</div>

<br>
<br>
<br>
</c:forEach>

<br><br>
</div>

</strong></b>


<br><br>
<div class="container">
<br>
<div class="row">

<div class="col-md-9 text-center">

<h4><strong>Grand Amount: ${totalAmount}</strong></h4>
</div>
<div class="col-md-3 text-right">
<button type="submit" class="btn btn-success btn-block">
Checkout
</button>
</div>
</div>
<br>

</div>
</body>
</html>