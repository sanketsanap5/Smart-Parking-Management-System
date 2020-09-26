<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="windowsup.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>

<%!All_Retriving_Methods m=new All_Retriving_Methods(); %>


						<% 
						int UnReadMessages=m.getUnRead_Messages((int) session.getAttribute("subscriber_id")); 
						if(UnReadMessages>0){
						%>
						<span class="badge" style="background-color: #5cb85c; color: #fff;"><%=UnReadMessages %></span>
						<%}
						%>

</body>
</html>