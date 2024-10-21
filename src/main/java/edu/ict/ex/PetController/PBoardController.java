package edu.ict.ex.PetController;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.ict.ex.PetService.PetService;
import edu.ict.ex.PetService.PBoardService;
import edu.ict.ex.vo.PetBoardsCategoriesJoinVO;
import edu.ict.ex.vo.PetBoardsVO;
import edu.ict.ex.vo.PetVO;
import lombok.extern.slf4j.Slf4j;

// RestController 란 기존의 controller의 속성과 매우다름 restful을 사용하기 위한 컨트롤러

//https://luckyguystory.tistory.com/96
//ResponseEntity<String> 객체
//@RestController : Controller가 REST 방식을 처리하기 위한 것임을 명시
//@ResponseBody : 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도
//@PathVariable : URL 경로에 있는 값을 파라미터로 추출할 때 사용
//@CrossOrigin : Ajax의 크로스 도메인 문제를 해결해주는 어노테이션
//@RequestBody : JSON 데이터를 원하는 타입으로 바인딩 처리

@Slf4j
@RestController
@RequestMapping("/pboard")
public class PBoardController {
	@Autowired
	private PBoardService pBoardService;

	// 자바객체를 json으로 바꿔서 리턴 및 서비스 하고있음
	@GetMapping("/noticeList/{cate_no}")
	public List<PetBoardsCategoriesJoinVO> getnoticeList( @PathVariable int cate_no) {
		log.info("list()...");
		
		return pBoardService.getnoticeList(cate_no);
	}

	@GetMapping("/noticeList") // 경로변수
	public ModelAndView noticeList() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("pboard/noticeList");

		return mv;
	}
	
	@GetMapping("/QAList") // 경로변수
	public ModelAndView QAList() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("pboard/QAList");

		return mv;
	}
	
	@GetMapping("/reviewList") // 경로변수
	public ModelAndView reviewList() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("pboard/reviewList");

		return mv;
	}

	// 특정 게시판 번호를 받으면 해당 게시판 정보 서비스

	@GetMapping("/{bnum}") // 경로 변수
	public PetBoardsVO get(@PathVariable int bnum ) {
		log.info("content()...");
		
		return pBoardService.getFindById(bnum);
	}
//
//	// @PathVariable URL 경로에 있는 값을 파라미터로 추출할 떄 사용 @RestController가 있어서 주소에 있는 변수를
//	// 리턴할수있따
//	@GetMapping("/shop/{id}/{product}") // 경로 변수
//	public String content(@PathVariable int id, @PathVariable String product) {
//		log.info("아이디()..." + id);
//
//		return "상품번호는 " + id + product;
//	}
//
	@PutMapping("/")
	public ResponseEntity<String> modify(@RequestBody PetBoardsVO petBoardsVO  ) {
		System.out.println("수정 확인");
		log.info("update..");
		log.info("petVO" + petBoardsVO);
		
		ResponseEntity<String> entity = null;

		try {
			int rn = pBoardService.modify(petBoardsVO);

			entity = new ResponseEntity<String>(String.valueOf(rn), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@PostMapping("/")
	public ResponseEntity<String> insert(@RequestBody PetBoardsVO petBoardsVO) {

		log.info("update..");
		log.info("petVO" + petBoardsVO);

		ResponseEntity<String> entity = null;

		try {
			int rn = pBoardService.insert(petBoardsVO);

			entity = new ResponseEntity<String>(String.valueOf(rn), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@DeleteMapping("/{bnum}")
	public ResponseEntity<String> delete(@PathVariable int bnum) {

		log.info("delete..");
		log.info("board" + bnum);

		ResponseEntity<String> entity = null;

		try {
			int rn = pBoardService.remove(bnum);
			pBoardService.remove(bnum);
			entity = new ResponseEntity<String>(String.valueOf(rn), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	@PostMapping("/answer")
	   public ResponseEntity<String> reply(@RequestBody PetBoardsVO petBoardsVO) {

	      log.info("update..");
	      log.info("board" + petBoardsVO);

	      ResponseEntity<String> entity = null;

	      try {
	         pBoardService.boardReply(petBoardsVO);

	         entity = new ResponseEntity<String>("reply success", HttpStatus.OK);

	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	      }

	      return entity;
	}
	   

}
