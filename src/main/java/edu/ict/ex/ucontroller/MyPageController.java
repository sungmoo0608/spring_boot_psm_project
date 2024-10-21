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

public class MyPageController {
	
    @Autowired
    private UserService userService; // UserService 주입
    
    // 회원 정보 페이지 표시
    @GetMapping("/mypage")
    public String mypage(Model model, Principal principal) {
    	
        log.info("mypage()..");
        
        if (principal != null) {
            String userid = principal.getName(); // 로그인된 사용자 ID
            model.addAttribute("user", userService.getUserById(userid));
            model.addAttribute("userBoard", userService.getUserBoardById(userid));
            model.addAttribute("userHope", userService.getUserHopeById(userid));
        }
     
        return "user/mypage"; // 마이페이지 뷰 이름
    }

}
