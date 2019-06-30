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
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	.cnt { 
		color:black;
		text-decoration: none;
		width: 100%;
		height: 100%;

	}

</style>

<title>Home</title>
</head>
<%@ include file = "./model/Ticket.jsp" %>
<%@ include file = "./process/connect.jsp" %>
<%

	String fromLoc=request.getParameter("fromLoc");
	String toLoc=request.getParameter("toLoc");
	String depDate=request.getParameter("depDate");
	String passanger=request.getParameter("passanger");
	String cabin=request.getParameter("cabin");

	if(fromLoc.isEmpty()){
		response.sendRedirect("Home.jsp?err=1");
	}
	else if(toLoc.isEmpty()){
		response.sendRedirect("Home.jsp?err=2");
	}
	else if(depDate.isEmpty()){
		response.sendRedirect("Home.jsp?err=3");
	}
	else if(passanger.isEmpty()){
		response.sendRedirect("Home.jsp?err=4");
	}
	else if(cabin.isEmpty()){
		response.sendRedirect("Home.jsp?err=5");
	}

	Vector<Ticket>vecTicket=new Vector<Ticket>();
	String query= "SELECT * FROM msticket where fromLoc = '"+fromLoc+"' AND toLoc = '"+toLoc+"' AND  departDate ='"+depDate+"' ";

  	ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        vecTicket.add(new Ticket(
        	rs.getInt(1),
            rs.getString(2),
            rs.getString(3),
            rs.getString(4),
            rs.getString(5),
            rs.getInt(6),
            rs.getInt(7),
            rs.getInt(8)
        ));
	}

%>
<body>
	<div class="bodyWeb">
		<p class="home"><a href="Home.jsp">Home</a></p>
		<p class="user"> <% out.println(session.getAttribute("username")); %> </p>
		<%
			int j=vecTicket.size();
			if(j==0){
		%>
				<br>
				<h1>We dont have this flight</h1>
		<%
			}else{
				rs.last();
				int totalItems = rs.getRow(); 
				int pages = 5;
				int totalPages = (int)Math.ceil((double)totalItems/pages); //
				int currPages = 0;


				if(request.getParameter("page")!=null){
					try{
						currPages = Integer.parseInt(request.getParameter("page"));
					}catch(Exception e){}
				}

		%>

		<table>
			<tr>
				<th>Airline</th>
				<th>From</th>
				<th>To</th>
				<th>Price</th>
			</tr>

			<%
				for(int i= (currPages-1)*5; i<= currPages*5-1; i++){
					if(i<j){
			%>
			<tr>

				<td><%=vecTicket.get(i).getAirline()%></td>
				<td><%=vecTicket.get(i).getFromLoc()%></td>
				<td><%=vecTicket.get(i).getToLoc()%></td>

				<%
					if(cabin.equals("eco")){
				%>
					<td><%=vecTicket.get(i).getEcoPrice()%></td>
				<%
					}else{
				%>
					<td><%=vecTicket.get(i).getBusPrice()%></td>
				<%
					}
				%>
				
				<td> <a href="purchaseTicketPage.jsp?pas=<%=passanger%>&ticId=<%=vecTicket.get(i).getId()%>&cabin=<%=cabin%>"><input type="submit" name="plus" value="+"></a></td>				
			</tr>
			<%
				}
			}
				%>

		</table>
		<%
				for(int i=1;i<=totalPages;i++){
				%>		
				<ul>
					<li> 
						<a href="searchTicketPage.jsp?page=<%=i%>&fromLoc=<%=fromLoc%>&toLoc=<%=toLoc%>&depDate=<%=depDate%>&passanger=<%=passanger%>&cabin=<%=cabin%>" class="cnt"> <%=i%> </a>
					</li>
				</ul>
			<%
			}
			}
		%>
	</div>
</body>
</html>