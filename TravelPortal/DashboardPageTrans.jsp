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
    	padding:0;
    	margin: 0;
    }
    h1{
    	margin-left: 15px;
    	margin-top: 80px;
    	color: white;
    }
    table {
    	text-align: center;
    	margin-left: 50px;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 90%;
	}
	td, th {
  		border: 1px solid #dddddd;
  		text-align: center;
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
		width: 200px;
		height: 25px;
		text-align: center;
		background-color: #3399ff;
		color: white;
		border: none;
		margin-left: 1065px;
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
    p{
    	margin-left: 15px;
    	color:white;
    }

</style>

<title>Admin Dashboard</title>
</head>
	<%@ include file = "./model/Trans.jsp" %>
	<%@ include file = "./model/User.jsp" %>
	<%@ include file = "./process/connect.jsp" %>
	<%
		int userID=(Integer)session.getAttribute("userID");
    	Vector<Trans>vecTrans = new Vector<Trans>();
    	Vector<User>vecUser = new Vector<User>();
        String query= "SELECT * FROM mstransaction";
        ResultSet rs=st.executeQuery(query);

        while(rs.next()){
            vecTrans.add(new Trans(
            	rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5)
            ));
        }


	%>
<body>
	<div>
		<ul>
			<li><a href="Home.jsp"> Home</a> </li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
			<li> <a href="editProf.jsp?id=<%=userID%>">Edit profile</a></li>
		</ul>
				<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p>

		<h1>Transactions</h1>
		<p>On Progress Transaction</p>
		<table>
			<tr>
				<th>Invoice Number</th>
				<th>Date</th>
				<th>Buyer</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
			<%
				for(int i=0;i<vecTrans.size();i++){
					int userId=vecTrans.get(i).getUserID();
					String query1="SELECT * FROM msuser where userID="+userId+"";
					String name="";
			        rs=st.executeQuery(query1);

			        if(rs.next()){
		                name=rs.getString(2);
			        }

			%>
			<tr>
				<td><%=vecTrans.get(i).getInvoice()%></td>
				<td><%=vecTrans.get(i).getTransDate()%></td>
				<td><%=name%></td>
				<td><%=vecTrans.get(i).getStatus()%></td>
				<td>
					<ul>
						<li style="display:inline-block;">
					        <a href="viewTrans.jsp?id=<%=vecTrans.get(i).getID()%>" style="text-decoration:none; color:#00FFFF;"><input class="edit" type="submit" value="View"> </a>
					    </li>
					    <li style="display:inline-block;">
					        <a href="updateTransPage.jsp?id=<%=vecTrans.get(i).getID()%>"style="text-decoration:none; color:#00FFFF;"><input class="edit" type="submit" value="Edit"></a>
					    </li>
					    <li style="display:inline-block;">
					        <a href="./process/ControllerTrans.jsp?deleteId=<%=vecTrans.get(i).getID()%>" style="text-decoration:none; color:#00FFFF;"><input class="delete" type="submit" value="Delete"> </a>
					    </li>
					</ul>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>