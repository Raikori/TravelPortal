<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    try{
        String username=request.getParameter("Name");
        String password=request.getParameter("Pass");
        String confirm=request.getParameter("PassCons");
        String email=request.getParameter("Email");
        String gender=request.getParameter("Gender");

        if(username.isEmpty()){
            response.sendRedirect("../regisPage.jsp?err=1");
        }
        else if(!email.matches("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b") && email.length()<4){
            response.sendRedirect("../regisPage.jsp?err=2");
        }
        else if(password.isEmpty()){
            response.sendRedirect("../regisPage.jsp?err=3");
        }
        else if(!confirm.equals(password)){
            response.sendRedirect("../regisPage.jsp?err=4");
        }
        else if(gender==null){
            response.sendRedirect("../regisPage.jsp?err=5");
        }
        else{
            int a = st.executeUpdate("INSERT INTO msuser VALUES(null,'"+username+"', '"+email+"', '"+password+"', '"+gender+"', 'User')");
            response.sendRedirect("../Home.jsp");
        }
    }
    catch(Exception e){
        System.out.println(e);
    }
%>