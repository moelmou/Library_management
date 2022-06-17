<%@page import="com.javatpoint.bean.*,java.util.*"%>
<%@ page import="com.javatpoint.dao.loanDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
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
<%
    String CIN =request.getParameter("CIN");
    List<Book> li= loanDao.getAllLoanedByIDRecords(CIN) ;
    request.setAttribute("li",li);
    request.setAttribute("CIN",CIN);
%>

<h1>Books List</h1>
<table class="table" >
    <thead class="thead-light">
    <tr>
        <th>Titre</th>
        <th>Num. Edition</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <c:forEach items="${li}" var="u">
        <tr><td>${u.titre}</td><td>${u.numero_edition}</td><td>${u.date}</td>
            <td><a href="returnBook.jsp?Id=${u.id}&CIN=${CIN}">Return this book</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<div>
    <a class="btn btn-secondary"  href="index.jsp">Cancel</a>
</div>

</body>
</html>