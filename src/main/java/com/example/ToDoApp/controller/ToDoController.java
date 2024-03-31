package com.example.ToDoApp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.service.ToDoService;

@Controller
public class ToDoController {

	@Autowired
	private ToDoService service;

	@GetMapping({"/", "viewToDoList"})
	public String viewAllToDoItems(Model model, @ModelAttribute("message") String message) {
		model.addAttribute("list", service.getAllToDoItems());
		model.addAttribute("message", message);
		
		return "ViewToDoList";
	}

	@GetMapping("/updateToDoStatus/{id}")
	public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (service.updateStatus(id)) {
			redirectAttributes.addFlashAttribute("message", "Sucesso ao atualizar");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Erro ao atualizar");
		return "redirect:/viewToDoList";
	}

	@GetMapping("/addToDoItem")
	public String addToDoItem(Model model) {
		model.addAttribute("todo", new ToDo());
		
		return "AddToDoItem";
	}

	@PostMapping("/saveToDoItem")
	public String saveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Sucesso ao salvar");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Falha ao salvar");
		return "redirect:/addToDoItem";
	}
	
	@GetMapping("/editToDoItem/{id}")
	public String editToDoItem(@PathVariable Long id, Model model) {
		model.addAttribute("todo", service.getToDoItemById(id));
		
		return "EditToDoItem";
	}

	@PostMapping("/editSaveToDoItem")
	public String editSaveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Sucesso ao editar");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Erro ao editar");
		return "redirect:/editToDoItem/" + todo.getId();
	}
	
	@GetMapping("/deleteToDoItem/{id}")
	public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (service.deleteToDoItem(id)) {
			redirectAttributes.addFlashAttribute("message", "Sucesso ao deletar");
			return "redirect:/viewToDoList";
		}
		
		redirectAttributes.addFlashAttribute("message", "Erro ao deletar");
		return "redirect:/viewToDoList";
	}
	
}
