<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>원의 면적/원의 둘레를 계산합니다.</h1>
<hr>
<body>
<%request.setCharacterEncoding("UTF-8");	response.setContentType("text/html; charset=UTF-8");%>
<%	double pi=Math.PI;
	String a=request.getParameter("insertId");
	double b=Double.parseDouble(a);
%>
반지름 :	<%=a%><br>
원의 면적 : <%=Math.pow(b*pi,2) %>	<br>
원의 둘레 :	<%=2*pi*b %>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>


</script>
</html>
<!-- 면적 (pi*r)^2 -->
<!-- 둘레 2*pi*r -->
<!-- r = 반지름 -->