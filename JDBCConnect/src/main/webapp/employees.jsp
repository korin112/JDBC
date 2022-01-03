<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

String url="jdbc:oracle:thin:@localhost:1521:orcl";	/* 다른사람 db접속하려면 @뒤에 IP주소 넣으면 됨 */
String userid="ora_user";
String passcode="human123";
String sql="select b.department_id as did, b.department_name as dname, a.emp_name as ename, c.department_name as dname1 "+
"from employees a, departments b, departments c "+
"where b.manager_id=a.employee_id(+) and b.parent_id=c.department_id(+)";

%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Employees</title>
</head>
<body>
<style>
	table{
		border-collapse:collapse;		
	}
	td{
		border:2px solid black;
	}
	*{
		font-family: 'Gowun Batang', serif;
	}
</style>
<table>
<tr>
	<th>부서이름</th>
	<th>부서아이디</th>
	<th>사원명</th>
	<th>상위부서</th>
</tr><!-- <th>매니저사번</th><th>부서아이디</th><th>직위아이디</th> --></tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");	//driver(ojdbc6.jar)
	conn=DriverManager.getConnection(url,userid,passcode); // db접속 실패하면 null뜸
	stmt=conn.createStatement(); //SQL문을 넣을 곳을 만들어라
	rs=stmt.executeQuery(sql);	// SQL문 실행 결과를 rs에 담아라
	while(rs.next()){		
		String dname=rs.getString("dname");
		int did=rs.getInt("did");
		String ename=rs.getString("ename");
		String dname1=rs.getString("dname1");
%>
		<tr>
			<td><%=dname %></td>
			<td><%=did%></td>
			<td><%=ename %></td>
			<td><%=dname1%></td>
		</tr>
<%	}
} catch(Exception e){
	e.printStackTrace();
} finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</table>
</body>
</html>