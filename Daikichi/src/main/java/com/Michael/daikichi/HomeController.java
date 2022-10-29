package com.Michael.daikichi;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class HomeController {
	@RequestMapping("")
	public String index() {
		return "Welcome!";
	}
	@RequestMapping("/today")
	public String today() {
		return "Today you will find luck in all your endeavors!";
	}
	@RequestMapping("/tomorrow")
	public String tomorrow() {
		return "Tomorrow, an opportunity will arise, so be sure to be open to new ideas!";
	}
	@RequestMapping("/goodbye")
	public String goodbye() {
		return "Goodbye!";
	}
	
	 @RequestMapping(value = "/daikichi/travel/{city}", method=RequestMethod.GET)
	    public String getCity(@PathVariable("city") String city) {
					return " Congratualtions! You will soon travel to " + city;
	    }
	 
	 @RequestMapping(value = "/daikichi/lotto/{numb}", method=RequestMethod.GET)
	    public String getNumber(@PathVariable("numb") int numb) {
			if(numb % 2 == 0) {
				return "You will take a grand journey in the near future, but be weary of tempting offers";
			}
			else {
				return "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends.";
			}
		 		
	    }
	 
}
