package enum4;

public enum PowerState {
	OFF("전원이 꺼졌습니다."),
	ON("전원이 켜졌습니다."),
	SUSPEND("절전모드 입니다.");
	
	private String description;

	private PowerState(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	@Override
	public String toString() {
		return getDescription();
	}
}
