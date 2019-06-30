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
	 	float: left;
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
    	text-align: left;
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
  		color: black;
	}
	.hidetext { 
		-webkit-text-security: disc; 
	}
	/* stack overflow how to make radio bigger*/
	input[type="radio"] {
    -ms-transform: scale(1.5); /* IE 9 */
    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
    transform: scale(1.6);
	}
	input[type="text"]{
		width: 500px;
		height: 20px;
		text-align: left;
	}
	a{
		color: white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
	}
	label {
	    width:1000px;
	    clear:left;
	    text-align:right;
	    padding-right:10px;
	}
    table {
    	text-align: center;
    	margin-left: 120px;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 50%;
  		color: white;
	}
	.edit {
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	.delete{
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: red;
		color: white;
		border: none;
	}
	.insert {
		width: 150px;
		height: 30px;
		margin-left: 1190px;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	.footer{
    	position: fixed;
    	padding-bottom: 30px;
		color: white;
		text-align: center;
		bottom: 0;
		background-color: black;
		width: 100%;
		height: 25px;
    }
    p{
    	margin-left: 15px;
    	color:white;
    }
</style>

<title>Insert City</title>
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
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p>

		<h1>Insert City</h1>
		<p>Insert new city</p>
			<form action="process/ControllerCity.jsp">
				<table>
					<tr>
						<td>City</td>
						<td>Country</td>
					</tr>
					<tr>
						<td> <input type="text" name="City"> </td>
						<td> <input type="text" name="Country"> </td>
					</tr>
					<tr>
						<td>	
							<%
					        String error=request.getParameter("err");
					        if(error != null){
					            if(error.equals("1")){
					              out.println("City Name must be filled");
					            }
					            else if(error.equals("2")){
					                out.print("Country name cant be empty");
					            }
					        }%>
    					</td>
					</tr>
				</table>	
				<input class="insert" type="submit" value="Add City">
			</form> 
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>