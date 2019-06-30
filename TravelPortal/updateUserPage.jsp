<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	.bodyWeb{
		padding: 10px;
		color: white;
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
    .user{
    	float: right;
    	text-align: right;
    	padding:0;
    	margin: 0;
    }
    p{
    	margin-left: 15px;
    	color:white;
    }
    h1{
    	margin-left: 15px;
    	margin-top: 80px;
    	color: white;
    }
	table {
    	text-align: left;
    	margin-left: 18%;
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
	a {
		color: white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
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
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	input[type="radio"] {
	    -ms-transform: scale(1.5); /* IE 9 */
	    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
	    transform: scale(1.6);
	}
	input[type="submit"]{
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		float: right;
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
</style>

<title>Update User</title>
</head>

<%@ include file = "./process/connect.jsp" %>
<%
        int id = Integer.parseInt(request.getParameter("id"));
        String name ="";
        String email = "";
        String password="";
        String gender="";

        String query= "SELECT * FROM msuser WHERE userID="+id+"";
        ResultSet rs=st.executeQuery(query);
        if(rs.next()){
            name=rs.getString(2);
            email=rs.getString(3);
            password=rs.getString(4);
            gender=rs.getString(5);
        }
    %>
<body>
	<div>
		<ul>
			<li><a href="Home.jsp">Home</a> </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p><br>

		<h1>Update User</h1>
		<p>Update active user</p>
		<form action="process/ControllerUser.jsp?id=<%=id%>" method="POST">
			<table>
				<tr>
					<td>Name</td>
				</tr>
				<tr>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<td>Email</td>
				</tr>
				<tr>
					<td><input type="text" name="email" value="<%=email%>"></td>
				</tr>
				<tr>
					<td>Gender:</td>
				</tr>
				<tr>
					<%
						if(gender.equals("Male"))
						{
					%>
						<td><input type="radio" name="gender" value="Male" checked>Male
						<input type="radio" name="gender" value="Female">Female<br></td>
					<%
						}
						else{
					%>	
						<td><input type="radio" name="gender" value="Male" >Male
						<input type="radio" name="gender" value="Female"checked>Female<br></td>
					<%
					}
					%>
				</tr>
				<tr>
					<td>Password:</td>
				</tr>
				<tr>
					<td><input type="password" name="password" value="<%=name%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update User"></td>
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
				                out.print("You must input your gender");
				        	}
				        }%>
    				</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>