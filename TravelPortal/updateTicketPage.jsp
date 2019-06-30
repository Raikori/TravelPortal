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
    	margin-left: 13%;
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
		margin-left: 75%;
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

<title>Update Ticket</title>
</head>
	<%@ include file = "./model/City.jsp" %>
	<%@ include file = "./process/connect.jsp" %>
	<%
	    int id = Integer.parseInt(request.getParameter("id"));
	    String airline="";
	    String fromLoc="";
	    String toLoc="";
	    String depDate="";
	    String ecoPrice="";
	    String busPrice="";
	    String avaSeat="";
        String query= "SELECT * FROM msticket where ticketID="+id+"";
        ResultSet rs=st.executeQuery(query);

        while(rs.next()){
            airline=rs.getString(2);
            fromLoc=rs.getString(3);
            toLoc=rs.getString(4);
            depDate=rs.getString(5);
            ecoPrice=rs.getString(6);
            busPrice=rs.getString(7);
            avaSeat=rs.getString(8);
        }

    	Vector<City>vecCity = new Vector<City>();
        String query1= "SELECT * FROM mscity";
        rs=st.executeQuery(query1);

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
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p><br>

		<h1>Update Ticket</h1>
		<p>Update ticket for airlines</p>
			<form action="process/ControllerTicket.jsp?id=<%=id%>" method="POST">
				<table>
					<tr>
						<td><A HREF=""></A>irline</td>
					</tr>
					<tr>
						<td colspan="4">
							<select class="text4" name="airline" >
							  <option value="<%=airline%>"><%=airline%> </option>
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
							   <option value="<%=fromLoc%>"><%=fromLoc%></option>
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
							  <option value="<%=toLoc%>"><%=toLoc%></option>
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
						<td> <input class="text" type="text" name="ecoPrice" value="<%=ecoPrice%>"> </td>
						<td> <input class="text" type="text" name="busPrice" value="<%=ecoPrice%>"> </td>
						<td> <input class="text" type="date" name="depDate" value="<%=depDate%>"> </td>
						<td> <input class="text" type="text" name="avaSeat" value="<%=avaSeat%>"> </td>
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
				<input class="insert" type="submit" value="Update Ticket">
			</form> 
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>