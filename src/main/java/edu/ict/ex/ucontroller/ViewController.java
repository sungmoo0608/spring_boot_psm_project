package edu.ict.ex.ucontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class ViewController {

	//어드민-입양 대기 동물 관리
	@GetMapping("/pet")
	public String pet(Model model) {
		
		log.info("home()..");

		return "pet/pet"; 
	}
	
	//어드민-입양 회원 정보 관리
	@GetMapping("/hope")
	public String hope(Model model) {
		
		log.info("hope()..");

		return "admin/hope"; 
	}
	
	//어드민-보호소 방문 예약 관리
	@GetMapping("/ushelter")
	public String ushelter(Model model) {
		
		log.info("ushelter()..");

		return "admin/ushelter"; 
	}
	
}
