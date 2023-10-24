package exception;

class R implements AutoCloseable {
	String resource;

	R(String resource) {
		this.resource = resource;
	}

	@Override
	public void close() throws Exception {
		if (resource != null) {
			resource = null;
			System.out.println("리소스가 해제되었습니다");
		}
	}
}

public class TryWithResource3 {
	public static void main(String[] args) {
		// 1. 리소스를 사용하고 finally에서 리소스 수동 해제하기
		R a1 = null;
		try {
			a1 = new R("특정 파일");
		} catch (Exception e) {
			System.out.println("예외 처리");
		} finally {
			// 리소스 수동 해제
			if (a1.resource != null) {
				try {
					a1.close();
				}
				catch (Exception e) {}
			}
		}

		// 2. 리소스 자동 해제
		try (R a2 = new R("특정 파일")) {}
		catch (Exception e) {
			System.out.println("예외 처리");
		}
	}
}
