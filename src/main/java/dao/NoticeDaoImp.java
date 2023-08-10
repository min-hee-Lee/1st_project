package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import model.NoticeDTO;
import model.PageDTO;

public class NoticeDaoImp implements NoticeDAO{
   
   private SqlSessionTemplate sqlSession;
   
   public NoticeDaoImp() {
      
   }
   
   public void setSqlSession(SqlSessionTemplate sqlSession) {
      this.sqlSession = sqlSession;
   }

   @Override
   public List<NoticeDTO> list() {
   
      return sqlSession.selectList("noti.all");
   }

   @Override
   public void insertMethod(NoticeDTO dto) {
   
      sqlSession.insert("noti.ins",dto);
   }

   @Override
   public NoticeDTO updateMethod(int num) {
      
      return null;
   }

   @Override
   public void updateMethod(NoticeDTO dto) {
      
      sqlSession.update("noti.upt", dto);
      
   }

   @Override
   public void deleteMethod(int num) {
      
      sqlSession.delete("noti.del", num);
      
   }

   @Override
   public NoticeDTO one(int num) {
      
      return sqlSession.selectOne("noti.one", num);
   }

   @Override
   public int countMethod() {
      
      return 0;
   }

@Override
    public NoticeDTO showMethod(int num) {
	
	return null;
}

@Override
public void showMethod(NoticeDTO dto) {
	sqlSession.update("noti.shw", dto);
	
}

@Override
public int count() {
	return sqlSession.selectOne("noti.count");
}

@Override
public List<NoticeDTO> list(PageDTO pv) {
	
	return sqlSession.selectList("noti.list",pv);
}

//추가함

// 조회수 추가
@Override
public void notice_count(int num) {
	sqlSession.update("noti.notice_count", num);
	
}

	   
   
}