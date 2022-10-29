// package com.hackathon.dekofcards;

import java.util.ArrayList;
import java.util.Random;


public class Deck {
	
	private ArrayList<Card> cards;
	
    public Deck() {
        this.cards = new ArrayList<Card>();

        // Populate the cards list -- loop to 52
        for (String name : new String[] {"♥️ Hearts", "♣ Clubs", "♦️ Diamonds", "♠ Spades"}) {
            for (Integer rank = 1; rank <= 13; rank++) {
                this.cards.add(new Card(name, rank));
            }
        }
    }

	public ArrayList<Card> getCards() {
		return cards;
	}

	public void setCards(ArrayList<Card> cards) {
		this.cards = cards;

	}
    
    public Card showOneCardComputer(int oneCard) {
        Card theCard = this.cards.get(oneCard);

        System.out.println("----- Computer ----- \n " + theCard.getName() + " " + theCard.getSuit() );
	    this.cards.remove(oneCard);
        return theCard;
	}
    public Card showOneCardPlayer(int oneCard) {
        Card theCard = this.cards.get(oneCard);
        System.out.println("----- Player -----  \n " + theCard.getName() + " " + theCard.getSuit() );
	    this.cards.remove(oneCard);
        return theCard;
	}

    public int getRandomCard() {
        Random random = new Random();
        int rand = (int)(Math.random() * 51 + 1);
        return rand;
    }

    public void winner(Card Player, Card Computer) {
        if(Player.getRank() > Computer.getRank()){     
        System.out.println("You win!");
        } 
        else if( Player.getRank() == Computer.getRank()){
            if(Player.suitWin() >= Computer.suitWin()){
                    System.out.println("Draw! Play Again");
            }
        }
        else {
            System.out.println("You lose!");
        }
    }
}   
    