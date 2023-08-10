package easyusers.dao;

import org.apache.ibatis.session.SqlSession;

import easyusers.dto.EasyusersDTO;

public class EasyusersDaoImp implements EasyusersDAO{
	
	private SqlSession sqlSession;
	
	public EasyusersDaoImp() {
		
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertEasyuser(EasyusersDTO dto) {
		return sqlSession.insert("easyuser.insertEasyuser", dto);
	}
	
	@Override
	public EasyusersDTO selectByEmail(String email) {
		return sqlSession.selectOne("easyuser.selectByEmail", email);
	}
	
	//닉네임 중복체크
	@Override
	public int selectByNickname(String nick_name) {
		
	    return sqlSession.selectOne("easyuser.checkDuplicateNickname", nick_name);
	}

	//회원정보 수정
	@Override
	public void updateEasyuser(EasyusersDTO dto) {
		sqlSession.update("easyuser.updateEasyuser", dto);
	}
	
	//비밀번호 변경
	@Override
	public void updateByPass(EasyusersDTO dto) {
		sqlSession.update("easyuser.updateByPass", dto);
		
	}
	
}












