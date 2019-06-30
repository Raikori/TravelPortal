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
    	text-align: center;
    	margin-left: 25%;
  		font-family: arial, sans-serif;
  		width: 50%;
	}
	table {
    	text-align: center;
    	margin-left: 13%;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 70%;
	}
	td, th {
  		border: 1px solid #dddddd;
  		text-align: left;
  		padding: 8px;
  		color: white;
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
		margin-left: 75%;
	}
	.delete{
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: red;
		color: white;
		border: none;
		margin-left: 70%;
	}
	.insert {
		width: 100px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		margin-left: 75%;
	}
	input[type="radio"] {
	    -ms-transform: scale(1.5); /* IE 9 */
	    -webkit-transform: scale(1.6); /* Chrome, Safari, Opera */
	    transform: scale(1.6);
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
			<li><a href="Home.jsp">Home</a>  </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p>

		<h1>Transaction Details</h1>
		<p>Detail of selected transaction</p><br>
		<p><%=inv%> <%=status%></p>
		<table>
			<tr>
				<th>Person title</th>
				<th>Person Name</th>
				<th>Person Nasionality</th>
			</tr>
			<%
				for(int i=0;i<vecPas.size();i++)
					{
			%>
			<tr>
				<td><%=vecPas.get(i).getTitle()%></td>
				<td><%=vecPas.get(i).getName()%></td>
				<td><%=vecPas.get(i).getNationality()%></td>
			</tr>
			<%
				}
			%>
		</table>

		<%
			if(status.equals("Pending")){
		%>
		<ul>
			<li style="display:inline-block;">
		        <a href="process/ControllerTrans.jsp?appId=<%=id%>" style="text-decoration:none; color:#00FFFF;"><input class="edit" type="submit" value="Approve"> </a>
		    </li>
		    <li style="display:inline-block;">
		        <a href="process/ControllerTrans.jsp?rejId=<%=id%>"style="text-decoration:none; color:#00FFFF;"><input class="insert" type="submit" value="Reject"></a>
		    </li>
		    <li style="display:inline-block;">
		        <a href="DashboardPageTrans.jsp" style="text-decoration:none; color:#00FFFF;"><input class="insert" type="submit" value="Back"> </a>
		    </li>
		</ul>
		<%
			}
			else{
		%>
		 <a href="DashboardPageTrans.jsp" style="text-decoration:none; color:#00FFFF;"><input class="insert" type="submit" value="Back"> </a>
		 <%
		 	}
		 %>

	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>