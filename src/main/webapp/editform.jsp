<%@page import="com.javatpoint.dao.StudentDao,com.javatpoint.bean.Student"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
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








</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if(session.getAttribute("username")==null){
        response.sendRedirect("logIN.jsp");}
%>


<%
    String CIN =request.getParameter("CIN");
    Student u= StudentDao.getRecordByCIN(CIN);
%>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
<h1>Edit Form</h1>
<form class="login100-form validate-form" action="editstudent.jsp" method="post">
 <span class="login100-form-title p-b-26">
   	</span>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="CIN" name="CIN"  value="<%= u.getCIN()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="Nom" name="nom" value="<%= u.getNom()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="Prenom"  name="prenom" value="<%= u.getPrenom()%>"/></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input" >
        <input type="text"  placeholder="Filiere"   name="filiere" value="<%= u.getFiliere()%>"//></td></tr>
        <span class="focus-input100"></span>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button type="submit" class="login100-form-btn">
                Edit
            </button>
        </div>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn"><a class="login100-form-btn" href="viewstudents.jsp">Cancel</a>
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