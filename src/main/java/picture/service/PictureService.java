package picture.service;

import java.util.List;
import java.util.Map;

import picture.dto.PictureDTO;

public interface PictureService {

	
	public List<PictureDTO> selectinfo_process(Map<String, String> map);
	
}
