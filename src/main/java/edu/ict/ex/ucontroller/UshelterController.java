package edu.ict.ex.ucontroller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.ict.ex.uservice.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class UshelterController {
	
    @Autowired
    private UserService userService; // UserService 주입
    
    // 회원 정보 페이지 표시
    @GetMapping("/ushelter")
    public String ushelter(Model model, Principal principal) {
    	
        log.info("ushelter()..");
        
        if (principal != null) {
            String userid = principal.getName(); // 로그인된 사용자 ID
            model.addAttribute("user", userService.getUserById(userid));
        }
     
        return "admin/ushelter"; // 마이페이지 뷰 이름
    }

}
