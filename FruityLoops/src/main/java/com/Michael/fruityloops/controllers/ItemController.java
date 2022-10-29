package com.Michael.fruityloops.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Michael.fruityloops.models.Item;

@Controller
public class ItemController {

	@RequestMapping("/")
    public String index(Model model) {

	    
        ArrayList<Item> fruits = new ArrayList<Item>();
        fruits.add(new Item("Kiwi", 1.5));
        fruits.add(new Item("Mango", 2.0));
        fruits.add(new Item("Goji Berries", 4.0));
        fruits.add(new Item("Guava", .75));
        
        // Add fruits your view model here
        model.addAttribute("items", fruits);
        
        
        for(Item fruitLoop : fruits) {
        	System.out.println(fruitLoop);
     
    }
        return "fruit.jsp";
}
}