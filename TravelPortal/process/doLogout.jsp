<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%
   session.invalidate();

   int online=(Integer) application.getAttribute("online");
   if(online !=0){
       online--;
       application.setAttribute("online",online);
   }

   Cookie [] cookies=request.getCookies();
   for(int i=0; i<cookies.length;i++){
       if(cookies[i].getName().equals("username")){
           cookies[i].setMaxAge(0);
           cookies[i].setPath("/");
           response.addCookie(cookies[i]);
           break;
       }
   }
   response.sendRedirect("../Home.jsp");
%>