<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Form</title>
</head>
<body>
<%@page import="com.javatpoint.dao.BookDao,com.javatpoint.bean.Book"%>


<%
    String Id =request.getParameter("Id");
    Book u= BookDao.getRecordById(Integer.parseInt(Id));
%>

<h1>Edit Form</h1>
<form action="editbook.jsp" method="post">
    <table>
            <input type="hidden" name="Id" value="<%= u.getId()%>"/></td></tr>
        <tr><td>Titre:</td><td>
            <input type="text" name="titre" value="<%= u.getTitre()%>"/></td></tr>
        <tr><td>N. edition:</td><td>
            <input type="text" name="numero_edition" value="<%= u.getNumero_edition()%>"/></td></tr>
        <tr><td>Date:</td><td>
            <input type="text" name="date" value="<%= u.getDate()%>"/></td></tr>
        <tr><td>Stock:</td><td>
            <input type="text" name="stock" value="<%= u.getStock()%>"/></td></tr>
        </td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Book"/></td></tr>
    </table>
</form>

</body>
</html>