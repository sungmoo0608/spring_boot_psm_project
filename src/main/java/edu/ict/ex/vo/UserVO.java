package edu.ict.ex.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/* 이름       널?       유형            
-------- -------- ------------- 
USERNAME NOT NULL VARCHAR2(50)  
USERID   NOT NULL VARCHAR2(50)  
PASSWORD NOT NULL VARCHAR2(100) 
UTEL     NOT NULL VARCHAR2(100) 
UADD     NOT NULL VARCHAR2(100) 
UEMAIL   NOT NULL VARCHAR2(100) 
ENABLED           CHAR(1)            	*/  

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class UserVO  {
	
	private String username;
	private String userid;
	private String password;
	private String utel;
	private String uadd;
	private String uemail;
	private String enabled;
	
	private List<AuthVO> authList;
	
}
