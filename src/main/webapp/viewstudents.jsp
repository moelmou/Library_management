<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View Students</title>
</head>
<body>

<%@page import="com.javatpoint.dao.StudentDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Students List</h1>

<%
  List<Student> list= StudentDao.getAllRecords();
  request.setAttribute("list",list);
%>

<table border="1" width="90%">
  <tr><th>CIN</th><th>Nom</th><th>Prenom</th><th>Filière</th><th>Edit</th><th>Delete</th></tr>
  <c:forEach items="${list}" var="u">
    <tr><td>${u.getCIN()}</td><td>${u.getNom()}</td><td>${u.getPrenom()}</td><td>${u.getFiliere()}</td>
      <td><a href="editform.jsp?CIN=${u.getCIN()}">Edit</a></td>
      <td><a href="deletestudent.jsp?CIN=${u.getCIN()}">Delete</a></td></tr>
  </c:forEach>
</table>
<br/><a href="addstudentform.jsp">Add New Student</a>

</body>
</html>