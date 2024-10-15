package edu.ict.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class MyPageController {
	
    // 회원가입 페이지 표시
    @GetMapping("/mypage")
    public String mypage(Model model) {
        log.info("mypage()..");
        return "user/mypage"; // 회원가입 뷰 이름
    }
    
}
