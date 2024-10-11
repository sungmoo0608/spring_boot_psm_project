package edu.ict.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
    
    @Autowired
    private PasswordEncoder passwordEncoder; // 비밀번호 인코더 주입

    // 회원가입 페이지 표시
    @GetMapping("/join")
    public String join(Model model) {
        log.info("join()..");
        return "user/addForm"; // 회원가입 뷰 이름
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
            return "user/addForm";
        }
        if (userVO.getPassword() == null || userVO.getPassword().length() < 6) {
            model.addAttribute("error", "비밀번호는 최소 6자 이상이어야 합니다.");
            return "user/addForm";
        }
        if (userVO.getUemail() == null || !userVO.getUemail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            model.addAttribute("error", "유효한 이메일을 입력하세요.");
            return "user/addForm";
        }

        // Duplicate check
        if (userService.isUserExists(userVO.getUserid())) {
            model.addAttribute("error", "이미 존재하는 사용자입니다.");
            return "user/addForm";
        }

        try {
            userService.registerUser(userVO);
            return "redirect:/";
        } catch (Exception e) {
            log.error("Error registering user: ", e);
            return "redirect:/join";
        }
    }
    
    @GetMapping("/deleteUser")
    public String deleteUserPage(Principal principal, Model model) {
        log.info("deleteUserPage()..");
        if (principal != null) {
            String userid = principal.getName(); // 로그인된 사용자 ID
            model.addAttribute("userid", userid); // 모델에 추가
            log.info("Logged in user ID: " + userid); // 로그 확인
        } else {
            model.addAttribute("error", "로그인 상태가 아닙니다."); // 로그인 상태 확인
        }
        return "user/deleteForm"; // 탈퇴 페이지 뷰 이름
    }
    
    
    // 회원 탈퇴 요청 처리
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam String userid, @RequestParam String password, Model model) {
        log.info("deleteUser()..");

        // 사용자 정보 확인
        UserVO user = userService.getUserById(userid);
        if (user == null) {
            model.addAttribute("error", "사용자 ID가 존재하지 않습니다.");
            return "user/deleteForm";
        }

        // 비밀번호 확인
        if (!userService.passwordMatches(password, user.getPassword())) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "user/deleteForm";
        }

        // 사용자 탈퇴 처리
        try {
            userService.deleteUser(userid); // 사용자 및 권한 삭제
            return "redirect:/"; // 탈퇴 후 리다이렉트
        } catch (Exception e) {
            log.error("Error deleting user: ", e);
            model.addAttribute("error", "탈퇴 중 오류가 발생했습니다.");
            return "user/deleteForm";
        }
    }
    
}
