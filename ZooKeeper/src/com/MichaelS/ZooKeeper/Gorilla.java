package com.MichaelS.ZooKeeper;

public class Gorilla extends Mammal {

	
	
	public void throwThings(){
		 energyLevel -= 5;
		 System.out.println("The Gorilla threw something at you!");
//		 displayEnergy();
	}
	
	public void eatBananas() {
		energyLevel += 10;
		 System.out.println("The Gorilla ate one banana");

//		displayEnergy();
	}
	
	public void climb() {
		energyLevel -= 10;
		 System.out.println("The Gorilla started climbing a tree!");
//		displayEnergy();
	}
}
