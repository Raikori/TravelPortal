<!DOCTYPE html>
<html>
<head>
<style>
	body {
		text-align: center;
		background-color:  #006080;
	}
	input[type=submit]{
		width: 150px;
	}
	a{
		color: black;
		text-decoration: none;
	}
	div {
		border-radius: 5px;
		background-color: #f2f2f2;
		padding: 20px;
		border-width: 90%;
    }
    form {
    	text-align: center;
		border-radius: 5px;
		background-color: #f2f2f2;
		padding: 20px;
		border-width: 90%;
		color: black;
		font-size: 25px;
	}
	input[type="radio"] {
	    -ms-transform: scale(1.5); /* IE 9 */
	    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
	    transform: scale(1.6);
	}
	input[type="text"] {
		width: 200px;
		height: 25px;
		text-align: center;
	}
	input[type="password"] {
		width: 200px;
		height: 25px;
		text-align: center;
	}
	input[type="submit"] {
		width: 200px;
		height: 25px;
		text-align: center;
	}
	input[type="email"] {
		width: 200px;
		height: 25px;
		text-align: center;
	}

</style>
<title>Login Page</title>
</head>
<body>

	<h1>Sign in to our application</h1>
	<div>
		<form action="process/doLogin.jsp">
			Email:<br>
		 	<input type="text" name="Email"><br>
			Password:<br>
			<input type="password" name="Password"><br>		
			<input type="checkbox" name="Remember">Remember Me<br>
			<input type="submit" value="Submit">
			<p>Dont Have an account yet? <a href="regisPage.jsp">Sign up Now</a></p>
		</form> 
		<%
	        String error=request.getParameter("err");
	        if(error != null){
	            if(error.equals("1")){
	                out.println("Email or password must be filled");
	            }
	            else if(error.equals("2")){
	            	out.println("Email and Password must match with the database");
	        	}
	        }
 		 %>
	</div>

</body>
</html>