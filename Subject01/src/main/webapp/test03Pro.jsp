<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
<%
session.setAttribute("idname1",request.getParameter("idname"));
session.setAttribute("password1",request.getParameter("password"));
response.sendRedirect("test03Pro02.jsp");
%>


</script>
</html>