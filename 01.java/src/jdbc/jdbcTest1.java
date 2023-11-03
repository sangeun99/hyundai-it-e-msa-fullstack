package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class jdbcTest1 {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = """
				SELECT 	employee_id, last_name, salary
				FROM 	employees
				""";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ACE", "ACE");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				System.out.print(rs.getInt("employee_id") + '\t');
				System.out.print(rs.getString("last_name") + '\t');
				System.out.print(rs.getLong("salary"));
				System.out.println();
			}
		} catch (Exception e) {
			System.out.println("실패:" + e.getMessage());
		} finally {
			if (rs != null) try {rs.close();} catch (Exception e) {}
			if (stmt != null) try {stmt.close();} catch (Exception e) {}
			if (conn != null) try {conn.close();} catch (Exception e) {}
		}
		System.out.println("종료");
	}
}
