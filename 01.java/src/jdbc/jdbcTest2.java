package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class jdbcTest2 {
	public static void main(String[] args) {
		String sql = """
				SELECT 	employee_id, last_name, salary
				FROM 	employees
				""";
		
		// try with resources 이용하여 sql문 불러오기
		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ACE", "ACE");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);){
			
			while(rs.next()){
				System.out.print(rs.getInt("employee_id") + '\t');
				System.out.print(rs.getString("last_name") + '\t');
				System.out.print(rs.getLong("salary"));
				System.out.println();
			}
		} catch (Exception e) {
			System.out.println("실패:" + e.getMessage());
		}
		System.out.println("종료");
	}
}
