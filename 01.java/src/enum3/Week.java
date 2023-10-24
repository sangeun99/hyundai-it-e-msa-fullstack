package enum3;

public enum Week {
	SUNDAY("일"),
	MONDAY("월"),
	TUESDAY("화"),
	WEDNESDAY("수"),
	THURSDAY("목"),
	FRIDAY("금"),
	SATURDAY("토");
	
	private String description;
	
	private Week(String description) {
		this.description = description + "요일";
	}	
	public String getDescription() {
		return description;
	}
	@Override
	public String toString() {
		return getDescription();
	}
}
