package edu.ict.ex.PetMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.vo.PetBoardsCategoriesJoinVO;
import edu.ict.ex.vo.PetBoardsVO;

@Mapper
public interface PBoardMapper {
	public List<PetBoardsCategoriesJoinVO> getnoticeList(int cate_no);

	public PetBoardsVO getFindById(int bnum);

	public int modify(PetBoardsVO petBoardsVO);

	public int insert(PetBoardsVO petBoardsVO);

	public int remove(int bnum);
}
