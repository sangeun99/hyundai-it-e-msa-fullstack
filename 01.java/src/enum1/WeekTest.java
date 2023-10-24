package enum1;

import java.util.Calendar;

public class WeekTest {
	public static void main(String[] args) {
		Week[] weeks = Week.values();
		Calendar calendar = Calendar.getInstance();
		
		Week today = weeks[calendar.get(Calendar.DAY_OF_WEEK)-1];
		
		/*
		switch(calendar.get(Calendar.DAY_OF_WEEK)) {
		case 1 : today = Week.SUNDAY    ; break;
		case 2 : today = Week.MONDAY    ; break;
		case 3 : today = Week.TUESDAY   ; break;
		case 4 : today = Week.WEDNESDAY ; break;
		case 5 : today = Week.THURSDAY  ; break;
		case 6 : today = Week.FRIDAY    ; break;
		case 7 : today = Week.SATURDAY  ; break;
		}*/
		System.out.println(today);
		
		for(Week w:Week.values()) {
			System.out.println(w.ordinal());
		}
		switch (today) {
		case SUNDAY:
		case SATURDAY:
			System.out.println("주말은 신나는 자기주도 학습을 합니다.");
			break;

		default:
			System.out.println("평일은 수업을 청강합니다.");
			break;
		}
	}
}
