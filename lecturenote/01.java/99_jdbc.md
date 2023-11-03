### JDBC 연결하고 Java에서 쿼리문 실행하기

- `C:\app\um_se\product\21c\dbhomeXE\jdbc\lib` 경로의 `ojdbc11.jar` 파일을 라이브러리에 추가
- 선언
    - Connection
        - `Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ACE", "ACE");`
    - Statement
        - `Statement stmt = conn.createStatement();`
        - PreparedStatement
            - 쿼리문을 미리 던져놓게 됨
    - ResultSet
        - `ResultSet rs = stmt.executeQuery(sql);`
- 쿼리문 결과 가져오기
    - `rs.next()`
    - `rs.getInt("employee_id")`

```java
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
```

- 다이나믹 쿼리
    - 문자열로 쿼리문을 넘김
- 파라미터 쿼리
    - 나중에 변수만 처리하도록 함
    - 쿼리 작성이 용이함
    - 모든 사용자가 반복해서 사용할 것이기 때문에 성능 향상
    - 무조건 파라미터 쿼리가 보안에 유리함 (SQL Injection)
        
        ```java
        String sql = """
        				SELECT 	userid, name
        				FROM 	members
        				WHERE	userid = ? AND userpw = ? """;
        ```