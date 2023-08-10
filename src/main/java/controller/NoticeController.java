package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.NoticeDAO;
import model.NoticeDTO;
import model.PageDTO;


// http://localhost:8090/myapp/user.do
@Controller
public class NoticeController {

	private NoticeDAO notiDao;
	private model.PageDTO pdto;

	public NoticeController() {
		
	}

	public void setNoticeDao(NoticeDAO notiDao) {
		this.notiDao = notiDao;
	}


	// 삽입 기능 추가
	@RequestMapping(value = "/noti/insert.do")
	public String insert(int num) {
		return "noti/user.do";
//		return "noti/insert.do";
		
	}
	

	// 로그인이 안된 상태면 로그인창으로 넘겨준다.
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public ModelAndView wrtieExecute(@ModelAttribute("dto") NoticeDTO dto, @ModelAttribute("pv") PageDTO pv,
			ModelAndView mav, HttpSession session) {
		
		// 세션 확인
		Object sessionObj = session.getAttribute("authInfo");
		
		// 세션 정보 확인
//		System.out.println(sessionObj);
	    if (sessionObj == null) {

	    	
	    	 mav.setViewName("redirect:/easyuser/login.do");
	    	
	        return mav;
	    }
		
		mav.setViewName("noti/insert");
		return mav;
	}

	
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insert(NoticeDTO dto) {
		notiDao.insertMethod(dto);
		return "redirect:/user.do";
	}

	
	@RequestMapping(value = "/noti/update.do")
	public String update(int num) {
		return "noti/update";
	}
	
	// 로그인이 안된 상타면 로그인 창으로 주소를 넘긴다.
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public ModelAndView update(int num, ModelAndView mav, HttpSession session) {
		
		// 세션 확인
		Object sessionObj = session.getAttribute("authInfo");
		
		// 세션 정보 확인
//		System.out.println(sessionObj);
	    if (sessionObj == null) {

	    	
	    	 mav.setViewName("redirect:/easyuser/login.do");
	    	
	        return mav;
	    }
		
		mav.addObject("dto", notiDao.one(num));
		mav.setViewName("noti/update");
		return mav;
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(NoticeDTO dto) {
		System.out.println("Update Query : " + dto.getNum());
		notiDao.updateMethod(dto);
		return "redirect:/user.do";
	}


	@RequestMapping(value = "/delete.do")
	public String delete(int num, int currentPage, HttpServletRequest request, RedirectAttributes ratt) {
 
		ratt.addAttribute("currentPage", currentPage);
		notiDao.deleteMethod(num);
		return "redirect:/user.do";
	}



	@RequestMapping(value = "/noti/show.do")
	public String show(int num, int currentPage, RedirectAttributes ratt) {
		ratt.addAttribute("currentPage", currentPage);
		return "noti/show";
	}
	



	  @RequestMapping(value = "/show.do", method = RequestMethod.GET) public
	  ModelAndView show(int num, ModelAndView mav) { notiDao.notice_count(num);
	  mav.addObject("dto", notiDao.one(num)); mav.setViewName("noti/show"); return
	  mav; }


	@RequestMapping(value = "/show.do", method = RequestMethod.POST)
	public String show(NoticeDTO dto) {
		System.out.println("Show Query : " + dto.getNum());
		notiDao.showMethod(dto);
		return "redirect:/list.do";
	}

	// 페이징 작업
	@RequestMapping("/user.do")
	public ModelAndView listExecute1(@ModelAttribute("pv") PageDTO pv, ModelAndView mav) {
		System.out.println("pv:" + pv.getCurrentPage());
		int totalRecord = notiDao.count();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				pv.setCurrentPage(1);
			this.pdto = new PageDTO(pv.getCurrentPage(), totalRecord);
			mav.addObject("pv", this.pdto);
			mav.addObject("aList", notiDao.list(this.pdto));
		}
		mav.setViewName("noti/user");
		return mav;
	}

}
