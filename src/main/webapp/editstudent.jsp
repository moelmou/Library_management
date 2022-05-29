<%@page import="com.javatpoint.dao.StudentDao"%>
<jsp:useBean id="u" class="com.javatpoint.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i=StudentDao.update(u);
    response.sendRedirect("viewstudents.jsp");
%>