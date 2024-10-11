package edu.ict.ex.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.ict.ex.vo.UserVO;

//마이바티스용 인터페이스라는걸 알려주는 애노테이션
@Mapper
public interface UserMapper  {
	
	UserVO getUser(String userid);
	
    @Select("SELECT COUNT(*) FROM users WHERE userid = #{userid}")
    int countUserById(String userid);
	
	@Insert("insert into users(username, userid, password, utel, uadd, uemail) VALUES ( #{username}, #{userid}, #{password}, #{utel}, #{uadd}, #{uemail} )")
	int insertUser(UserVO userVO);
	   
	@Insert("insert into authorities(userid,authority) values(#{userid},'ROLE_USER')")
	int insertAuthorities(UserVO userVO);	
	
    @Delete("DELETE FROM users WHERE userid = #{userid}")
    int deleteUser(String userid);
    
    @Delete("DELETE FROM authorities WHERE userid = #{userid}")
    int deleteAuthorities(String userid);
	
}
