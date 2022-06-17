<%@ page import="com.javatpoint.bean.Loan" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.javatpoint.dao.loanDao" %>

<%
    Loan lo1=new Loan();
    lo1.setLivNum(Integer.parseInt(request.getParameter("id")));
    String CIN =request.getParameter("cin");
    lo1.setEtuNum(CIN);
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    LocalDateTime now = LocalDateTime.now();
    lo1.setDateEmprunt(dtf.format(now));
%>

<%
    int i= loanDao.save(lo1);
        response.sendRedirect("index.jsp");
%>