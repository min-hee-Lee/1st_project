package review.controller;


import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import common.file.FileUpload;
import information.service.InformationService;
import review.dto.PageDTO;
import review.dto.ReviewDTO;
import review.service.ReviewService;

// 컨트롤러 선언
@Controller
public class ReviewController {

	private ReviewService reviewService;
	 private InformationService informationService;
	private PageDTO pdto;

	public ReviewController() {

	}

	
		
		public void setInformationService(InformationService informationService) {
			this.informationService = informationService;
		}
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	// 페이징 작업
	@RequestMapping("/review/list.do")
	public ModelAndView listExecute(@ModelAttribute("pv") PageDTO pv, String info_title, String info_content, ModelAndView mav) {
		int totalRecord = reviewService.reviewCountProcess();

		

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				pv.setCurrentPage(1); // 현재 페이지에 1을 넣어줌
			this.pdto = new PageDTO(pv.getCurrentPage(), totalRecord);
			mav.addObject("pv", this.pdto);
			mav.addObject("aList", reviewService.reviewListProcess(this.pdto));
			mav.addObject("infoList", informationService.chooseinfo_process(info_title));
 
		}
		mav.setViewName("review/list"); // review/list로 이동
		return mav;
	}

	
	
	// 로그인이 안된 상태면 "로그인이 필요합니다" 알람 띄우고 로그인 주소를 넘겨준다. -> 알람 기능 구현은 못함. 로그인 페이지로 넘어감
	@RequestMapping(value = "/review/write.do", method = RequestMethod.GET)
	public ModelAndView wrtieExecute(@ModelAttribute("dto") ReviewDTO dto, @ModelAttribute("pv") PageDTO pv,
			ModelAndView mav, HttpSession session) {
		
		// 세션 확인
		Object sessionObj = session.getAttribute("authInfo");
		
		// 세션 정보 확인
//		System.out.println(sessionObj);
	    if (sessionObj == null) {

	    	
	    	 mav.setViewName("redirect:/easyuser/login.do");
	    	
	        return mav;
	    }
		
		mav.setViewName("review/write");
		return mav;
	}

	// 저장버튼 눌렀을 때 처리
	@RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	public String writeProExcute(ReviewDTO dto, PageDTO pv, HttpServletRequest req, HttpSession session,
			RedirectAttributes ratt) {

		// 1. 첨부파일 처리하기, 현재 멀티파일에 값이 있는지 없는지 확인하기. 첨부파일 유뮤 체크
		MultipartFile file = dto.getReviewFilename();

		// 첨부파일이 비어있지 않으면.. 파일 첨부가 있으면
		if (!file.isEmpty()) {
			UUID random = FileUpload.saveCopyFile(file, req);
			dto.setRoute_name(random + "_" + file.getOriginalFilename());
		}

		reviewService.reviewInsertProcess(dto); // 제목글에 대해서

		

		/* return "redirect:/review/list.do"; */
	
		return "redirect:/home.do";
	}

	@RequestMapping("/review/view.do")
	public ModelAndView viewExecute(int currentPage, int num, ModelAndView mav,HttpSession session) {

			
				// 세션 확인
				Object sessionObj = session.getAttribute("authInfo");
				
			    if (sessionObj == null) {			    	
			    	 mav.setViewName("redirect:/easyuser/login.do");			    	
			        return mav;
			    }
		
		mav.addObject("dto", reviewService.reviewContentProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("review/view");
		return mav;
	}

	
	@RequestMapping(value = "/review/update.do", method = RequestMethod.GET)
	public ModelAndView updateExecute(int num, int currentPage, ModelAndView mav) {
		mav.addObject("dto", reviewService.reviewUpdateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("review/update");
		return mav;
	}

	@RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
	public String updateExecute(ReviewDTO dto, int currentPage, HttpServletRequest request, RedirectAttributes ratt) {
		// 서버 정보를 가져온다.
		MultipartFile file = dto.getReviewFilename();

		///// 여기를 수정해야한다.
		// 첨부파일이 있으면 새로운 첨부파일로 저장해라
		if (!file.isEmpty()) {
			UUID random = FileUpload.saveCopyFile(file, request);
			dto.setRoute_name(random + "_" + file.getOriginalFilename());
		}

		reviewService.reviewUpdateProcess(dto, FileUpload.urlPath(request));

		// 아래 코드로 하면 될지도
		// reviewService.reviewUpdateProcess(dto, FileUpload.urlPath(request));

		// 최근 페이지 가져오기
		ratt.addAttribute("currentPage", currentPage);

//		return "redirect:/review/list.do"; // 리스트를 호출.
// 		return "redirect:/view/list.do"; // 리스트를 호출.
		return "redirect:/home.do"; // 리스트를 호출.. 홈이로 이동 됨
	}

	// 회원인 경우 삭제
	@RequestMapping("/review/delete.do")
	public String deleteExecute(int num, int currentPage, HttpServletRequest request, RedirectAttributes ratt) {
		ratt.addAttribute("currentPage", currentPage);
		reviewService.reviewDeleteProcess(num, FileUpload.urlPath(request));
		
		return "redirect:/home.do";
	}
	
	
	

	@RequestMapping("/review/contentdownload.do")
	public ModelAndView downloadExecute(int num, ModelAndView mav) {
		mav.addObject("num", num);
		mav.setViewName("download");
		return mav;
	}
	
	
	
	
  
	
	
}
