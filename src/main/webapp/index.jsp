

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Library Managment</title>
    <link rel="icon" type="image/x-icon" href="" />
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
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top">
            <img src="logoo.png" width="200%" height="200%" alt="LOGO" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a href="addstudentform.jsp">Add student</a></li>
                <li class="nav-item"><a href="viewstudents.jsp">View students</a></li>
                <li class="nav-item"><a href="addbookform.jsp">Add book</a></li>
                <li class="nav-item"><a href="viewbooks.jsp">View books</a></li>
                <li class="nav-item"> <a href="showStudentsLoaning.jsp">view loans</a></li>
                <li class="nav-item"><a href="logOut.jsp">Log out</a></li>
                </ul>
        </div>
    </div>
</nav>
<!-- Masthead-->
<header class="masthead " >
    <div class="container" id="top">
        <div class="masthead-subheading">WELCOME ${username} !</div>
        <div class="masthead-heading text-uppercase">Library Managment System</div>
    </div>
</header>
</body>

</html>
