package edu.ict.ex.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class LoginController {

	@GetMapping("/login")
	public String login(Model model) {
		
		log.info("login()..");

		return "login/login";
	}
	
	@GetMapping("/loginInfo")
	public String loginInfo(Authentication authentication,Principal principal,Model model) {
		
		log.info("loginInfo()..");
		
		//1. 방법
        if (principal != null) {
            log.info("Principal: " + principal.getName());
        }

		//2. 방법
        if (authentication != null) {
            log.info("Authenticated user: " + authentication.getName());
            log.info("Authorities: " + authentication.getAuthorities());
        }
		
		//0. OAuth2User에서 username을 가져오는 코드
        if (authentication instanceof OAuth2AuthenticationToken) {
            OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
            OAuth2User oauthUser = oauthToken.getPrincipal();
            String username = oauthUser.getAttribute("login"); // 예시로 'login' 속성을 사용
            log.info("OAuth2 Username: " + username);
        }
		
		//3.SpringContextHolder를 통하여 가져오는 방법(일반적인 빈에서 사용할 수 있음)
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        log.info("SecurityContextHolder user: " + auth.getName());
        log.info("SecurityContextHolder authorities: " + auth.getAuthorities());
		
		return "redirect:/";
	}
	
}
