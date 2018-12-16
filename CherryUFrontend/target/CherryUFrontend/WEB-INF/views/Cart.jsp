<%@include file="Header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<title>CherryU|Cart</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-xs-8">
			<div class="panel panel-info">
				<div class="panel-heading justify-content-between">
					<div class="panel-title">
						<div class="row" >
							<div class="col-xs-6">
								<h5><i class="fas fa-shopping-cart">&nbsp;&nbsp; Your Shopping Cart</i></h5>
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-primary btn-sm btn-block">
									<i class="fas fa-share-square">&nbsp;&nbsp; Continue shopping</i>
								</button>
							</div>
						</div>
					</div>
				</div>
				
				<c:forEach items="Cartlist" var="cart" >
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-2"><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name">${cart.productName}</h4>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-3 text-right">
								<h6><strong>${cart.price}<span class="text-muted">x</span></strong></h6>
							</div>
							<div class="col-xs-3">
								<h6>Quantity: ${cart.quantity}</h6>
							</div>
							<div class="col-xs-4">
								<h6>Total: {cart.quantity}*{cart.price}</h6>
							</div>
							
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs">
									<i class="fas fa-trash-alt"></i>
								</button>
							</div>
						</div>
					</div>
					
					<hr>
					
				</c:forEach>
					
					<div class="row">
						<div class="text-center">
							<div class="col-xs-9">
								<h6 class="text-right">Added items?</h6>
							</div>
							<div class="col-xs-3">
				
								<button type="button" class="btn btn-default btn-sm btn-block">
									Update cart
								</button>
								
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
							<h4 class="text-right">Grand Amount: ${totalAmount}</h4>
						</div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-success btn-block">
								Checkout
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>