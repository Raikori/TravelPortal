<%
	class City{
		private int id;
		private String name;
		private String country;

		City(int id,String name,String country){
			this.id=id;
			this.name=name;
			this.country=country;
		}

		int getId(){
			return this.id;
		}
		String getName(){
			return this.name;
		}
		String getCountry(){
			return this.country;
		}
	}

%>