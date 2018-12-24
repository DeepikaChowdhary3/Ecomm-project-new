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

<title>CherryU|Confirm Order</title>
<style>
body{
background-size:cover;
}
.container{
background:black;
color:#fa8072;
font-family:'Times New Roman';
font-weight:bold;
}
.table{
font-size:18;
font-weight:bold;
}
</style>
</head>
<body background="<c:url value="/resources/images/orderbg2.png"/>">
<br><br><br>
<div class="container">
<div class="row">
<div class="col-md-12 text-center">
<br>
<h5>&nbsp;&nbsp;<i class="fas fa-smile-beam">&nbsp;&nbsp; Your Order Details</i></h5>
</div>
</div>
</div>

<b><strong>
<div class="container text-center" style="background-color:pink;color:black">
<div class="table-responsive">
  <table class="table table-light">
    <thead class="table-danger">
    <tr>
    <td>Product Image</td>
    <td>Product Name</td>
    <td>Price</td>
    <td>Quantity</td>
    <td>Total</td>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${Cartlist}" var="cart">
    <tr>
    <td><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="50" height="50"></td>
    <td>${cart.productName}</td>
    <td>Rs. ${cart.price}</td>
    <td>${cart.quantity}</td>
    <td>Rs. ${cart.quantity * cart.price}</td>
    </tr>
    </c:forEach>
    
    <tr>
    <td colspan="4">Grand Amount</td>
    <td>Rs. ${totalAmount}</td>
    </tr>
    
    <tr>
    <td colspan="5" align="center"><a href="<c:url value="/cart"/>"><button>Update Cart</button></a></td>
    </tr>
    </tbody>
  </table>
</div>
</div>

<br>
<div class="container">
<div class="row">
<div class="col-md-12 text-center">
<br>
<h5>&nbsp;&nbsp;<i class="fas fa-credit-card">&nbsp;&nbsp; Payment Details</i></h5>
</div>
</div>
</div>


<div class="container text-center" style="background-color:pink;color:black">
<form action="payment" method="post">
<div class="table-responsive">
  <table class="table table-light">
  <tr>
  <td>Payment mode</td>
  <td>
  <input type="radio" name="pmode" value="Cash On Delivery"/>Cash On Delivery
  <input type="radio" name="pmode" value="Credit Card"/>Credit Card
  <input type="radio" name="pmode" value="Net Banking"/>Net Banking
  </td>
  </tr>
  <tr>
  <td>Credit Card Number</td>
  <td><input type="text" name="cardnumber"/></td>
  </tr>
  <tr>
  <td>CVV</td>
  <td><input type="number" name="cvv"/></td>
  </tr>
  <tr>
  <td>Valid Upto</td>
  <td><input type="text" name="validupto"/></td>
  </tr>
  <tr>
  <td>Shipping Address</td>
  <td><input type="text" placeholder="address" name="shippingAddress"></td>
  </tr>
  <tr>
  <td colspan="2" align="center"><input type="submit" value="Confirm Order and Pay"></td>
  </tr>
  </table>
  </div>
  </form>

</div>
</strong></b>
</body>
</html>
<%@include file="Footer.jsp" %>