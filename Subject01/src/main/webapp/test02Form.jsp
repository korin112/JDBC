<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>회원 입력 폼</h1>
<hr>
<body>
<form method=post action="test02Pro.jsp">
		<table>
			<tr>
				<td>이름 : </td>
				<td><input type=text name=name id=name></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type=text name=age id=age></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td><input type=text name=tel id=tel></td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td><input type=text name=add id=add></td>
			</tr>
			<tr>
				<td align=left>	<input type=submit value='입력완료'></td>
			</tr>
		</table>
	</form>
</body>
</html>