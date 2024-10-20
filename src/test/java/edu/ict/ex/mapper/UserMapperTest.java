package edu.ict.ex.mapper;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import edu.ict.ex.umapper.UserMapper;
import edu.ict.ex.uvo.UserVO;
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
		user.setUserid("CCCCCC");
		user.setPassword(passwordEncoder.encode("CCCCCC"));
		user.setUname("홍길동");
		user.setUtel("010-2864-2244");
		user.setZipcode("04794");
		user.setUadr("서울시 성동구 아차산로 113");
		user.setUadrdetail("2층 한국ICT인재개발원 성수센터");
		user.setUemail("CCCCCC@ict.com");
		user.setEnabled("1");
		
		userMapper.insertUser(user);
		userMapper.insertAuthorities(user);
		
		assertNotNull(user);
		
		System.out.println(user);
	}
	
	
	@Disabled
	@Test
	void testModifyUser() {
		
		UserVO user = userMapper.getUser("AAAAAA");
		user.setPassword(passwordEncoder.encode("AAAAAA"));
		user.setUname("AAAAAA1");
		user.setUtel("010-5555-7777");
		user.setZipcode("04794");
		user.setUadr("서울시 성동구 아차산로 117");
		user.setUadrdetail("2층 한국ICT인재개발원 성수센터");
		user.setUemail("AAAAAA1@ict.com");
		user.setEnabled("1");
		
		userMapper.modifyUser(user);
		
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
