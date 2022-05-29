<%@ page import="com.javatpoint.dao.BookDao" %>
<jsp:useBean id="u" class="com.javatpoint.bean.Book"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
  int i= BookDao.save(u);
  if(i>0){
    response.sendRedirect("addbook-success.jsp");
  }else{
    response.sendRedirect("addbook-error.jsp");
  }
%>