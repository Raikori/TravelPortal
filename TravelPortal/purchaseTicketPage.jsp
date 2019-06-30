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
  		width: 33%;
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
		margin-left: 90%;
	}
	input[type="text"] {
		width: 33%;
		height: 10%;
		text-align: center;
	}

</style>

</head>
<%@ include file = "./model/Ticket.jsp" %>
<%@ include file = "./process/connect.jsp" %>
<%
	String pas=request.getParameter("pas");
	int cnt=Integer.parseInt(pas);
	String ticId=request.getParameter("ticId");
	String cabin=request.getParameter("cabin");
	if(session.getAttribute("username")==null){
		response.sendRedirect("Home.jsp");
	}
%>

<body>
	<div class="bodyWeb">
		<p class="home"><a href="Home.jsp">Home</a></p>
		<p class="user"> <% out.println(session.getAttribute("username")); %> </p>


		<form action="purchaseConfirmationPage.jsp?pas=<%=pas%>&ticId=<%=ticId%>&cabin=<%=cabin%>" method="post">
		<table>
			<%
				for(int i=1;i<=cnt;i++){
			%>
			<tr>
				<td colspan="3"> <%=i%> Passanger Information</td>
			</tr>
			<tr>
				<td> Title</td>
				<td> Name</td>
				<td> Nationality</td>
			</tr>
			<tr>
				<td> 
					<select class="text" name="Title">
					   <option value=""></option>
					   <option value="Mr">Mr</option>
					   <option value="Mrs">Mrs</option>
					</select>
				</td>
				<td> <input type="text" name="Name"></td>
				<td>
					<select class="text" name="Nat">
					   <option value="">--Nationality--</option>
					    <option value="Indonesia">Indonesia</option>
					   <option value="Malaysia">Malaysia</option>
					   <option value="Singapore">Singapore</option>
					</select>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td>	
					<%
			        String error=request.getParameter("err");
			        if(error != null){
			            if(error.equals("1")){
			              out.println("Title must be filled");
			            }
			            else if(error.equals("2")){
			                out.print("Name cant be empty");
			            }
			             else if(error.equals("3")){
			                out.print("Nationality cant be empty");
			            }
			        }%>
				</td>
			</tr>
		</table>
				<input class="insert" type="submit" name="Purchase" value="Purchase Ticket">
		</form>
	

	</div>
</body>
</html>