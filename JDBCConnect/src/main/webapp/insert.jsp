<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection conn=null;
PreparedStatement pstmt=null;


String url="jdbc:oracle:thin:@localhost:1521:orcl";	/* 다른사람 db접속하려면 @뒤에 IP주소 넣으면 됨 */
String userid="ora_user";
String passcode="human123";
// String sql="insert into student values('steve rogers',98,88)";
// insert.jsp?name=asdf&math=100&korean=10 -> request.getParameter로 ㄱㄱ
String sql="insert into student values(?,?,?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	if(request.getParameter("name")==null || 
	   request.getParameter("math")==null ||
	   request.getParameter("korean")==null){
		out.println("적절한 값이 주어지지 않았습니다.");
		return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");	//driver(ojdbc6.jar)
	conn=DriverManager.getConnection(url,userid,passcode); // db접속 실패하면 null뜸
	pstmt=conn.prepareStatement(sql);
	// insert.jsp?name=asdf&math=100&korean=10 -> request.getParameter로 ㄱㄱ
	pstmt.setString(1,request.getParameter("name"));
	pstmt.setInt(2,Integer.parseInt(request.getParameter("math")));
	pstmt.setInt(3,Integer.parseInt(request.getParameter("korean")));
	//insert into student values('Jefferson',100,20) 으로 변환되서 들어감
	pstmt.executeUpdate();
} catch(Exception e){
	e.printStackTrace();
} finally{
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	request.getRequestDispatcher("view_student.jsp").forward(request,response);
}
%>
</body>
</html>