package com.michael.login.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.michael.login.models.LoginUser;
import com.michael.login.models.User;
import com.michael.login.services.UserService;

@Controller
public class UserController {
		
	@Autowired
	private UserService userService;
	
//		Register
		@GetMapping("/")
		public String index(Model model) {
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", new LoginUser());
			return "logreg.jsp";
		}
		
		@PostMapping("/register")
		public String processRegister(
				@Valid @ModelAttribute("newUser") 
				User newUser, BindingResult result, Model model, HttpSession session) {
			User registeredUser = userService.register(newUser, result);
			if(result.hasErrors()) {
				model.addAttribute("newLogin", new LoginUser());
				return "logreg.jsp";
			}else {
				session.setAttribute("userId", registeredUser.getId());
				session.setAttribute("userName", registeredUser.getUserName());
				return "redirect:/dashboard";
			}
			
		}
//		Login
		@PostMapping("/login")
		public String processLogin(
				@Valid @ModelAttribute("newLogin") 
				LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
			User user = userService.login(newLogin, result);
			if(result.hasErrors()) {
				model.addAttribute("newUser", new User());
				return "logreg.jsp";
			}else {
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getUserName());
				return "redirect:/dashboard";
			}
			
		}
		
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
//		Move to home controller
		@GetMapping("/dashboard")
		public String dashboard(HttpSession session) {
			if(session.getAttribute("userId")==null) {
				session.invalidate();
				return "redirect:/";
			}
			return "dashboard.jsp";
		}
}

