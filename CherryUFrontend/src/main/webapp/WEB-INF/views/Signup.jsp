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

<title>CherryU|Sign Up</title>

<style>

body{
	 background-size:cover;
	
}
.container{

	 font-family:Roboto,sans-serif;
	 background-color:black;
     border-style: 1px solid #fa8072;
     text-align: center;
     opacity: 0.9;
     
     box-shadow: 2px 5px 5px 0px #eee;
    
     padding-top: 10px;  
}


	 
	  

</style>
</head>

<body background="<c:url value="/resources/images/signup.jpg"/>" >
<br><br>
<h3 align="center" style="background-color:black;color:#fa8072">Sign Up Page</h3>


 <div class="container">
 <form action="<c:url value="/addUser" />" method="post">
     
	
	 <div class="table-responsive-sm">     
	 <table class="table" style="color:#fa8072">
	 
	
	 
	 <tbody class="tbody-danger">
	     <tr>
         <th>User Name :</th>
		 <td>
		 <input type="text" id="username" name="username">
		 </td>
		 </tr>
		 
         <tr>
         <th>Password :</th>
		 <td> 
		 <input type="password" id="password" name="password">
         </td>
         </tr>
     
		 <tr>
		 <th>Full Name :</th>
		 <td>
		 <input type="text" id="customerName" name="customerName">
		 </td>
		 </tr>
		 
		 <tr>
		 <th>Address :</th>
		 <td>
		 <input type="text" id="address" name="address">
		 </td>
		 </tr>
	 
         <tr>
         <th>Mobile No. :</th>
		 <td>
		 <input type="text" id="mobileNo" name="mobileNo">
		</td>
		</tr>
		  
		
		 <tr>
		 <th>Email :</th>
		 <td>
		 <input type="email" id="emailId" name="emailId">
		 </td>
		 </tr>
	
			
		 
		 <tr>
		 <th>Please Select the Role as user:</th>
		 <td>
		 <input type="radio" id="role" name="role"  value="ROLE_USER" checked = "checked">  ROLE_USER
		 </td>
		 </tr>	
			
		<tr>
		<td colspan="2" align="center">	
		 <input type="submit" value="Register" style="background-color:green;color:black">
		 </td>
		 </tr>
		
		 </tbody>
		 </table>
		 </div>
		 </form>
		 </div>


</body>
</html>