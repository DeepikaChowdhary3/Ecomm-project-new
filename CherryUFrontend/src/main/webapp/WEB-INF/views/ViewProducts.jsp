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

<title>CherryU|Products</title>
<style>

h4{
background-color:black;
color:#FA8072;

}
body{
background-size:cover;
opacity:1;
}

</style>
</head>
<body background="<c:url value="/resources/images/productsbg.jpg"/>">
<br><br><br>
<div class="container">
<h4 align="center" style="color:#fa8072">
<i><b>Products</b></i>&nbsp;&nbsp;
<br><br>
</h4>
<div class="row text-center text-lg-left">

<c:forEach items="${Productslist}" var="product">
    <div class="col-lg-4 col-sm-4 col-6">
      <a href="chosenproduct/${product.productId}" class="d-block mb-4 h-100">
     
            <img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>">
            <p align="center" style="background-color:black;color:#FA8072">
            <b>Product: ${product.productName}<br>
               Price: INR ${product.price} <br>
               Rating: ${product.rating}<br>
           </b></p>
       </a>
</div></c:forEach></div>

</div>
<br><br><br>
</body>
</html>
<%@include file="Footer.jsp" %>