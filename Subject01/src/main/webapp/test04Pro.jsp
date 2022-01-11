<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%request.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=UTF-8");%>
<body>
<jsp:useBean id="Member" class="member.Member"/>
<jsp:setProperty name="Member" property="*"/>

<table>
			<tr>
				<td>회원 아이디 : </td>
				<td><jsp:getProperty property="id" name="Member"/> </td>
			</tr>
			<tr>
				<td>회원 이름 : </td>
				<td><jsp:getProperty property="name" name="Member"/> </td>
			</tr>
			<tr>
				<td>회원 나이 : </td>
				<td> <jsp:getProperty property="age" name="Member"/></td>
			</tr>
			<tr>
				<td>회원 전화번호 : </td>
				<td> <jsp:getProperty property="tel" name="Member"/></td>
			</tr>
		</table>


</body>
</html>