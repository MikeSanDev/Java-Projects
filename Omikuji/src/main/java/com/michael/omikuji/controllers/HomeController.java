package com.michael.omikuji.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "form.jsp";
	}
		
//	1. process the form -
//	2. get the info from the (requestParam)
//	3.save the result in session
	@PostMapping("/show")
	public String show(
			@RequestParam("quantity") String quantity,
			@RequestParam("city") String city,
			@RequestParam("person") String person,
			@RequestParam("hobby") String hobby,
			@RequestParam("animal") String animal,
			@RequestParam("message") String message,
			HttpSession session
			) {
		session.setAttribute("quantity", quantity);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("hobby", hobby);
		session.setAttribute("animal", animal);
		session.setAttribute("message", message);
		return "redirect:/show/result";
	}
	
	@GetMapping("/show/result")
	public String showResult() {
		return "show.jsp";
	}
}

	