<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    String id = request.getParameter("id");
    String deleteId = request.getParameter("deleteId");
    String role=request.getParameter("role");

    if(id != null){

        /*kondisi update*/
        try{
            int userId = Integer.parseInt(id);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            out.println(name);
            if(name.isEmpty()){
                response.sendRedirect("../updateUserPage.jsp?err=1&id="+id+"");
            }
            else if(email.isEmpty() && email.length()<4){
                response.sendRedirect("../updateUserPage.jsp?err=2&id="+id+"");
            }
            else if(password.isEmpty()){
                response.sendRedirect("../updateUserPage.jsp?err=3&id="+id+"");
            }
            else if(gender==null){
                response.sendRedirect("../updateUserPage.jsp?err=4&id="+id+"");
            }

            int a = st.executeUpdate("UPDATE msuser SET name = '"+name+"',email = '"+email+"',password = '"+password+"',gender = '"+gender+"' WHERE userID = '"+userId+"' ");
                if(role==null){
                    response.sendRedirect("../DashboardPage.jsp");
                }
                else{
                    response.sendRedirect("../Home.jsp?err=19");
                }
   
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(deleteId != null){
        try{
            int userID = Integer.parseInt(deleteId);
            String query="DELETE FROM msuser WHERE userID=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1,userID);
            stmt.executeUpdate();
            response.sendRedirect("../DashboardPage.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else{
        try{
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");

            if(name.isEmpty()){
                response.sendRedirect("../insertUserPage.jsp?err=1");
            }
            else if(email.isEmpty() && email.length()<4){
                response.sendRedirect("../insertUserPage.jsp?err=2");
            }
            else if(password.isEmpty()){
                response.sendRedirect("../insertUserPage.jsp?err=3");
            }
            else if(gender==null){
                response.sendRedirect("../insertUserPage.jsp?err=4");
            }
            else{
                int a = st.executeUpdate("INSERT INTO msuser VALUES(null,'"+name+"', '"+email+"', '"+password+"', '"+gender+"', 'User')");
                response.sendRedirect("../DashboardPage.jsp?err=1");
            }
            

        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    
%>