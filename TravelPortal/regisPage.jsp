<!DOCTYPE html>
<html>
<head>
<title>Registration Page</title>
<style>
	body {
		text-align: center;
		background-color: #006080;
	}
	h1{
		color: white;
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

</head>
<body>

	<h1>Sign up to our application</h1>

	<div>
		<form action="process/doRegis.jsp" Method="POST">
			Name:<br>
		 	<input type="text" name="Name"><br>
			Email:<br>
		 	<input type="text" name="Email"><br>
			Password:<br>
			<input type="password" name="Pass"><br>
			Password Confirmation:<br>
			<input type="password" name="PassCons"><br>
			Gender<br>
			<input type="radio" name="Gender" value="Male">Male
			<input type="radio" name="Gender" value="Female">Female<br>
			<input type="submit" value="Submit">
			
			<p>Already have an account? <a href="loginPage.jsp">Sign in now</a></p>
		</form> 
		<%
        String error=request.getParameter("err");
        if(error != null){
            if(error.equals("1")){
              out.println("Username must be filled");
            }
            else if(error.equals("2")){
                out.println("Email must be filled and must follow the rule");
            }
            else if(error.equals("3")){
                out.print("password char cant be empty");
            }
            else if(error.equals("4")){
                out.print("Confirm is not equal with password");
            }
            else if(error.equals("5")){
                out.print("You must input your gender <br>");
        	}
        }%>
	</div>
</body>
</html>