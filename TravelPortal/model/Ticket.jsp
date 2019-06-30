<%@ page import="java.io.*, java.util.*, java.text.*" %>
<%@ page import="java.io.*, java.sql.*, java.text.*" %>
<%@ page import="java.io.*, java.util.Date, java.text.*" %>
<%
	class Ticket{
		private int id;
		private String airline;
		private String fromLoc;
		private String toLoc;
		private String departDate;
		private int ecoPrice;
		private int busPrice;
		private int avaSeat;

		Ticket(int id,String airline,String fromLoc,String toLoc,String departDate,int ecoPrice,int busPrice,int avaSeat){
			this.id=id;
			this.airline=airline;
			this.fromLoc=fromLoc;
			this.toLoc=toLoc;
			this.departDate=departDate;
			this.ecoPrice=ecoPrice;
			this.busPrice=busPrice;
			this.avaSeat=avaSeat;
		}
			
		public int getId(){
			return this.id;
		}
		public String getAirline(){
			return this.airline;
		}
		public String getFromLoc(){
			return this.fromLoc;
		}
		public String getToLoc(){
			return this.toLoc;
		}
		public String getDepartDate(){
			return this.departDate;
		}
		public int getEcoPrice(){
			return this.ecoPrice;
		}
		public int getBusPrice(){
			return this.busPrice;
		}
		public int getAvaSeat(){
			return this.avaSeat;
		}
	}

%>