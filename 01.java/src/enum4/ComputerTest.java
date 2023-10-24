package enum4;

public class ComputerTest {
	public static void main(String[] args) {
		Computer computer = new Computer();
		System.out.println(computer.powerState);
		computer.setState(PowerState.ON);
		System.out.println(computer.powerState);
	}
}
