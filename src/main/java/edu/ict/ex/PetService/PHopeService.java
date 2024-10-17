package edu.ict.ex.PetService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.PetMapper.PHopeMapper;
import edu.ict.ex.vo.PetHopeIdJoinVO;
import edu.ict.ex.vo.PetHopeVO;

@Service
public class PHopeService {
	
	@Autowired
	private PHopeMapper pHopeMapper;
	
	public List<PetHopeIdJoinVO> hope() {
		return pHopeMapper.gethopeList();
	}

	public int insert(PetHopeVO petHopeVO) {
		return pHopeMapper.insert(petHopeVO);
	}

	public int remove(int hopeno) {
		// TODO Auto-generated method stub
		return pHopeMapper.remove(hopeno);
	}


}
