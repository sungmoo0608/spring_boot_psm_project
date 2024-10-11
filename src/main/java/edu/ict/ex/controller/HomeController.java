package edu.ict.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class HomeController {

	@GetMapping("/")
	public String login(Model model) {
		
		log.info("login()..");

		return "home";
	}
	
}
