


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>CherryU</title>
<style>
body{
background-size:cover;
}
</style>
</head>
<body background="<c:url value="/resources/images/homebg.jpg"/>">
<br>

<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>
  <div class="carousel-inner text-center">
    <div class="carousel-item active">
      <img src="<c:url value="/resources/images/logo.png"/>" alt="Welcome" width="900" height="500">
        
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/resources/images/Titan-home.jpg"/>" alt="Skinn by titan" width="900" height="500">
     
       
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/resources/images/bg7.jpg"/>" alt="New York" width="900" height="500">
        
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/resources/images/Makeup-Home.png"/>" alt="New York" width="900" height="500">
        
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/resources/images/Nyx-home.png"/>" alt="New York" width="900" height="500">
        
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon" style="color:black;"></span>
  </a>
</div>
</body>
</html>