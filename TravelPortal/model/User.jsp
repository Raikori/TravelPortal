<%
    class User{
        private int id;
        private String name;
        private String password;
        private String email;
        private String gender;
        

        User(int id,String name,String email,String password,String gender){
            this.id = id;
            this.name = name;
            this.password = password;
            this.gender=gender;
            this.email=email;
        }

        int getId(){
            return this.id;
        }

        String getName(){
            return this.name;
        }

        String getEmail(){
            return this.email;
        }

        String getGender(){
            return this.gender;
        }

        String getPassword(){
            return this.password;
        }
    }
%>