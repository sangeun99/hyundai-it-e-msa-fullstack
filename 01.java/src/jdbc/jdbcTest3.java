package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jdbcTest3 {
	public static void main(String[] args) {
		// prepareStatement 이용하기
		String sql = """
				SELECT 	employee_id, last_name, salary
				FROM 	employees
				WHERE	department_id >= ?
				""";

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ACE", "ACE");
				PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, 80);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					System.out.print(rs.getInt("employee_id") + '\t');
					System.out.print(rs.getString("last_name") + '\t');
					System.out.print(rs.getLong("salary"));
					System.out.println();
				}
			}
		} catch (Exception e) {
			System.out.println("실패:" + e.getMessage());
		}
		System.out.println("종료");
	}
}
