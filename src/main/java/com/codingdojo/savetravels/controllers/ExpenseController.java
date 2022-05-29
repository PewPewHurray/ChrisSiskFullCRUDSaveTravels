package com.codingdojo.savetravels.controllers;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	@RequestMapping("")
	public String index() {
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses")
	public String expenses(@ModelAttribute("expense") Expense expense, Model model) {
		model.addAttribute("expenses", expenseService.allExpenses());
		return "index.jsp";
	}
	
	@PostMapping("/expenses/create")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("expenses", expenseService.allExpenses());
			return "index.jsp";
		}
		expenseService.create(expense);
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses/{id}/edit")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpenseById(id));
		return "edit.jsp";
	}
	
	@PutMapping("/expenses/{id}/update")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		expenseService.update(expense);
		return "redirect:/expenses";
	}
	
	@DeleteMapping("/expenses/{id}/delete")
	public String delete(@PathVariable Long id) {
		expenseService.delete(id);
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses/{id}")
	public String view(@PathVariable Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpenseById(id));
		return "view.jsp";
	}
}
