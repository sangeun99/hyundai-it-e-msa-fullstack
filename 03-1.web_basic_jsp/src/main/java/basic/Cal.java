package basic;

import java.util.Calendar;

public class Cal {
	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();	
		
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		System.out.println(year + " " + month);
		
		c.set(year, month-1, 1);
		int week = c.get(Calendar.DAY_OF_WEEK);
		System.out.println(week);
		
		int endday = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(endday);
		
		System.out.println("일 월 화 수 목 금 토");
		System.out.println("--------------------");
		
		for (int w=1; w<week; w++) {
			System.out.print("   ");
		}
		for (int d=1, w=week; d<=endday; d++, w++) {
			System.out.print( d<10 ? " " + d + " " : d + " ");
			if (w % 7 == 0) System.out.println();
		}
		
	}
}
