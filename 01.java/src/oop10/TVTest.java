package oop10;

import java.io.FileInputStream;
import java.util.Properties;

public class TVTest {
	public static void main(String[] args) {
		Properties pr = new Properties();
		try {
			pr.load(new FileInputStream("src/oop10/product.properties"));
			String tvClass = pr.getProperty("tv");
			String speakerClass = pr.getProperty("speaker");
			Class tvClazz = Class.forName(tvClass); // 클래스가 있으면 해당 클래스를 메모리에 올림
			Class speakerClazz = Class.forName(speakerClass);
			TV tv = (TV) tvClazz.getConstructor(null).newInstance();
			Speaker speaker = (Speaker) speakerClazz.getConstructor(null).newInstance();

			tv.setSpeaker(speaker);
			tv.powerOn();
			tv.channelDown();
			tv.channelDown();
			tv.channelDown();
			tv.soundUp();		
			tv.powerOff();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}