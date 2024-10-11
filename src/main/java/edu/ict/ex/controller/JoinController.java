package edu.ict.ex.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.ict.ex.service.UserService;
import edu.ict.ex.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class JoinController {
	
    @Autowired
    private UserService userService; // UserService 주입

    // 회원가입 페이지 표시
    @GetMapping("/join")
    public String join(Model model) {
        log.info("join()..");
        return "add/addForm"; // 회원가입 뷰 이름
    }
    
    // 중복 체크 버튼
    @GetMapping("/checkUserId")
    @ResponseBody
    public Map<String, Boolean> checkUserId(@RequestParam String userid) {
        boolean exists = userService.isUserExists(userid);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return response;
    }

    // 회원가입 요청 처리
    @PostMapping("/insertUser")
    public String insertUser(UserVO userVO, Model model) {
        log.info("insertUser()..");

        // Validate user input
        if (userVO.getUsername() == null || userVO.getUsername().isEmpty()) {
            model.addAttribute("error", "사용자 이름은 필수입니다.");
            return "add/addForm";
        }
        if (userVO.getPassword() == null || userVO.getPassword().length() < 6) {
            model.addAttribute("error", "비밀번호는 최소 6자 이상이어야 합니다.");
            return "add/addForm";
        }
        if (userVO.getUemail() == null || !userVO.getUemail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            model.addAttribute("error", "유효한 이메일을 입력하세요.");
            return "add/addForm";
        }

        // Duplicate check
        if (userService.isUserExists(userVO.getUserid())) {
            model.addAttribute("error", "이미 존재하는 사용자입니다.");
            return "add/addForm";
        }

        try {
            userService.registerUser(userVO);
            return "redirect:/";
        } catch (Exception e) {
            log.error("Error registering user: ", e);
            return "redirect:/join";
        }
    }
}
