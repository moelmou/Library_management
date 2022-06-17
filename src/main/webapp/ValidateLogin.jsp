<%@ page import="com.javatpoint.bean.users" %>
<
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
        String Admin=request.getParameter("username");
    String pass=request.getParameter("password");

    users user=new users(Admin,pass);
    if(user.verify()){
    session.setAttribute("username",Admin);
    response.sendRedirect("index.jsp");
    }
    else response.sendRedirect("logIN.jsp");

%>
