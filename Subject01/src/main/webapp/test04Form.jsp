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
<form  method=post action="test04Pro.jsp">
<table>
			<tr>
				<td>회원 아이디 : </td>
				<td><input type=text name=id id=id></td>
			</tr>
			<tr>
				<td>회원 이름 : </td>
				<td><input type=text name=name id=name></td>
			</tr>
			<tr>
				<td>회원 나이 : </td>
				<td><input type=text name=age id=age></td>
			</tr>
			<tr>
				<td>회원 전화번호 : </td>
				<td><input type=text name=tel id=tel></td>
			</tr>
			<tr>
				<td align=left>	<input type=submit value='회원가입'></td>
			</tr>
		</table>
</form>
</body>

</html>