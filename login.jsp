<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<style>
body {
    text-align: center;
    background-color: #f5e6cc;
    

    /* OPTIONAL image */
    background-image: url("https://us.123rf.com/450wm/cloudbursted/cloudbursted2004/cloudbursted200400033/146097469-food-packaging-quarantine-food-delivery-home-flatlay-with-copyspace.jpg?ver=6");
    background-size: cover;
    
    .container {
    margin-left: 80px;
    text-align: center;
    padding-top: 30px;
    background-color:white smoke;
   
}
    
}
</style>
<body>
<div class="container">

<h1>Inventory Control System</h1>

<h3>Login here......</h3>

<form action="LoginController" method="post">
    Username: <input type="text" name="username"><br><br>
    Password: <input type="password" name="password"><br><br>
	
   <input type="submit" value="Sign In">

<input type="button" value="Sign Up"
       onclick="window.location.href='register.jsp'">
</form>

<br>
<a href="register.jsp">New User? Register</a>
</div>


</body>
</html>