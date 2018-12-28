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
<br><br><br>
<div class="container">

<div class="row">


<div class="col-md-12 text-center">
<br>
<h5>&nbsp;&nbsp;<i class="fas fa-shopping-cart">&nbsp;&nbsp; Your Shopping Cart</i></h5>
</div>



</div>
<br>
</div>


<br>
<b><strong>

<div class="container text-center" style="background-color:#d3d3d3;color:black">

<c:forEach items="${Cartlist}" var="cart">
<br>
<form action="<c:url value="/updateCart/${cart.cartId}"/>" method="get">
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



<button type="submit" value="update" class="btn btn-success btn-sm">
<i class="fas fa-edit">&nbsp;&nbsp;Update</i></button>

</div>
<br>

</div>

</form>
<div class="row text-center">

<div class="col-md-11 text-left">&nbsp;&nbsp;&nbsp;
<form action="<c:url value="/deleteCart/${cart.cartId}"/>" method="get">

<button type="submit" class="btn btn-danger btn-sm">
<i class="fas fa-trash-alt">&nbsp;&nbsp;Delete</i></button> </form>

</div>
</div>
<br><br><br>
</c:forEach>

<br><br>
</div>

</strong></b>


<br>
<div class="container">
<br>
<div class="row">

<div class="col-md-6 text-center">

<h4><strong>Grand Amount: ${totalAmount}</strong></h4>
</div>

<div class="col-md-3">
<a href="<c:url value="/viewProducts"/>">
<button type="submit" class="btn btn-block btn-warning">
<i class="fas fa-share-square">&nbsp;&nbsp; Continue shopping</i>
</button></a>
</div>

<div class="col-md-3 text-right">
<a href="<c:url value="/checkout"/>">
<button type="submit" class="btn btn-success btn-block">
Checkout
</button></a>
</div>
</div>
<br>

</div>
<br><br><br>
</body>
</html>
<%@include file="Footer.jsp" %>