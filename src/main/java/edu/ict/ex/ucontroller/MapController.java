package edu.ict.ex.ucontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class MapController {

	@GetMapping("/map")
	public String map(Model model) {
		
		log.info("map()..");

		return "test/map"; 
	}
	
}
