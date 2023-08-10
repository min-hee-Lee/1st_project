package picture.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import picture.dto.PictureDTO;

public interface PictureDAO {
	
	public List<PictureDTO> selectinfo(Map<String, String> map);
	
   
}
