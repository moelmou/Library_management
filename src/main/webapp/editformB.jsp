<%@page import="com.javatpoint.dao.BookDao,com.javatpoint.bean.Book"%>

<!DOCTYPE html>
<html>

<head><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Form</title>
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
    String Id =request.getParameter("Id");
    Book u= BookDao.getRecordById(Integer.parseInt(Id));
%>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
<h1>Edit Form</h1>
<form class="login100-form validate-form" action="editbook.jsp" method="post">
 <span class="login100-form-title p-b-26">
					</span>
    <div class="wrap-input100 validate-input" >
        <input type="hidden"  name="Id" value="<%= u.getId()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="Titre" name="titre" value="<%= u.getTitre()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>

    <div class="wrap-input100 validate-input" >
        <input type="text" placeholder="N. edition"  value="<%= u.getNumero_edition()%>" name="numero_edition"/></td></tr>
        <span class="focus-input100" ></span>
    </div>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="Date" name="date" value="<%= u.getDate()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input">
        <input type="text" placeholder="Stock" name="stock" value="<%= u.getStock()%>"/></td></tr>
        <span class="focus-input100" ></span>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button type="submit" class="login100-form-btn">
                edit
            </button>
        </div>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn"><a class="login100-form-btn" href="viewbooks.jsp">Cancel</a>
            </button>
        </div>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn"><a class="login100-form-btn" href="index.jsp">Home</a>
            </button>
        </div>
    </div>
    <div class="text-center p-t-115">
						<span class="txt1">

						</span>

        <a class="txt2" href="#">

        </a>
    </div>
</form>
        </div>
    </div>
</div>

</body>
</html>