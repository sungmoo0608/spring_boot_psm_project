package edu.ict.ex.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.ict.ex.vo.PetVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class PetMapperTest {
   
	@Autowired
	private PetMapper petMapper;
	
	@Test
	void testGetList() {
		System.out.println(petMapper.getList());
		
		for(PetVO vo : petMapper.getList()) {
			System.out.println(vo);
		}
	}

}
