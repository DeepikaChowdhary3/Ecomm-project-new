<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>

.navbar{
background-color:black;

}


</style>

</head>
<body>

<nav class="navbar navbar-expand-md fixed-top">

<img src="<c:url value="/resources/images/logo.png"/>" style="width:50;px">

<a class="nav-link" href="home" style="color:#FA8072;font-size:18"><b>CherryU</b>&nbsp;&nbsp;<i class="fas fa-home">&nbsp;&nbsp;Home</i></a> 
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" style="background-color:#fa8072;color:black">
    <span class="fas fa-align-justify"></span>
  </button>

 

<div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
<c:if test="${!sessionScope.loggedIn}">    
<ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="aboutus" style="color:#FA8072"><b>About Us</b></a>
      </li>
</ul>
<ul class="nav navbar-nav navbar-right">
    <li class="nav-item">
        <a class="nav-link" href="login" style="color:#FA8072;font-size:18"><i class="fas fa-sign-in-alt">&nbsp;&nbsp;Login</i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="signup" style="color:#FA8072;font-size:18"><i class="fas fa-user">&nbsp;&nbsp;SignUp</i></a>
      </li>
</ul>
</c:if>







      <c:if test="${sessionScope.loggedIn}">
      <c:if test="${sessionScope.role=='ROLE_ADMIN'}">
<ul class="navbar-nav">  
      <li class="nav-item">
        <a class="nav-link" href="category" style="color:#FA8072"><b>Organize Category</b></a>
      </li>   
      <li class="nav-item">
        <a class="nav-link" href="supplier" style="color:#FA8072"><b>Organize Supplier</b></a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="product" style="color:#FA8072"><b>Organize Product</b></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewProducts" style="color:#FA8072"><b>Products</b></a>
      </li> 
</ul>
<ul class="nav navbar-nav navbar-right"> 
<li class="nav-item">
      <a class="nav-link" href="perform_logout" style="color:#FA8072;font-size:18"><i class="fas fa-sign-out-alt">&nbsp;Logout</i></a>
      </li>
      <li class="nav-item">
      <a class="nav-link"><font style="color:#fa8072;font-size:18;text-align:center"><b>&nbsp;&nbsp;&nbsp;Welcome ${sessionScope.username}</b></font></a>
      </li>
</ul>
      </c:if>
      </c:if>




      <c:if test="${sessionScope.loggedIn}">
      <c:if test="${sessionScope.role=='ROLE_USER'}">
<ul class="navbar-nav"> 
      <li class="nav-item">
        <a class="nav-link" href="viewProducts" style="color:#FA8072"><b>Products</b></a>
      </li> 
</ul>
<ul class="navbar-nav navbar-right ">
      <li class="nav-item"><a class="nav-link " href="cart" style="color:#FA8072;font-size:18"><i class="fas fa-shopping-cart">&nbsp;&nbsp;Cart</i></a>
      </li>
      <li class="nav-item"><a class="nav-link " href="perform_logout" style="color:#FA8072;font-size:18"><i class="fas fa-sign-out-alt">&nbsp;&nbsp;Logout</i></a>
      </li>
      <li class="nav-item">
      <a class="nav-link"><font style="color:#FA8072;font-size:18">&nbsp;&nbsp;<i class="fas fa-heart">&nbsp;Welcome ${sessionScope.username}&nbsp;</i></font></a>
      </li>
</ul>
</c:if></c:if>

  </div>  
</nav>  

<br>


</body>
</html>