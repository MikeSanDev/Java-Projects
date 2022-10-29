// package com.hackathon.dekofcards;

import java.util.HashMap;

public class Card {
	
	private String suit;
	private int rank;
	private String name;
	
    public Card(String suit, Integer rank) {
    	this.suit = suit;
    	this.rank = rank;
    	this.name = "";
    	
    	HashMap<Integer, String> names = new HashMap<Integer, String>();
        names.put(1, "Ace");
        names.put(11, "Jack");
        names.put(12, "Queen");
        names.put(13, "King");
            
            
        if (names.get(rank) != null) {
            this.name = names.get(rank);
        }
        else {
            this.name = Integer.toString(rank);
        }
    }
    
    public int suitWin(){
        if (this.suit.equals("Spades" )) {
        return 1;
        }
        if (this.suit.equals("Clubs" )) {
        return 2;
        }
        if (this.suit.equals("Hearts" )) {
        return 4;
        }
        else {
            return 3;
        }
    }
    public void showCard() {
        System.out.printf("%s of %s\n", this.name, this.suit);
    }


	public String getSuit() {
		return suit;
	}


	public void setSuit(String suit) {
		this.suit = suit;
	}


	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
    
    
}