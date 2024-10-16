package edu.ict.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.mapper.PetMapper;
import edu.ict.ex.vo.PetVO;

@Service
public class PetService {
	
	@Autowired
	private PetMapper petMapper;

	public List<PetVO> getList(){
		System.out.println("getList() ..");

		return petMapper.getList();
	}

}
