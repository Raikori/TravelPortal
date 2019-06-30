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
	.bodyWeb{
		padding: 10px;
		color: white;
    }
    .user{
    	float: right;
    	text-align: right;
    }
    .home{
    	float: left;
    	text-align: left;
    }
    h1{
    	margin-left: 15px;
    	margin-top: 80px;
    }
    table {
    	background-color: #f2f2f2;
    	text-align:left;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 100%;
  		color: black;

	}
	td, th {
  		border: none;
  		text-align: left;
  		padding: 8px;
	}
	.hidetext { 
		-webkit-text-security: disc; 
	}
	a{
		color:white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
	}
	input[type="submit"] {
		width: 200px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	.Passanger{
		float: left;
		width: 60%;
	}
	.Buyer{
		float: right;
		width: 20%;
	}
	input[type="text"] {
		width: 20%;
		height: 25px;
		text-align: left;
		border: none;
	}


</style>

<title>Home</title>
</head>
<%@ include file = "./model/Ticket.jsp" %>
<%@ include file = "./process/connect.jsp" %>
<%
        String ticId=request.getParameter("ticId");
        String pas=request.getParameter("pas");
        String cabin=request.getParameter("cabin");
		int cnt=Integer.parseInt(pas);

		int id=Integer.parseInt(ticId);
		int pasId=Integer.parseInt(pas);
        String[] title=request.getParameterValues("Title");
        String[] name=request.getParameterValues("Name");
        String[] nat=request.getParameterValues("Nat");

    	for(int i=0;i<pasId;i++){
       		if(title[i].isEmpty()){
                response.sendRedirect("purchaseTicketPage.jsp?err=1&pas="+pas+"&ticId="+ticId+"&cabin="+cabin+"");
            }
            else if(name[i].isEmpty()){
                response.sendRedirect("purchaseTicketPage.jsp?err=2&pas="+pas+"&ticId="+ticId+"&cabin="+cabin+"");
            }
            else if(nat[i].isEmpty()){
                response.sendRedirect("purchaseTicketPage.jsp?err=3&pas="+pas+"&ticId="+ticId+"&cabin="+cabin+"");
            }
        }

        String depart="";
        String arrival="";
        String eco="";
        String bus="";
        int tot=0;

    	Vector<Ticket>vecTicket = new Vector<Ticket>();
        String query= "SELECT * FROM msticket WHERE ticketID = "+id+"";
     	ResultSet rs=st.executeQuery(query);
        if(rs.next()){
        	depart=rs.getString(3);
        	arrival=rs.getString(4);
        	eco=rs.getString(6);
        	bus=rs.getString(7);
    	}
    
%>            
<body>
	<div class="bodyWeb">
		<p class="home"><a href="Home.jsp">Home</a></p>
		<p class="user"> <% out.println(session.getAttribute("username")); %> </p>
		<h1>Purchase Confirmation</h1><br>
		<p>Confirm your ticket</p><br>
		<div class="Passanger">
		<form action="process/ControllerTrans.jsp?pas=<%=pas%>&ticId=<%=ticId%>" method="post">
			<table>
				<%
					for(int i=0;i<cnt;i++){
				%>
				<tr>
					<th colspan="2"><%=i+1%> Passanger info</th>
				</tr>
				<tr>
					<th>Name</th>
					<th>Nationality</th>
				</tr>
				<tr>
					<td><input type="text" name="Name" value="<%=name[i]%>"></td>
					<td><input type="text" name="Nat" value="<%=nat[i]%>"></td>
					<td><input type="hidden" name="Title" value="<%=title[i]%>"></td>
				</tr>
				<tr>
					<th>Departure</th>
					<th>Arrival</th>
				</tr>
				<tr>
					<td><%=depart%></td>
					<td><%=arrival%></td>
					<input type="hidden" name="Title" value="<%=title[i]%>">
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="Buyer">
			<table>
				<tr>
					<th>Buyer Information</th>
				</tr>
				<tr>
					<td>Nama</td>
				</tr>
				<tr>
					<td><% out.println(session.getAttribute("username")); %> </td>
				</tr>
				<tr>
					<th>Total Price(s)</th>
				</tr>
				<tr>
					<%
						if(cabin.equals("eco")){
							int price=Integer.parseInt(eco);
							tot=price*pasId;
						}
						else{
							int price=Integer.parseInt(bus);
							tot=price*pasId;
						}
						
					%>
					<td><%=tot%></td>
				</tr>
				<tr>
					<td> <input type="Submit" Value="Pay"></td>
				</tr>
				<tr>
					<td><a href="Home.jsp"><input type="Submit" Value="Cancel"><</a></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>