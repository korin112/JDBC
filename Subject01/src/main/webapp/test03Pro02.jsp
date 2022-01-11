<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>로그인 확인</h1>
<hr>
<body>



아이디 :<%=session.getAttribute("idname1")%><br>
비밀번호 :<%=session.getAttribute("password1")%>
</body>
<script>
alert("<%=session.getAttribute("idname1")%>"+"님 환영합니다.");
</script>
</html>