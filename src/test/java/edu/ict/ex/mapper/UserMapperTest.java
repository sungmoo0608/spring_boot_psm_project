package edu.ict.ex.mapper;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import edu.ict.ex.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class UserMapperTest {
	
	@Autowired
	private UserMapper userMapper;
	
	@Disabled
	@Test
	void testUserMapper() {
		assertNotNull(userMapper);
	}
	
	@Disabled
	@Test
	void testGetUser() {
		UserVO user = userMapper.getUser("admin");
		assertNotNull(user);
		
		System.out.println(user);
	}
	
	// 단방향(MD5,SHA등)은 암호화(encoding)는 가능해도 복호화(decoding)는 안되는 것을 말하고,
	// 양방향(AES,RSA,DES등)은 암호화 및 복호화가 가능한 것이다.
	
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Test
	void testInsertUser() {
		
		UserVO user = new UserVO();
		user.setUsername("abc");
		user.setUserid("abc");
		user.setPassword(passwordEncoder.encode("abc"));
		user.setUtel("010-1111-4444");
		user.setUadd("서울시 성동구 아차산로 117");
		user.setUemail("admin2@ict.com");
		user.setEnabled("1");
		
		userMapper.insertUser(user);
		userMapper.insertAuthorities(user);
		
		assertNotNull(user);
		
		System.out.println(user);
	}
	
	
	@Disabled
	@Test
	void testMatcher() {
		
		UserVO user = userMapper.getUser("abc");
		
		boolean isMatch = passwordEncoder.matches("abc", user.getPassword());
		
		System.out.println(user.getPassword());
		assertEquals(isMatch, true);
		
		
	}
	

	
}
