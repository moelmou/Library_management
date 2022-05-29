<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View Books</title>
</head>
<body>

<%@page import="com.javatpoint.dao.BookDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Books List</h1>

<%
  List<Book> list= BookDao.getAllRecords();
  request.setAttribute("list",list);
%>

<table border="1" width="90%">
    <tr><th>Titre</th><th>Num. Edition</th><th>Date</th><th>Stock</th><th>Edit</th><th>Delete</th></tr>
  <c:forEach items="${list}" var="u">
    <tr><td>${u.getTitre()}</td><td>${u.getNumero_edition()}</td><td>${u.getDate()}</td><td>${u.getStock()}</td>
      <td><a href="editformB.jsp?Id=${u.getId()}">Edit</a></td>
      <td><a href="deletebook.jsp?Id=${u.getId()}">Delete</a></td></tr>
  </c:forEach>
</table>
<br/><a href="addbookform.jsp">Add New Book</a>

</body>
</html>