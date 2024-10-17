package edu.ict.ex.PetMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.vo.PetVO;

@Mapper
public interface PetMapper {

	public List<PetVO> getList();

	public PetVO get(int desertionNo);

	public int modify(PetVO petVO);

	public int remove(int desertionNo);

	public int insert(PetVO petVO);
	
}
