package oop10;

public interface TV {
	public abstract void powerOn();	
	public abstract void powerOff();
	public abstract void channerUp();	
	public abstract void channelDown();	
	public abstract void soundUp();	
	public abstract void soundDown();
	public default void setSpeaker(Speaker speaker) {}
}
