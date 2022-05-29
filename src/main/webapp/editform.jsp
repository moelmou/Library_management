<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Form</title>
</head>
<body>
<%@page import="com.javatpoint.dao.StudentDao,com.javatpoint.bean.Student"%>


<%
    String CIN =request.getParameter("CIN");
    Student u= StudentDao.getRecordByCIN(CIN);
%>

<h1>Edit Form</h1>
<form action="editstudent.jsp" method="post">
    <table>
        <tr><td>CIN:</td><td>
            <input type="text" name="CIN" value="<%= u.getCIN()%>"/></td></tr>
        <tr><td>Nom:</td><td>
            <input type="text" name="nom" value="<%= u.getNom()%>"/></td></tr>
        <tr><td>Prenom:</td><td>
            <input type="text" name="prenom" value="<%= u.getPrenom()%>"/></td></tr>
        <tr><td>Filière:</td><td>
            <input type="text" name="filiere" value="<%= u.getFiliere()%>"/></td></tr>
        </td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Student"/></td></tr>
    </table>
</form>

</body>
</html>