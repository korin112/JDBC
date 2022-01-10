

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class selectSales
 */
@WebServlet("/selectSales")
public class selectSales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectSales() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String strReturn="";
		String url="jdbc:oracle:thin:@localhost:1521:orcl";	/* 다른사람 db접속하려면 @뒤에 IP주소 넣으면 됨 */
		String userid="ora_user";
		String passcode="human123";
		String sql="select a.code,a.name,sum(b.qty),sum(b.total) "
				+"from menu a,cafe_sales b "
				+"where a.code=b.menu_code group by a.code, a.name order by a.name";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	//driver(ojdbc6.jar)
			conn=DriverManager.getConnection(url,userid,passcode); // db접속 실패하면 null뜸
			stmt=conn.createStatement(); //SQL문을 넣을 곳을 만들어라
			rs=stmt.executeQuery(sql);	// SQL문 실행 결과를 rs에 담아라
			while(rs.next()){		
				if(!strReturn.equals("")) strReturn+=";";
				strReturn+=rs.getInt("code")+","+rs.getString("name")+","+
						   rs.getInt("sum(b.qty)")+","+rs.getInt("sum(b.total)");
						   
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		 finally{
			  try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
		      } catch (SQLException e) {
					e.printStackTrace();
			    }
		  }
		response.getWriter().print(strReturn);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
