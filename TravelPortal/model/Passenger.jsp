<%
	class Passenger{
		private int passengerID;
		private int transID;
		private String title;
		private String name;
		private String nationality;

	public Passenger(int passengerID,int transID,String title,String name,String nationality){
		this.passengerID=passengerID;
		this.transID=transID;
		this.title=title;
		this.name=name;
		this.nationality=nationality;
	}

	public int getPasID(){
		return passengerID;
	}
	public int getTransID(){
		return transID;
	}
	public String getTitle(){
		return title;
	}
	public String getName(){
		return name;
	}
	public String getNationality(){
		return nationality;
	}
}
%>