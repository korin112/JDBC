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
String sql="select * from room order by roomcode";
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
				<th>객실코드</th>
				<th>객실명</th>
				<th>객실타입</th>
				<th>숙박가능인원</th>
				<th>숙박비</th>
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
		int rcode=rs.getInt("roomcode");
		String rname=rs.getString("name");
		int rtype=rs.getInt("type");
		int howmany=rs.getInt("howmany");
		int howmuch=rs.getInt("howmuch");
		
	out.println("<tr><td>"+rcode+"</td><td>"+rname+"</td><td>"+rtype+"</td><td>"+howmany+"</td><td>"+howmuch+"</td></tr");
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
	<form method="GET" action="" id=frmRoom>

		<table>
			<tr>
				<td>객실코드 :<input type=number id=rcode name=rcode></td>
			</tr>
			<tr>
				<td>객실명 :<input type=text id=rname name=rname></td>
			</tr>
			<tr>
				<td>객실타입 :<input type=number id=rtype name=rtype></td>
			</tr>
			<tr>
				<td>숙박가능인원 :<input type=number id=howmany name=howmany></td>
			</tr>
			<tr>
				<td>숙박비 :<input type=number id=howmuch name=howmuch></td>
			</tr>
			<tr>
				<td><input type=submit value='전송'> &nbsp;&nbsp; <input
					type=reset value='비우기'></td>
			</tr>
		</table>
	</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
	$(document)
	.on('submit', '#frmRoom', function() {
		if ($('#rcode').val()=='' &&	
			$('#rname').val()!='' &&
			$('#rtype').val()!='' &&
			$('#howmany').val()!='' &&
			$('#howmuch').val()!='') { 
		$('#frmRoom').prop('action','insert.jsp');
		}  else{
				if($('#rname').val()=='' &&
					$('#rtype').val()=='' &&
					$('#howmany').val()=='' &&
					$('#howmuch').val()==''){
				$('#frmRoom').prop('action','delete.jsp');
				}
				if($('#rname').val()!='' &&
					$('#rtype').val()!='' &&
					$('#howmany').val()!='' &&
					$('#howmuch').val()!=''){
				$('#frmRoom').prop('action','update.jsp');
				}	
			}
		return true;
	});
</script>
</html>







