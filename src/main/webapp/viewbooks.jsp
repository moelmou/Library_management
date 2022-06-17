<%@page import="com.javatpoint.dao.BookDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View Books</title>
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

<h1>Books List</h1>

<%
  List<Book> list= BookDao.getAllRecords();
  request.setAttribute("list",list);
%>


<table class="table" >
  <thead class="thead-light">
    <tr><th>Titre</th>
      <th>Num. Edition</th>
      <th>Date</th>
      <th>Stock</th>
      <th>Edit</th>
      <th>Loan</th>
      <th>Delete</th>
    </tr>
  </thead>
  <c:forEach items="${list}" var="u">
    <tr><td>${u.getTitre()}</td><td>${u.getNumero_edition()}</td><td>${u.getDate()}</td><td>${u.getStock()}</td>
      <td><a href="editformB.jsp?Id=${u.getId()}">Edit</a></td>
      <td><a href="loan.jsp?Id=${u.getId()}">Loan this book</a></td>
      <td><a href="deletebook.jsp?Id=${u.getId()}">Delete</a></td></tr>
  </c:forEach>
</table>
<br/>
<div>
  <a  href="addbookform.jsp" class="btn btn-primary"  >Add a New Book</a>
  <a  href="BookToCSV.jsp" class="btn btn-secondary">Export</a>
  <a class="btn btn-secondary"  href="index.jsp">Home</a>

</div>



</body>
</html>