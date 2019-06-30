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
    table {
    	margin-left: 50px;
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 90%;
	}
	td, th {
  		border: 1px solid #dddddd;
  		text-align: center;
  		padding: 8px;
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
		margin-left: 1050px;

	}
	.edit {
		width: 100px;
		height: 25px;
		text-align: center;
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
    p{
    	margin-left: 15px;
    	color:white;
    }

</style>

<title>Admin Dashboard</title>
</head>
<body>
	<%@ include file = "./model/City.jsp" %>
	<%@ include file = "./process/connect.jsp" %>
	<%
		int userID=(Integer)session.getAttribute("userID");
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
	<div>
		<ul>
			<li><a href="Home.jsp"></a> Home</li>
			<li> <a href="DashboardPage.jsp"> Users </a></li>
			<li> <a href="DashboardPageCity.jsp">Cities </a></li>
			<li> <a href="DashboardPageTicket.jsp">Tickets </a> </li>
			<li> <a href="DashboardPageTrans.jsp">Transaction </a></li>
		</ul>
		<p class="user"><a href="process/doLogout.jsp">Logout</a></p>
		<p class="user"><%out.println(session.getAttribute("username"));%></p>

		<h1>Cities</h1>
		<p>Available city list</p>
		<table>
			<tr>
				<th>City</th>
				<th>Country</th>
				<th>Action</th>
			</tr>
			<%
				for(int i=0;i<vecCity.size();i++) {

			%>
			<tr>
				<td><%=vecCity.get(i).getName()%></td>
				<td><%=vecCity.get(i).getCountry()%></td>
				<td>
					<ul>
					    <li style="display:inline-block;">
					        <a href="updateCityPage.jsp?id=<%=vecCity.get(i).getId()%>"style="text-decoration:none; color:#00FFFF;"><input class="edit" type="submit" value="Edit"></a>
					    </li>
					    <li style="display:inline-block;">
					        <a href="./process/ControllerCity.jsp?deleteId=<%=vecCity.get(i).getId()%>" style="text-decoration:none; color:#00FFFF;"><input class="delete" type="submit" value="Delete"> </a>
					    </li>
					</ul>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<a href="insertCityPage.jsp"><input class="insert" type="submit" value="Insert city"></a>
	</div>
	<div class="footer">
		<p>Jeremy Nathaniel Dumalang-1901480766-User online:<%=application.getAttribute("online") %></p>
	</div>
</body>
</html>