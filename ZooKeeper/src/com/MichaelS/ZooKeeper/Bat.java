package com.MichaelS.ZooKeeper;

public class Bat extends Mammal {
	
	
	public Bat() {
	this.energyLevel = 300;
	}
	
	public void fly() {
		energyLevel -= 50;
		 System.out.println("*Bat flying noise*");

	}
	
	public void eatHumans() {
		energyLevel += 25;
		System.out.println("*Screams of humans being eaten*");

	}
	
	public void attackTown() {
		energyLevel -= 100;
		
		
	}
}
