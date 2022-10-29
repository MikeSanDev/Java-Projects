package com.MichaelS.ZooKeeper;

public class GorillaTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("------ Gorilla ------");
		Gorilla monkey = new Gorilla();
		monkey.displayEnergy();
		monkey.throwThings();
		monkey.throwThings();
		monkey.throwThings();
		monkey.eatBananas();
		monkey.climb();
		monkey.displayEnergy();
	
		System.out.println("------ Bat ------");
		Bat zomBat = new Bat();
		zomBat.displayEnergy();
		zomBat.attackTown();
		zomBat.attackTown();
		zomBat.attackTown();
		zomBat.eatHumans();
		zomBat.eatHumans();
		zomBat.fly();
		zomBat.fly();
		zomBat.displayEnergy();
		
	}

}
