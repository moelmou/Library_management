
<%@ page import="com.javatpoint.dao.loanDao" %>

<%
    int Id =Integer.parseInt(request.getParameter("Id"));
    String CIN =request.getParameter("CIN");
    loanDao.returnById(Id,CIN);
    response.sendRedirect("index.jsp");
    %>