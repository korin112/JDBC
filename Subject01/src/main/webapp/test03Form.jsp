<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page session="true"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>로그인 폼</h1>
<hr>
<body>
<form method=post action="test03Pro.jsp">
		<table>
			<tr>
				<td>아이디 : </td>
				<td><input type=text name=idname id=idname></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type=password name=password id=password></td>
			</tr>
			<tr>
				<td align=left>	<input type=submit value='로그인'></td>
				<td align=left>	<input type=reset value='취소'></td>
			</tr>
		</table>
	</form>
	
</body>

</html>