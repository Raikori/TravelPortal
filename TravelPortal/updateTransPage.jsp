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
	.edit {
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
	}
	.delete{
		width: 100%;
		height: 25px;
		text-align: center;
		background-color: red;
		color: white;
		border: none;
	}
	.insert {
		width: 200px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		margin-left: 68%;
	}		

</style>

<title>Transaction Details</title>
</head>
	<%@ include file = "./model/Trans.jsp" %>
	<%@ include file = "./model/Passenger.jsp" %>
	<%@ include file = "./process/connect.jsp" %>
	<%
    	Vector<Trans>vecTrans = new Vector<Trans>();
    	Vector<Passenger>vecPas = new Vector<Passenger>();
        int id=Integer.parseInt(request.getParameter("id"));
        String query= "SELECT * FROM trpassenger where transID="+id+"";
        ResultSet rs=st.executeQuery(query);

        while(rs.next()){
            vecPas.add(new Passenger(
            	rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5)
            ));
        }

        String query1="Select * FROM mstransaction where transID="+id+"";
        rs=st.executeQuery(query1);
        String inv="";
        String status="";

        if(rs.next()){
        	inv=rs.getString(3);
        	status=rs.getString(5);
        }
	%>
<body>
	<div class="bodyWeb">
		<ul>
			<li>Home  </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p><br>

		<h1>Update Transaction</h1>
		<p>Update selected transaction</p><br>
		<p><%=inv%><%=status%></p>
			<table>
				<tr>
					<th>Person title</th>
					<th>Person Name</th>
					<th>Person Nasionality</th>
					<th>Action</th>
				</tr>
				<%
					for(int i=0;i<vecPas.size();i++)
						{
				%>
				<tr>
					<td><%=vecPas.get(i).getTitle()%></td>
					<td><%=vecPas.get(i).getName()%></td>
					<td><%=vecPas.get(i).getNationality()%></td>
					<td> 
						<a href="process/ControllerTrans.jsp?pid=<%=vecPas.get(i).getPasID()%>&tid=<%=id%>"><input class="delete" type="submit" value="Delete">
						</a>	
					</td>
				</tr>
				<%
					}
				%>
			</table>
		<a href="DashboardPageTrans.jsp"><input class="insert" type="submit" value="Back"></a>
 	</div>
 	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>