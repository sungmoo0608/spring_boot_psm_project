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
	
	//notice
	@GetMapping("/notice")
	public String notice(Model model) {
		
		log.info("notice()..");

		return "pboard/notice"; 
	}
	
	//notice1
	@GetMapping("/notice1")
	public String notice1(Model model) {
		
		log.info("notice()..");

		return "pboard/notice1"; 
	}
	
	//notice2
	@GetMapping("/notice2")
	public String notice2(Model model) {
		
		log.info("notice2()..");

		return "pboard/notice2"; 
	}
	
	//notice3
	@GetMapping("/notice3")
	public String notice3(Model model) {
		
		log.info("notice3()..");

		return "pboard/notice3"; 
	}
	
	//notice4
	@GetMapping("/notice4")
	public String notice4(Model model) {
		
		log.info("notice4()..");

		return "pboard/notice4"; 
	}
	
	//areview
	@GetMapping("/areview")
	public String areview(Model model) {
		
		log.info("areview()..");

		return "pboard/areview"; 
	}
	
	//areview_write
	@GetMapping("/areview_write")
	public String areview_write(Model model) {
		
		log.info("areview_write()..");

		return "pboard/areview_write"; 
	}
	
	//qna
	@GetMapping("/qna")
	public String qna(Model model) {
		
		log.info("qna()..");

		return "pboard/qna"; 
	}
	
	//qna_add
	@GetMapping("/qna_add")
	public String qna_add(Model model) {
		
		log.info("qna_add()..");

		return "pboard/qna_add"; 
	}
	
	//qna_write
	@GetMapping("/qna_write")
	public String qna_write(Model model) {
		
		log.info("qna_write()..");

		return "pboard/qna_write"; 
	}
	
	//pet_content_view
	@GetMapping("/pet/pet_content_view")
	public String pet_content_view(Model model) {
		
		log.info("pet_content_view()..");

		return "pet/pet_content_view"; 
	}
	
}
