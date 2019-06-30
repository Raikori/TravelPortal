<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    String id = request.getParameter("id");
    String deleteId = request.getParameter("deleteId");

    if(id != null){

        try{
            int cityId = Integer.parseInt(id);
            String city = request.getParameter("City");
            String country = request.getParameter("Country");
            if(city.isEmpty()){
                response.sendRedirect("../updateCityPage.jsp?err=1&id="+id+"");
            }
            else if(country.isEmpty()){
                response.sendRedirect("../updateCityPage.jsp?err=2&id="+id+"");
            }
            int a = st.executeUpdate("UPDATE mscity SET cityname = '"+city+"',country = '"+country+"' WHERE cityID = '"+cityId+"' ");
            response.sendRedirect("../DashboardPageCity.jsp");
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(deleteId != null){
        //kondisi delete
        try{
            //parse karena deleteId dalam bntk string
            int cityID = Integer.parseInt(deleteId);
           
            //query delete
            String query="DELETE FROM mscity WHERE cityID=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1,cityID);
            stmt.executeUpdate();
            response.sendRedirect("../DashboardPageCity.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else{
        try{
            String city = request.getParameter("City");
            String country = request.getParameter("Country");

            if(city.isEmpty()){
                response.sendRedirect("../insertCityPage.jsp?err=1");
            }
            else if(country.isEmpty()){
                response.sendRedirect("../insertCityPage.jsp?err=2");
            }
            else{
                int a = st.executeUpdate("INSERT INTO mscity VALUES(null,'"+city+"', '"+country+"')");
                response.sendRedirect("../DashboardPageCity.jsp?err=1");
            }
            

        }
        catch(Exception e){
            System.out.println(e);
        }
    
    }
    
%>