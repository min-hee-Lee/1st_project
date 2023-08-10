package picture.service;

import java.util.List;
import java.util.Map;

import picture.dao.PictureDAO;
import picture.dto.PictureDTO;

public class PictureServiceImp implements PictureService {
	 private PictureDAO pictureDao;
		
		public void setPictureDao(PictureDAO pictureDao) {
			this.pictureDao = pictureDao;
		}

		@Override
		public List<PictureDTO> selectinfo_process(Map<String, String> map) {
			
			return pictureDao.selectinfo(map);
		}
	
	  
	
}
