package com.michael.bookclub.controllers;



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


import com.michael.bookclub.models.Book;
import com.michael.bookclub.services.BookService;


@Controller
public class HomeController {
	
	
	@Autowired
	private BookService bookService;
	
	
//	Login
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId")==null) {
			session.invalidate();
			return "redirect:/";
		}
		model.addAttribute("bookList", bookService.allBooks());
		return "dashboard.jsp";
	}
//	CREATE
	@GetMapping("/books/new")
	public String createBook(
			@ModelAttribute("newBook") Book newBook) {
		return "create.jsp";
	}
	@PostMapping("/books/new")
	public String addBook(
			@Valid @ModelAttribute("newBook") Book book, 
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "create.jsp";
		}
		else {
			bookService.createBook(book);
			return "redirect:/dashboard";
		}
	}	
//	GET ONE BOOK
	@GetMapping("/books/{id}")
	public String bookDetails(@PathVariable("id")Long id, Model model) {
		Book foundBook = bookService.oneBook(id);
		model.addAttribute("book", foundBook);
		return "oneBook.jsp";
	}
	
//	EDIT
//	1. Show form 
	@GetMapping("books/edit/{id}")
	public String editForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		Book foundBook = bookService.oneBook(id);
		model.addAttribute("book", foundBook);
		if(foundBook.getOwner().getId() != (Long)session.getAttribute("userId")) {
			return "redirect:/dashboard";
		}
		return "edit.jsp";
	}
//	2. Process form
	@PutMapping("/books/edit/{id}")
	public String editBook(
			@Valid @ModelAttribute("book") Book book, 
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			bookService.editBook(book);
			return "redirect:/dashboard";
		}
	}	
//	Delete
	@DeleteMapping("/books/delete/{id}")
	public String deleteBook(@PathVariable("id")Long id) {
		bookService.deleteBook(id);
		return "redirect:/dashboard";
	}
	
}
