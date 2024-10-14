package edu.ict.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ict.ex.mapper.UserMapper;
import edu.ict.ex.vo.UserVO;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    public boolean isUserExists(String userid) {
        return userMapper.countUserById(userid) > 0;
    }
    
    public boolean isUserPhoneExists(String utel) {
        return userMapper.countUserByPhone(utel) > 0; 
    }

    public boolean isUserEmailExists(String uemail) {
        return userMapper.countUserByEmail(uemail) > 0;
    }
    
    public UserVO getUserById(String userid) {
        return userMapper.getUser(userid);
    }

    public boolean passwordMatches(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
    
    int modify(UserVO userVO);
    
    @Transactional // 트랜잭션 관리
    public void registerUser(UserVO userVO) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVO.getPassword());
        userVO.setPassword(encodedPassword); // 암호화된 비밀번호 설정
        userMapper.insertUser(userVO);
        userMapper.insertAuthorities(userVO);
    }
    
    @Transactional
    public void deleteUser(String userid) {
        userMapper.deleteAuthorities(userid);
        userMapper.deleteUser(userid);
    }
}