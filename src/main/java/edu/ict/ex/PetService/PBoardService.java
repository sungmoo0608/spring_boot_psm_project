package edu.ict.ex.PetService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ict.ex.PetMapper.PBoardMapper;
import edu.ict.ex.vo.PetBoardsCategoriesJoinVO;
import edu.ict.ex.vo.PetBoardsVO;

@Service
public class PBoardService {
	@Autowired 
	private PBoardMapper pBoardMapper;
	
	public List<PetBoardsCategoriesJoinVO> getnoticeList(int cate_no){
		return pBoardMapper.getnoticeList(cate_no);
	}

	public PetBoardsVO getFindById(int bnum) {

		PetBoardsVO petBoardsVO = new PetBoardsVO();
			      
		petBoardsVO.setBnum(bnum);
		pBoardMapper.updateHit(petBoardsVO);
		
		return pBoardMapper.getFindById(bnum);
		
	}

	public int modify(PetBoardsVO petBoardsVO) {
		return pBoardMapper.modify(petBoardsVO);
	}

	public int insert(PetBoardsVO petBoardsVO) {
		return pBoardMapper.insert(petBoardsVO);
	}

	public int remove(int bnum) {
		return pBoardMapper.remove(bnum);
		
	}
	
	@Transactional(rollbackFor = Exception.class)
	   public void boardReply(PetBoardsVO petBoardsVO) {
	      //log.info("댓글");
	      pBoardMapper.updateShape(petBoardsVO);
	      pBoardMapper.insertReply(petBoardsVO);
	      
	   }

}
