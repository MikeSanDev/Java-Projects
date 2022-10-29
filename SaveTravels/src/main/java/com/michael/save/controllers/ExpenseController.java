package com.michael.save.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.michael.save.models.Expense;
import com.michael.save.services.ExpenseService;

@Controller
public class ExpenseController {

	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/expenses";
	}
//	Display
	@GetMapping("/expenses/display/{id}")	
	public String index(@PathVariable("id")Long id, Model model) {
		
		Expense expense = expenseService.findExpense(id);
		
		model.addAttribute("expense", expense);
        
		return "display.jsp";
	}
//	Create
	@GetMapping("/expenses")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	@PostMapping("/expenses")
	public String index(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		}else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
//	Edit
	@GetMapping("/expenses/edit/{id}")
	public String showEditForm(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.findExpense(id);	
		model.addAttribute("editExpense", expense);
		return "edit.jsp";
		}
	@PutMapping("/expenses/edit/{id}")
	public String update(@PathVariable("id")Long id, Model model,
		@Valid @ModelAttribute("editExpense") Expense expense,
		BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}else {
			expenseService.updateExpense(expense);
			return"redirect:/expenses";
		}
	}
//	Delete
    @RequestMapping(value="/expenses/delete/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        expenseService.deleteExpense(id);
        return "redirect:/expenses";
    }
	
}
