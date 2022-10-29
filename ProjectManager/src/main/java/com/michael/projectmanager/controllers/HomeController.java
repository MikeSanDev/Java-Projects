package com.michael.projectmanager.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.michael.projectmanager.models.Project;
import com.michael.projectmanager.services.ProjectService;





@Controller
public class HomeController {
	@Autowired
	private ProjectService projectService;
	

	
	
//	Login
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId")==null) {
			session.invalidate();
			return "redirect:/";
		}
		model.addAttribute("projectList", projectService.allProjects());
		return "dashboard.jsp";
	}
//	CREATE
	@GetMapping("/projects/new")
	public String addProject(
			@ModelAttribute("newProject") Project newProject) {
		return "newProject.jsp";
	}
	@PostMapping("/projects/new")
	public String createProject(
			@Valid @ModelAttribute("newProject") Project project, 
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "newProject.jsp";
		}
		else {
			projectService.createProject(project);
			return "redirect:/dashboard";
		}
	}	
//	GET ONE 
	@GetMapping("/projects/{id}")
	public String projectDetails(@PathVariable("id")Long id, Model model) {
		Project foundProject = projectService.oneProject(id);
		model.addAttribute("project", foundProject);
		return "oneProject.jsp";
	}
// CREATE EDIT AND DELETE ROUTE 
//	Edit
//	1. Show the form
	@GetMapping("/projects/edit/{id}")
	public String editForm(@PathVariable("id") Long id, Model model) {
		Project foundProject = projectService.oneProject(id);
		model.addAttribute("project", foundProject);
		return "edit.jsp";
	}
	@PutMapping("/projects/edit/{id}")
	public String processProject(
			@Valid @ModelAttribute("project") Project project, 
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			projectService.editProject(project);
			return "redirect:/dashboard";
		}
	}
	   
//	Delete  
//	when using PathVariable, Session must be at the end AFTER Long id
	@DeleteMapping("/projects/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id, HttpSession session) {
		projectService.deleteProject(id);
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		return "redirect:/dashboard";
	}
}