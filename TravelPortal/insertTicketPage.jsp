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
	}
	li{
	  	display: inline-block;
	  	padding-left: 10px;
	}
	div{
		width: 100%;
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
	/* stack overflow how to make radio bigger*/
	input[type="radio"] {
    -ms-transform: scale(1.5); /* IE 9 */
    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
    transform: scale(1.6);
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
	input[type="password"]{
		width: 820px;
		height: 20px;
		text-align: left;
	}
	input[type="select"]{
		width: 820px;
		height: 30px;
		text-align: left;
	}
	a{
		color: white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
	}
	table {
    	text-align: center;
    	margin-left: 200px;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 70%;
	}
	.insert {
		width: 200px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		margin-left: 1000px;
	}
	p{
    	margin-left: 15px;
    	color:white;
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

</style>

<title>Insert User</title>
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
	<div>
		<ul>
			<li>Home  </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"> <% out.println(session.getAttribute("username")); %> </p>

		<h1>Insert Ticket</h1>
		<p>Insert new ticket for airlines</p>
			<form action="process/ControllerTicket.jsp" method="post">
				<table>
					<tr>
						<td>Airline</td>
					</tr>
					<tr>
						<td colspan="4">
							<select class="text4" name="airline" >
							  <option value=""> -- select an airline -- </option>
							  <option value="Garuda Indonesia">Garuda Indonesia</option>
							  <option value="Lion Air">Lion Air</option>
							  <option value="Citilink">Citilink</option>
							  <option value="Sriwijaya Air">Sriwijaya Air</option>
							</select>
						</td>
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
							  <option value=""> -- select a location -- </option>
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
						<td>Price economy(Rp.)</td>
						<td>Price business(Rp.)</td>
						<td>Departure Date</td>
						<td>Available Seat</td>
					</tr>
					<tr>
						<td> <input class="text" type="text" name="ecoPrice" value=0> </td>
						<td> <input class="text" type="text" name="busPrice" value=0> </td>
						<td> <input class="text" type="date" name="depDate"> </td>
						<td> <input class="text" type="text" name="avaSeat" value=0> </td>
					</tr>
					<tr>
						<td colspan="4">
							<%
					        String error=request.getParameter("err");
					        if(error != null){
					            if(error.equals("1")){
					              out.println("Airline must be filled");
					            }
					            else if(error.equals("2")){
					                out.println("From Location must be filled");
					            }
					            else if(error.equals("3")){
					                out.println("To Location must be filled");
					            }
					            else if(error.equals("4")){
					                out.println("Economy Price must be filled and must numeric");
					            }
					            else if(error.equals("5")){
					                out.println("Business Price must be filled and must numeric");
					            }
					             else if(error.equals("6")){
					                out.println("Depart Date must be filled and must least today");
					            }
					            else if(error.equals("7")){
					                out.println("Available seat must be filled and must numeric");
					            }
					        }%>
						</td>
					</tr>
				</table>
				<input class="insert" type="submit" value="Insert Ticket">
			</form> 
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>