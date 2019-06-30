<%
	class Trans{
		private int transID;
		private int userID;
		private String invoice;
		private String transDate;
		private String status;

	public Trans(int transID,int userID,String invoice,String transDate,String status){
		this.transID=transID;
		this.userID=userID;
		this.invoice=invoice;
		this.transDate=transDate;
		this.status=status;
	}

	public int getID(){
		return transID;
	}
	public int getUserID(){
		return userID;
	}
	public String getInvoice(){
		return invoice;
	}
	public String getTransDate(){
		return transDate;
	}
	public String getStatus(){
		return status;
	}
}
%>