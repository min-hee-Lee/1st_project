package picture.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import picture.dto.PictureDTO;
import picture.service.PictureService;

//http://localhost:8090/myapp/home.do

@Controller
public class PictureController {

	private PictureService pictureService;

	public void setPictureService(PictureService pictureService) {
		this.pictureService = pictureService;
	}

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();

		if (map.get("info_theme") == null) {
			map.put("info_theme", "History");
			map.put("info_type", "alone");
		}

		List<PictureDTO> pictureDtoList = pictureService.selectinfo_process(map);
		mav.addObject("pictureDtoList", pictureDtoList);

		mav.setViewName("home");
		return mav;
	}
}
