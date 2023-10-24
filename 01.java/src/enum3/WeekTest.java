package enum3;

import java.util.Calendar;

public class WeekTest {
	public static void main(String[] args) {
		Week[] weeks = Week.values();
		Calendar calendar = Calendar.getInstance();
		
		Week today = weeks[calendar.get(Calendar.DAY_OF_WEEK)-1];
		
		switch (today) {
		case SUNDAY:
		case SATURDAY:
			System.out.println("오늘은 " + today + ", 주말은 신나는 자기주도 학습을 합니다.");
			break;

		default:
			System.out.println("오늘은 " + today + ", 평일은 수업을 청강합니다.");
			break;
		}
	}
}
