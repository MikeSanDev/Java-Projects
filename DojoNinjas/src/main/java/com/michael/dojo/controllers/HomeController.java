package com.michael.dojo.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.michael.dojo.models.Dojo;
import com.michael.dojo.models.Ninja;
import com.michael.dojo.services.MainService;

@Controller
public class HomeController {

		@Autowired 
		private MainService mainService;
		
//		Create Dojo
		@GetMapping("/dojos/new")
		public String newDojo(@ModelAttribute("newDojo") Dojo dojo) {
			return "newDojo.jsp";
		}
		
		@PostMapping("/dojos/new")
		public String createDojo(@Valid @ModelAttribute("newDojo") Dojo dojo, BindingResult result) {
			if(result.hasErrors()) {
				return "newDojo.jsp";
			}
			else {
				mainService.createDojo(dojo);
				return "redirect:/ninjas/new";
			}
		}
//	Create Ninja
		@GetMapping("/ninjas/new")
		public String showNinjaForm(Model model) {
			model.addAttribute("newNinja", new Ninja());
			model.addAttribute("dojoList", mainService.allDojos());
			return "newNinja.jsp";
		}
		
		@PostMapping("/ninjas/new")
		public String addNinja(
				@Valid @ModelAttribute("newNinja") Ninja ninja, 
				BindingResult result,
				Model model) {
			if(result.hasErrors()) {
				model.addAttribute("dojoList", mainService.allDojos());
				return "newNinja.jsp";
			}
			else {
				mainService.createNinja(ninja);
				return "redirect:/dojos/" + ninja.getDojo().getId();
			}
		}	
//	Get one user
	@GetMapping("dojos/{id}")
	public String dojoDetails(@PathVariable("id")Long id, Model model) {
		Dojo foundDojo = mainService.oneDojo(id);
		model.addAttribute("dojo", foundDojo);
		return "oneDojo.jsp";
	}
}
