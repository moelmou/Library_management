<%@ page import="com.javatpoint.dao.BookDao" %>

<%
    BookDao.toCSV();
    response.sendRedirect("viewbooks.jsp");
%>