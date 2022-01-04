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
String sql="update room set name=?,type=?,howmany=?,howmuch=? where roomcode=?";

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
	
	Class.forName("oracle.jdbc.driver.OracleDriver");	//driver(ojdbc6.jar)
	conn=DriverManager.getConnection(url,userid,passcode); // db접속 실패하면 null뜸
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(5,request.getParameter("rcode"));
	pstmt.setInt(2,Integer.parseInt(request.getParameter("rtype")));
	pstmt.setInt(3,Integer.parseInt(request.getParameter("howmany")));
	pstmt.setInt(4,Integer.parseInt(request.getParameter("howmuch")));
	pstmt.setString(1,request.getParameter("rname"));
	
		pstmt.executeUpdate();
} catch(Exception e){
	e.printStackTrace();
} finally{
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	response.sendRedirect("controlroom.jsp");
}
%>
</body>
</html>