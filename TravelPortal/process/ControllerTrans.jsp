<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%@ include file = ".././model/Trans.jsp" %>
<%@ include file = ".././model/Ticket.jsp" %>
<%@ include file = ".././model/User.jsp" %>

<%
    String id = request.getParameter("pid");  //update Trans
    String deleteId = request.getParameter("deleteId"); //delete trans
    String transid = request.getParameter("tid"); //delete trans 
    String pas=request.getParameter("pas"); //jmlh passenger
    String ticId=request.getParameter("ticId");//ticket id untuk dpt depart date
    String appId=request.getParameter("appId");//approve
    String rejId=request.getParameter("rejId");//reject

    if(id!=null){
        try{
            int pasId = Integer.parseInt(id);
            int tID = Integer.parseInt(transid);
            String query="DELETE FROM trpassenger WHERE passengerID=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1,pasId);
            stmt.executeUpdate();

            response.sendRedirect("../updateTransPage.jsp?id="+tID+"");
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(deleteId != null){
        try{
            int transID = Integer.parseInt(deleteId);
            String status="Canceled";
            
            int a = st.executeUpdate("UPDATE mstransaction SET status='"+status+"' WHERE transID = '"+transID+"' ");
            response.sendRedirect("../DashboardPageTrans.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(appId != null){
        try{
            int transID = Integer.parseInt(appId);
            String status="Approved";
            
            int a = st.executeUpdate("UPDATE mstransaction SET status='"+status+"' WHERE transID = '"+transID+"' ");
            response.sendRedirect("../DashboardPageTrans.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(rejId != null){
        try{
            int transID = Integer.parseInt(rejId);
            String status="Rejected";
            
            int a = st.executeUpdate("UPDATE mstransaction SET status='"+status+"' WHERE transID = '"+transID+"' ");
            response.sendRedirect("../DashboardPageTrans.jsp");
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else if(ticId!=null){
        try{
            int tID=Integer.parseInt(ticId);
            Random rand=new Random();
            int a=rand.nextInt(90000) + 10000;
            String invoice="INV/20181219/"+Integer.toString(a);
            String name=(String)session.getAttribute("username");

            String queryName="SELECT * FROM msuser WHERE name='"+name+"' ";
            ResultSet rs=st.executeQuery(queryName);
            int userId=0;
            if(rs.next()){
                userId=rs.getInt(1);
            }

            String queryTicket="SELECT * FROM msticket WHERE ticketID="+tID+" ";
            rs=st.executeQuery(queryTicket);
            String date="";
            if(rs.next()){
                date=rs.getString(5);
            }

            int b = st.executeUpdate("INSERT INTO mstransaction VALUES(null,"+userId+", '"+invoice+"', '"+date+"', 'Pending')");

            int pass=Integer.parseInt(pas);
            String[] title=request.getParameterValues("Title");
            String[] namepas=request.getParameterValues("Name");
            String[] nat=request.getParameterValues("Nat");

            String queryTrans="select transID from mstransaction order by transID desc limit 1";
            rs=st.executeQuery(queryTrans);
            int transID=0;
            if(rs.next()){
                transID=rs.getInt(1);
            }  

            String queryInsert="INSERT INTO trpassenger VALUES(null,?,?,?, ?)";
            for(int i=0;i<pass;i++){
                PreparedStatement stmt=con.prepareStatement(queryInsert);
                stmt.setInt(1,transID);
                stmt.setString(2,title[i]);
                stmt.setString(3,namepas[i]);
                stmt.setString(4,nat[i]);
                stmt.executeUpdate(); 
            }

            out.println(transID);
            response.sendRedirect("../Home.jsp");

        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    
%>
