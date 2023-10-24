package nested;

class G {
	I i = new H();
	void abc() {
		i.bcd();
	}
	class H implements I {
		public void bcd() {
			System.out.println("인스턴스 이너 클래스");
		}
	}	
}

interface I {
	public abstract void bcd();
}

public class AnonymousClass {
	public static void main(String[] args) {
		G g = new G();
		g.abc();
	}
}
