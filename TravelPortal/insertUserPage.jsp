<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background-color: #006080;
	}
	ul{
	 	list-style-type: none;
	 	margin: 0;
	 	padding: 0;
	}
	li{
	  	display: inline-block;
	  	padding-left: 10px;
	}
	div{
		padding: 10px;
		color: white;
    }
    .user{
    	float: right;
    	text-align: right;
    }
    h1{
    	margin-left: 15px;
    	margin-top: 80px;
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
	td, th {
  		border: 1px solid #dddddd;
  		text-align: left;
  		padding: 8px;
	}
	.hidetext { 
		-webkit-text-security: disc; 
	}
	#textBox{
		width: 200px;
		height: 25px;
		text-align: center;
	}
	/* stack overflow how to make radio bigger*/
	input[type="radio"] {
    -ms-transform: scale(1.5); /* IE 9 */
    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
    transform: scale(1.6);
	}
	input[type="submit"] {
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		float: right;
	}
	table {
    	text-align: center;
    	margin-left: 200px;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 50%;
	}
	input[type="text"]{
		width: 820px;
		height: 20px;
		text-align: left;
	}
	input[type="password"]{
		width: 820px;
		height: 20px;
		text-align: left;
	}
	.footer{
    	position: fixed;
    	padding-bottom: 30px;
		color: white;
		text-align: center;
		bottom: 0;
		background-color: black;
		width: 100%;
		height: 5px;
    }
    a{
		color: white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
	}

</style>

<title>Insert User</title>
</head>
<body>
	<div>
		<ul>
			<li>Home  </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"> <% out.println(session.getAttribute("username")); %> </p>

		<h1>Insert User</h1>
		<p>Insert new user</p>
			<form action="process/ControllerUser.jsp" method="post">
				<table>
				<tr>
					<td>Name</td>
				</tr>
				<tr>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Email</td>
				</tr>
				<tr>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>Gender:</td>
				</tr>
				<tr>
					<td><input type="radio" name="gender" value="Male">Male
					<input type="radio" name="gender" value="Female">Female<br></td>
				</tr>
				<tr>
					<td>Password:</td>
				</tr>
				<tr>
					<td><input type="password" name="password"</td>
				</tr>
				<tr>
					<td><input type="submit" value="Insert User"></td>
				</tr>
				<tr>
					<td>	
						<%
				        String error=request.getParameter("err");
				        if(error != null){
				            if(error.equals("1")){
				              out.println("Name must be filled");
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
    				</td>
				</tr>
			</table>
			</form> 

	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>>
</body>
</html>