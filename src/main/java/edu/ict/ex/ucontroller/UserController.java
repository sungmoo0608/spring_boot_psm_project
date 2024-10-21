package edu.ict.ex.ucontroller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.ict.ex.uservice.UserService;
import edu.ict.ex.uvo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class UserController {
	
    @Autowired
    private UserService userService; // UserService 주입
    
    @Autowired
    private PasswordEncoder passwordEncoder; // 비밀번호 인코더 주입

    // 회원가입 페이지 표시
    @GetMapping("/join")
    public String join(Model model) {
        log.info("join()..");
        return "user/joinForm"; // 회원가입 뷰 이름
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
    
    @GetMapping("/checkUserPhone")
    @ResponseBody
    public Map<String, Boolean> checkUserPhone(@RequestParam String utel) {
        boolean exists = userService.isUserPhoneExists(utel);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return response;
    }
    
    @GetMapping("/checkUserEmail")
    @ResponseBody
    public Map<String, Boolean> checkUserEmail(@RequestParam String uemail) {
        boolean exists = userService.isUserEmailExists(uemail);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return response;
    }

    
    // 회원가입 요청 처리
    @PostMapping("/insertUser")
    public String insertUser(UserVO userVO, Model model) {
        log.info("insertUser()..");

        // Validate user input
        if (userVO.getUname() == null || userVO.getUname().isEmpty()) {
            model.addAttribute("error", "사용자 이름은 필수입니다.");
            return "user/joinForm";
        }
        
        if (userVO.getPassword() == null || userVO.getPassword().length() < 6) {
            model.addAttribute("error", "비밀번호는 최소 6자 이상이어야 합니다.");
            return "user/joinForm";
        }
        
        if (userVO.getUemail() == null || !userVO.getUemail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            model.addAttribute("error", "이메일 주소는 필수입니다.");
            return "user/joinForm";
        }
        
        if (userVO.getUtel() == null || userVO.getUtel().isEmpty()) {
            model.addAttribute("error", "휴대폰 번호는 필수입니다.");
            return "user/joinForm";
        }

        // Duplicate check
        if (userService.isUserExists(userVO.getUserid())) {
            model.addAttribute("error", "이미 존재하는 ID입니다.");
            return "user/joinForm";
        }
        
        if (userService.isUserPhoneExists(userVO.getUtel())) {
            model.addAttribute("error", "이미 존재하는 휴대폰 번호입니다.");
            return "user/joinForm";
        }
        
        if (userService.isUserEmailExists(userVO.getUemail())) {
            model.addAttribute("error", "이미 존재하는 이메일입니다.");
            return "user/joinForm";
        }

        try {
            userService.registerUser(userVO);
            return "redirect:/";
            
        } catch (Exception e) {
            log.error("Error registering user: ", e);
            model.addAttribute("error", "회원가입 중 오류가 발생했습니다.");
            return "user/joinForm";
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
    public String deleteUser(@RequestParam String userid, @RequestParam String password, HttpServletRequest request, HttpServletResponse response, Model model) {
        log.info("deleteUser()..");

        // 사용자 정보 확인
        UserVO user = userService.getUserById(userid);
        if (user == null) {
            model.addAttribute("error", "사용자 ID가 존재하지 않습니다.");
            model.addAttribute("userid", userid); // 입력된 ID를 모델에 추가
            
            return "user/deleteForm";
        }

        // 비밀번호 확인
        if (!userService.passwordMatches(password, user.getPassword())) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("userid", userid); // 입력된 ID를 모델에 추가
            return "user/deleteForm";
        }

        // 사용자 탈퇴 처리
        try {
            userService.deleteUser(userid); // 사용자 및 권한 삭제
            
            // 로그아웃 처리
            SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
            logoutHandler.logout(request, response, null);
            
            return "redirect:/"; // 탈퇴 후 리다이렉트
            
        } catch (Exception e) {
            log.error("Error deleting user: ", e);
            model.addAttribute("error", "탈퇴 중 오류가 발생했습니다.");
            return "user/deleteForm";
        }
    }
	
    
    // 회원정보 수정
    @GetMapping("/modify")
    public String modify(Model model, Principal principal) { 
        log.info("modify()..");
        if (principal != null) {
            String userid = principal.getName(); // 로그인된 사용자 ID
            model.addAttribute("user", userService.getUserById(userid));
        }
        return "user/modifyForm"; // 회원가입 뷰 이름
    }
    
	@PutMapping("/modify")	// 경로 변수
	public ResponseEntity<String> modify(@RequestBody UserVO user){
		
		log.info("modify..");
		log.info("user" + user);
		
		ResponseEntity<String> entity = null;
		
		try {
			
            // 비밀번호 암호화 추가
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
			
			int rn = userService.modify(user);
			entity = new ResponseEntity<String>(String.valueOf(rn),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping("/admin/userList")
	public String userList(Model model) {
	    List<UserVO> userList = userService.getAllUsers(); 
	    model.addAttribute("userList", userList);
	    return "admin/userList";
	}
    
}
