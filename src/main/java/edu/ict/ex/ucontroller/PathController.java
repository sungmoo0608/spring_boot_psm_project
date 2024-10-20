package edu.ict.ex.ucontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class PathController {

	//어드민-입양 대기 동물 관리
	@GetMapping("/pet")
	public String pet(Model model) {
		
		return "pet/pet"; 
	}
	
	//pet_content_view
	@GetMapping("/pet/pet_content_view")
	public String pet_content_view(Model model) {
		
		return "pet/pet_content_view"; 
	}
	
	//어드민-입양 회원 정보 관리
	@GetMapping("/hope")
	public String hope(Model model) {

		return "hope/hope"; 
	}
	
	//notice
	@GetMapping("/pboard/notice")
	public String notice(Model model) {
		
		return "pboard/notice"; 
	}
	
	//notice1
	@GetMapping("/pboard/notice1")
	public String notice1(Model model) {

		return "pboard/notice1"; 
	}
	
	//notice2
	@GetMapping("/pboard/notice2")
	public String notice2(Model model) {
		
		return "pboard/notice2"; 
	}
	
	//notice3
	@GetMapping("/pboard/notice3")
	public String notice3(Model model) {

		return "pboard/notice3"; 
	}
	
	//notice4
	@GetMapping("/pboard/notice4")
	public String notice4(Model model) {

		return "pboard/notice4"; 
	}
	
	//areview
	@GetMapping("/pboard/areview")
	public String areview(Model model) {

		return "pboard/areview"; 
	}
	
	//areview_write
	@GetMapping("/pboard/areview_write")
	public String areview_write(Model model) {

		return "pboard/areview_write"; 
	}
	
	//qna
	@GetMapping("/pboard/qna")
	public String qna(Model model) {

		return "pboard/qna"; 
	}
	
	
	//qna_add
	@GetMapping("/pboard/qna_add")
	public String qna_add(Model model) {

		return "pboard/qna_add"; 
	}
	
	//qna_write
	@GetMapping("/pboard/qna_write")
	public String qna_write(Model model) {
		
		return "pboard/qna_write"; 
	}
	
	//petboard_content_view
	@GetMapping("/pboard/petboard_content_view")
	public String petboard_content_view(Model model) {
		
		return "pboard/petboard_content_view"; 
	}
	
}
