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

<title>CherryU|${product.productName}</title>
<script>
function getRating() {
var number = ${product.rating};
if(number *= 1 > 0  && number <=5) {
show_image('yr', number);
} else {
alert("Enter valid rating, greater than 0");
}
}

function show_image (id,number) {
var x = number;
var y = id;
document.getElementById(y).innerHTML = '';
for (var i =0; i<x; i++){
var img = document.createElement("img");
img.height=30;
img.src = "http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/512/star-full-icon.png";
document.getElementById(y).appendChild(img);
}
}
</script>
<style>
body {
	
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }



.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }





.product-title{
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span,.stock span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price,.stock, .vote,.btn-minus,.btn-plus {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }




.addtocart {
  background: black;
  padding: 1.2em 1.5em;
  border: none;
  align:center;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fa8072;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .addtocart:hover{
    background: #fa8072;
    color: black; }





.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */
</style>
</head>
<body background="<c:url value="/resources/images/bg9.jpg"/>">
<br>
<form action="<c:url value="/addtocart/${product.productId}"/>" method="post" >	

<div class="container">
<div class="card">
<div class="container-fliud">
<div class="wrapper row">
<div class="preview col-md-6">
				
<div class="preview-pic tab-content">
<div class="tab-pane active" id="pic-1"><img src="<c:url value="/resources/images/${product.productId}.jpg"/>"></div>
</div>						
</div>
<div class="details col-md-6">
<h3 class="product-title">${product.productName}</h3>
<div class="rating">
<div class="star">
<span id="yr"></span><br/><span id="y"></span>  <br>
<button style="background-color:black;color:#fa8072" type="button" onclick="getRating()">
<i class="fas fa-heart"></i>&nbsp;&nbsp;Click here for User Rating&nbsp;&nbsp;<i class="fas fa-heart"></i></button>
</div>
						
</div>
<h5><p>191 users loved this product!</p></h5>
<h5><p class="product-description">${product.productDesc}</p></h5>
<h4 class="price"><b>Current Price:  INR <span>${product.price}</span></b></h4>
<h4 class="stock"><b>Stock Available: <span>${product.stock}</span></b></h4>
<p class="vote"><strong>91%</strong> of buyers enjoyed this product!</p>
		
			
<h5>Quantity: 

		<select name="quantity" class="form-control btn-block">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			</select>
		
</h5>
		<br>						

<div class="action" >
<button type="submit" align="center" class="addtocart btn btn-default">Add To Cart</button>

</div>
</div>
</div>
</div>
</div>
</div>
</form>
	
<br><br><br>
</body>
</html>
<%@include file="Footer.jsp" %>