package information.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import information.dto.InformationDTO;

public class InformationDaoImp implements InformationDAO{
     private SqlSession sqlSession;
     
     public InformationDaoImp() {
		
	}
	
     public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<InformationDTO> chooseinfo(String info_title) {
		return sqlSession.selectList("information.chooseinfo_theme", info_title);
		
	}


	
     
     
}
