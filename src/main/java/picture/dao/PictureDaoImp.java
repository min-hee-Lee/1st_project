package picture.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import picture.dto.PictureDTO;


public class PictureDaoImp implements PictureDAO{
	private SqlSession sqlSession;
	
public PictureDaoImp() {
		
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	

	@Override
	public List<PictureDTO> selectinfo(Map<String, String> map) {
		
	    return sqlSession.selectList("picture.selectinfo_theme", map);
	}

	
	
	
	
	
}

