<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>회원 정보 확인</h1>
<hr>
<style>
table,td,tr{
	border-collapse:collapse;
	border:1px solid black;
}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	%>
<body>
<table>
			<tr>
				<td>이름 : </td>
				<td><%=request.getParameter("name") %></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><%=request.getParameter("age") %></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td><%=request.getParameter("tel") %></td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td><%=request.getParameter("add") %></td>
			</tr>
		</table>
</body>
</html>