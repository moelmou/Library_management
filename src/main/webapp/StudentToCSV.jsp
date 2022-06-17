
<%@ page import="com.javatpoint.dao.StudentDao" %>

<%
    StudentDao.toCSV();
    response.sendRedirect("viewstudents.jsp");
%>