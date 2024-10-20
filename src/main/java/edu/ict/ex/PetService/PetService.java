package edu.ict.ex.PetService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.PetMapper.PetMapper;
import edu.ict.ex.vo.PetVO;

@Service
public class PetService {
	@Autowired 
	private PetMapper petMapper;
	
	public List<PetVO> getList(){
		return petMapper.getList();
	}

	public PetVO get(int desertionNo) {
		
		return petMapper.get(desertionNo) ;
	}

	public int modify(PetVO petVO) {
		return petMapper.modify(petVO);
	}

	public int remove(int desertionNo) {
		return petMapper.remove(desertionNo);
	}

	public int insert(PetVO petVO) {
		return petMapper.insert(petVO);
	}

}
