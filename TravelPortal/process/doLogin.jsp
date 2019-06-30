<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    try{
        String Email=request.getParameter("Email");
        String Password=request.getParameter("Password");
        String Remember=request.getParameter("Remember");
        int online=0;

        if(Email.equals("") && !Email.matches("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b")){
           response.sendRedirect("../loginPage.jsp?err=1");
        }
        else if(Password.equals("")){
            response.sendRedirect("../loginPage.jsp?err=1");
        }
        else{
            String query="SELECT * FROM msuser WHERE email='"+Email+"' AND password='"+Password+"'"; 
            ResultSet rs= st.executeQuery(query);

            if(rs.next()){
                int userID=rs.getInt(1);
                String usernames=rs.getString(2);
                String role=rs.getString(6);

                if(application.getAttribute("online")==null){
                    online=0;
                }
                else{
                    online=(Integer) application.getAttribute("online");
                }

                if(Remember!=null)
                {
                    Cookie newCookie=new Cookie("username",Email);
                    newCookie.setMaxAge(300);
                    newCookie.setPath("/");
                    response.addCookie(newCookie);
                }

                if(role.equals("Admin")){
                    response.sendRedirect("../DashboardPage.jsp");
                }
                else{
                    response.sendRedirect("../Home.jsp");
                }

                online++;
                application.setAttribute("online",online);

                session.setAttribute("username",usernames);
                session.setAttribute("userID",userID);
                session.setAttribute("role",role);
            }
            else{
                response.sendRedirect("../loginPage.jsp?err=2");
            }

        }
    }
    catch(Exception e){
        System.out.println(e);
    }
%>