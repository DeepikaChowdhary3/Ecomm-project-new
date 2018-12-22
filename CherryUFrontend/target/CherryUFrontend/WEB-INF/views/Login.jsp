<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<title>CherryU|Log In</title>
<style>
body{
background-size:cover;
}

</style>
</head>

<body background="<c:url value="/resources/images/signinbg.jpg"/>">

    <br><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-4">
		</div>
        <div class="col-md-6 col-md-offset-4">
  <h3 style="border-bottom: 1px solid black;">
    <i class="glyphicon glyphicon-user">
    </i><b>
   Login To CherryU</b>
  </h3>
  <form class="form-login" action="perform_login" method="post">
  
  <div style="padding: 20px;" id="form-olvidado">
  
        <div class="form-group input-group">
          <span class="input-group-addon">
        	<i class="fas fa-user"></i>
          </span>&nbsp;&nbsp;
          <input class="form-control" placeholder="UserName" name="username" id="username" type="text" required="" autofocus="">
        </div>
        <div class="form-group input-group">
          <span class="input-group-addon">
            <i class="fas fa-lock"></i>
           </span>&nbsp;&nbsp;
          <input class="form-control" placeholder="Password" name="password" id="password" type="password" value="" required="">
        </div>
        <div>
          <button type="submit" class="btn btn-primary btn-block">
           Submit
          </button>
          
          
          <p class="help-block text-center">
            <a class="pull-right text-muted" href="#" id="olvidado"><strong>Forgot your password?</strong></a>
          </p>
        </div>
 
  
  </div>
  </form>
  
  
  <div style="display: none;" id="form-olvidado">
    <h4 class="">
      Forgot your password?
    </h4>
    <form accept-charset="UTF-8" role="form" id="login-recordar" method="post">
      <fieldset>
        <span class="help-block">
          Email address you use to log in to your account
          <br>
          We'll send you an email with instructions to choose a new password.
        </span>
        <div class="form-group input-group">
          <span class="input-group-addon">
            @
          </span>
          <input class="form-control" placeholder="Email" name="email" type="email" required="">
        </div>
        <button type="submit" class="btn btn-primary btn-block" id="btn-olvidado">
          Continue
        </button>
        <p class="help-block text-center">
          <a class="text-muted" href="#" id="acceso"><strong>Account Access</strong></a>
        </p>
      </fieldset>
    </form>
  </div>
</div>
	</div>
</div>
<script>
$(document).ready(function() {
	  $('#olvidado').click(function(e) {
	    e.preventDefault();
	    $('div#form-olvidado').toggle('500');
	  });
	  $('#acceso').click(function(e) {
	    e.preventDefault();
	    $('div#form-olvidado').toggle('500');
	  });
	});
</script>


</body>
</html>