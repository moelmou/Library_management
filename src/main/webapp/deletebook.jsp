<%@ page import="com.javatpoint.dao.BookDao" %>
<%@ page import="com.javatpoint.bean.Book" %>

<%
    String Id =request.getParameter("Id");
    Book u= BookDao.getRecordById(Integer.parseInt(Id));
%>
<%
    BookDao.delete(u);
    response.sendRedirect("viewbooks.jsp");
%>