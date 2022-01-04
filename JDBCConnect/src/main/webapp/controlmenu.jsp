<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
String url="jdbc:oracle:thin:@localhost:1521:orcl";	/* 다른사람 db접속하려면 @뒤에 IP주소 넣으면 됨 */
String userid="ora_user";
String passcode="human123";
String sql="select * from menu";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	border-collapse: collapse;
}

td, th {
	border: 2px solid black;
}
</style>
<body>
	<table>
		<thead>
			<tr>
				<th>메뉴명</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");	//driver(ojdbc6.jar)
	conn=DriverManager.getConnection(url,userid,passcode); // db접속 실패하면 null뜸
	stmt=conn.createStatement(); //SQL문을 넣을 곳을 만들어라
	rs=stmt.executeQuery(sql);	// SQL문 실행 결과를 rs에 담아라
	while(rs.next()){		
		String name=rs.getString("name");
		int price=rs.getInt("price");
		
	out.println("<tr><td>"+name+"</td><td>"+price+"</td></tr");
	}
}	catch(Exception e){
	e.printStackTrace();
} finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<form method="GET" action="" id=frmMenu>

		<table>
			<tr>
				<td>현재메뉴명 :<input type=text id=name name=name></td>
			</tr>
			<tr>
				<td>메뉴명 :<input type=text id=newname name=newname></td>
			</tr>
			<tr>
				<td>가격 :<input type=number id=price name=price></td>
			</tr>
			<tr>
				<td><input type=submit value='전송'> &nbsp; <input
					type=reset value='비우기'></td>
			</tr>
		</table>
	</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
	$(document)
	.on('submit', '#frmMenu', function() {
		if ($('#name').val() != '') { //update or delete
			if ($('#newname').val() != '') { //update
				$('#frmMenu').prop('action', 'update.jsp');
				//action="update.jsp"
			} else { //delete
				//action="delete.jsp"
				$('#frmMenu').prop('action', 'delete.jsp');
			}
		} else {
			if ($('#newname').val() != '' && $('#price').val() != '') { // just insert
				$('#frmMenu').prop('action', 'addmenu.jsp');
				//action="addmenu.jsp"
			} else {
				alert('메뉴명과 가격이 모두 입력되어야 합니다.');
				return false; //submit 중단
			}
		}
		return true;
	});
</script>
</html>







