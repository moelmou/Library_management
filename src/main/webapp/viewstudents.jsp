
<%@page import="com.javatpoint.dao.StudentDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View Students</title>
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="styles.css" rel="stylesheet" /></head>
<body>
<%
  response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  if(session.getAttribute("username")==null){
    response.sendRedirect("logIN.jsp");}
%>

<h1>Students List</h1>

<%
  List<Student> list= StudentDao.getAllRecords();
    request.setAttribute("list",list);
%>

<table class="table" >
  <thead class="thead-light">
  <tr>
    <th>CIN</th>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Filiere</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  </thead>
  <c:forEach items="${list}" var="u">
    <tr><td>${u.getCIN()}</td><td>${u.getNom()}</td><td>${u.getPrenom()}</td><td>${u.getFiliere()}</td>
      <td><a href="editform.jsp?CIN=${u.getCIN()}">Edit</a></td>
      <td><a href="deletestudent.jsp?CIN=${u.getCIN()}">Delete</a></td></tr>
  </c:forEach>
</table>
<br/>
<div>
  <a class="btn btn-primary"  href="addstudentform.jsp">Add New Student</a>
  <a class="btn btn-secondary"  href="StudentToCSV.jsp">Export</a>
  <a class="btn btn-secondary"  href="index.jsp">Home</a>

</div>


</body>
</html>