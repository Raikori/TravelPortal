<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<%@ include file = "connect.jsp" %>

<%
    String id = request.getParameter("id");
    String deleteId = request.getParameter("deleteId");

    if(id != null){

        /*kondisi update*/
        try{
            int ticketID= Integer.parseInt(id);
            out.println(id);
            out.println("asd");
            String airline = request.getParameter("airline");
            String fromLoc = request.getParameter("fromLoc");
            String toLoc = request.getParameter("toLoc");
            String depDate = request.getParameter("depDate");
            String ecoPrice = request.getParameter("ecoPrice");
            String busPrice = request.getParameter("busPrice");
            String avaSeat = request.getParameter("avaSeat");
            
            boolean numericeco = ecoPrice.matches("-?\\d+(\\.\\d+)?");
            boolean numericbus = busPrice.matches("-?\\d+(\\.\\d+)?");
            boolean numericava = avaSeat.matches("-?\\d+(\\.\\d+)?");
            if(airline.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=1&id="+ticketID+"");
            }
            else if(fromLoc.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=2&id="+ticketID+"");
            }
            else if(toLoc.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=3&id="+ticketID+"");
            }
            else if(numericeco==false){
                response.sendRedirect("../insertTicketPage.jsp?err=4&id="+ticketID+"");
            }
            else if(numericbus==false){
                response.sendRedirect("../insertTicketPage.jsp?err=5&id="+ticketID+"");
            }
            else if(depDate.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=6&id="+ticketID+"");
            }
            else if(numericava==false){
                response.sendRedirect("../insertTicketPage.jsp?err=7&id="+ticketID+"");
            }
            else{
                 int a = st.executeUpdate("UPDATE msticket SET airline = '"+airline+"',fromLoc = '"+fromLoc+"' ,toLoc = '"+toLoc+"',departDate = '"+depDate+"',economyPrice = '"+ecoPrice+"',businessPrice = '"+busPrice+"',availSeat = '"+avaSeat+"' WHERE ticketID = '"+ticketID+"' ");
                response.sendRedirect("../DashboardPageTicket.jsp?err=1");
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(deleteId != null){
        try{
            int ticketID = Integer.parseInt(deleteId);
            String query="DELETE FROM msticket WHERE ticketID=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1,ticketID);
            stmt.executeUpdate();
            response.sendRedirect("../DashboardPageTicket.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else{
        try{
            String airline = request.getParameter("airline");
            String fromLoc = request.getParameter("fromLoc");
            String toLoc = request.getParameter("toLoc");
            String depDate = request.getParameter("depDate");
            String ecoPrice = request.getParameter("ecoPrice");
            String busPrice = request.getParameter("busPrice");
            String avaSeat = request.getParameter("avaSeat");

            boolean numericeco = ecoPrice.matches("-?\\d+(\\.\\d+)?");
            boolean numericbus = busPrice.matches("-?\\d+(\\.\\d+)?");
            boolean numericava = avaSeat.matches("-?\\d+(\\.\\d+)?");
            
            if(airline.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=1");
            }
            else if(fromLoc.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=2");
            }
            else if(toLoc.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=3");
            }
            else if(numericeco==false){
                response.sendRedirect("../insertTicketPage.jsp?err=4");
            }
            else if(numericbus==false){
                response.sendRedirect("../insertTicketPage.jsp?err=5");
            }
            else if(depDate.isEmpty()){
                response.sendRedirect("../insertTicketPage.jsp?err=6");
            }
            else if(numericava==false){
                response.sendRedirect("../insertTicketPage.jsp?err=7");
            }
            else{
                int a = st.executeUpdate("INSERT INTO msticket VALUES(null,'"+airline+"', '"+fromLoc+"', '"+toLoc+"', '"+depDate+"', '"+ecoPrice+"','"+busPrice+"','"+avaSeat+"')");
                response.sendRedirect("../DashboardPageTicket.jsp?err=1");
            }
            

        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    
%>