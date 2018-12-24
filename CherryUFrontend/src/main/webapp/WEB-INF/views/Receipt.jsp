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
<title>CherryU|Receipt</title>
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
</style>
</head>
<body background="<c:url value="/resources/images/subg.jpg"/>">
<br><br><br>
<div class="container">
<div class="row">
<div class="col-md-12 text-center">
<br>
<h5>&nbsp;&nbsp;<i class="fas fa-smile-beam">&nbsp;&nbsp;Receipt</i></h5>
</div>
</div>
</div>
<div class="container text-center" style="background-color:black;color:black">
<div class="table-responsive">
  <table class="table table-light">
  <thead class="table-success">
  <tr>
  <th colspan="4" align="center"><b>Customer Details</b></th>
  </tr>
  </thead>
  <tbody>
  <tr>
  <td>Order Id : </td>
  <td>${orderDetails.orderId}</td>
  <td>Order Date : </td>
  <td>${orderDetails.orderDate}</td>
  </tr>
  <tr>
  <td>Customer Name : </td>
  <td>${user.customerName}</td>
  <td>Shipping Address : </td>
  <td>${orderDetails.shippingAddress}</td>
  </tr>
  <tr>
  <td>Mobile Number : </td>
  <td>${user.mobileNo}</td>
  <td>Email ID : </td>
  <td>${user.emailId}</td>
  </tr>
  <tr>
  <td>Grand Amount : </td>
  <td>${orderDetails.grandAmount}</td>
  <td>Payment Mode</td>
  <td>${orderDetails.pmode}</td>
  </tr>
  </tbody>
</table>
</div>
</div>

<div class="container text-center" style="background-color:black;color:black">
<div class="table-responsive">
  <table class="table table-light">
    <thead class="table-success">
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
    <td colspan="5" align="center"><b>Thank You for Ordering from Cherry! Have a Happy Day!</b></td>
    </tr>
    </tbody>
  </table>
</div>
</div>

</body>
</html>
<%@include file="Footer.jsp" %>