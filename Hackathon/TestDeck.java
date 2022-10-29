// package com.hackathon.dekofcards;
import java.util.ArrayList;
import java.util.Random;


public class TestDeck {

	public static void main(String[] args) {
		
		Deck myDeck = new Deck();
		for (Card card: myDeck.getCards()) {
			card.showCard();
		}
		
		System.out.println("------ Hi Card game ------");
		System.out.println("Computer and player both select a random card from a deck. If your card is bigger than the other one, you win. Otherwise, you lose.");
		myDeck.winner((myDeck.showOneCardPlayer(myDeck.getRandomCard())), (myDeck.showOneCardComputer(myDeck.getRandomCard())));
	}
}
