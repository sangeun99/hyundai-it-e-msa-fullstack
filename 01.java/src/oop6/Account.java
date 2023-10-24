package oop6;

public class Account {
	int money1;
	static int money2;
	
	public Account(int money) {
		this.money1 += money;
		money2 += money;
	}
	
	@Override
	public String toString() {
		return ("money 1 : " + money1 + ", money 2 : " + money2);
	}

}
