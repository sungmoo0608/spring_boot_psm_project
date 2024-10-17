package edu.ict.ex.PetMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.vo.PetHopeIdJoinVO;
import edu.ict.ex.vo.PetHopeVO;

@Mapper
public interface PHopeMapper {

	public List<PetHopeIdJoinVO> gethopeList();

	public int insert(PetHopeVO petHopeVO);

	public int remove(int hopeno);
	
}
