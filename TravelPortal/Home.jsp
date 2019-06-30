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
	div{
		padding: 10px;
		color: white;
		margin-top: 5%;
    }
    .user{
    	float: right;
    	text-align: right;
    	margin-right: 5%;
    }
    h1{
    	margin-top: 80px;
    	float: left;
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
	input[type="select"]{
		width: 100%;
		height: 5%;
		text-align: left;
	}
	input[type="date"]{
		width: 100%;
		height: 20px;
		text-align: left;
	}
    table {
    	text-align: center;
    	margin-left: 8%;
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
		margin-left: 900px;
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
		height: 5px;
    }
	.text4{
		width: 970px;
		height: 20px;
		text-align: left;
	}
	.text2{
		width: 480px;
		height: 20px;
		text-align: left;
	}
	.text{
		width: 200px;
		height: 20px;
		text-align: left;	
	}
	a {
		color: black;
		text-decoration: none;
		display: block;
		height: 100%;
	}

</style>

<title>Home</title>
</head>
	<%@ include file = "./model/City.jsp" %>
	<%@ include file = "./process/connect.jsp" %>
	<%
    	Vector<City>vecCity = new Vector<City>();
        String query= "SELECT * FROM mscity";
        ResultSet rs=st.executeQuery(query);

        while(rs.next()){
            vecCity.add(new City(
            	rs.getInt(1),
                rs.getString(2),
                rs.getString(3)
            ));
        }
	%>	
<body>
	<h1>The easiest way to get the chepest ticket</h1>
	<%
		if(session.getAttribute("username")==null){
	%>
	<p class="user"> <a href="loginPage.jsp">Sign in </a> <a href="regisPage.jsp">register</a> </p>
	<%
		}else{
		int userID=(Integer)session.getAttribute("userID");
		int role=1;
	%>
			<p class="user"><a href="process/doLogout.jsp">Logout</a></p> 
			<p class="user"><a href="editProf.jsp?id=<%=userID%>">Edit profile</a></p>
			<p class="user"><%out.println(session.getAttribute("username"));%></p>
			
	<%	
		}
	%>

	<div>
		<form action="searchTicketPage.jsp?page=1" method="post">
			<table>
				<tr>
					<th colspan="4">Where are you going?</th>
				</tr>
				<tr>
					<td colspan="2">From</td>
					<td colspan="2">To</td>
				</tr>
				<tr>
					<td colspan="2"> 
						<select class="text2" name="fromLoc">
						   <option value=""> -- select a Location -- </option>
								<%
									for(int i=0;i<vecCity.size();i++) {

								%>
						  <option value="<%=vecCity.get(i).getName()%>"><%=vecCity.get(i).getName()%></option>
								  <%
								  	}
								  %>
						</select>
					</td>
					<td colspan="2"> 
						<select class="text2" name="toLoc">
						   <option value=""> -- select a Location -- </option>
								<%
									for(int i=0;i<vecCity.size();i++) {

								%>
						  <option value="<%=vecCity.get(i).getName()%>"><%=vecCity.get(i).getName()%></option>
								  <%
								  	}
								  %>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"> Departure dates</td>
					<td> Passangers</td>
					<td> Cabin Class</td>
				</tr>
				<tr>
					<td colspan="2"> <input type="date" name="depDate"></td>
					<td> 
						<select class="text" name="passanger">
						   <option value=""> -- Passanger -- </option>
								<%
									for(int i=1;i<=5;i++) {

								%>
						  <option value="<%=i%>"><%=i%></option>
								  <%
									}
								  %>
						</select>
					</td>
					<td>
					 	<select class="text" name="cabin">
					 		<option value="">-- Cabin --</option>
					 		<option value="eco">Economy</option>
					 		<option value="bus">Business</option>
					 	</select>
					</td>
				</tr>
				<tr>
					<td colspan="4"> <input class="insert"type="submit" name="Search Flight"></td>
				</tr>
				<tr>
					<td colspan="4">
						<%
				        String error=request.getParameter("err");
				        if(error != null){
				            if(error.equals("1")){
				              out.println("Departure Place must be filled");
				            }
				            else if(error.equals("2")){
				                out.print("Arrival Place cant be empty");
				            }
				             else if(error.equals("3")){
				                out.print("Date cant be empty");
				            }
				            else if(error.equals("3")){
				                out.print("Passenger cant be empty");
				            }
				            else if(error.equals("3")){
				                out.print("Cabin Class cant be empty");
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