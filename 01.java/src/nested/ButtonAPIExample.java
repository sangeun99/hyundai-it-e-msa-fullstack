package nested;

class Button {
	OnClickListener ocl;

	void SetOnClickListener(OnClickListener ocl) {
		this.ocl = ocl;
	}

	interface OnClickListener {
		public abstract void onClick();
	}

	void onClick() {
		ocl.onClick();
	}
}

public class ButtonAPIExample {
	public static void main(String[] args) {
		Button btn1 = new Button();
		btn1.SetOnClickListener(new Button.OnClickListener() {
			@Override
			public void onClick() {
				System.out.println("개발자1: 음악 재생");
			}
		});
		btn1.onClick();
		
		Button btn2 = new Button();
		btn2.SetOnClickListener(new Button.OnClickListener() {
			@Override
			public void onClick() {
				System.out.println("개발자2: 네이버 실행");
			}
		});
		btn2.onClick();
	}

}
