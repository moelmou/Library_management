<%@page import="com.javatpoint.dao.BookDao" %>
<%@ page import="com.javatpoint.bean.Book" %>
<%
    Book u =  new Book();
    u.setId(Integer.parseInt(request.getParameter("Id")));
    u.setStock(Integer.parseInt(request.getParameter("stock")));
    u.setNumero_edition(Integer.parseInt(request.getParameter("numero_edition")));
    u.setDate(request.getParameter("date"));
    u.setTitre(request.getParameter("titre"));
    %>

<%
    int i= BookDao.update(u);
    response.sendRedirect("viewbooks.jsp");
%>