package review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import review.dto.PageDTO;
import review.dto.ReviewDTO;

public class ReviewDaoImp implements ReviewDAO {
	private SqlSessionTemplate sqlSession;
	
	public ReviewDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	// 리뷰 카운트. 리뷰 고유 번호를 뜻함
	@Override
	public int reviewCount() {
		return sqlSession.selectOne("review.reviewCount");
	}

	@Override
	public List<ReviewDTO> reviewList(PageDTO pv) {
		
		return sqlSession.selectList("review.reviewList",pv);
	}

	@Override // 리뷰 리드 카운트. 조회수를 뜻함
	public void reviewReadCount(int num) {
		sqlSession.update("review.reviewReadCount",num);
		
	}

	@Override
	public ReviewDTO reviewContent(int num) {
		return sqlSession.selectOne("review.reviewContent", num);
	}

	// 리뷰 세이브 이름 변경. 
	@Override
	public void reviewSave(ReviewDTO dto) {
		sqlSession.insert("review.reviewSave",dto);
		
	}

	@Override
	public void reviewUpdate(ReviewDTO dto) {
		sqlSession.update("review.reviewUpdate",dto);
		
	}

	@Override
	public void reviewDelete(int num) {
		sqlSession.delete("review.reviewDelete",num);
		
	}

	@Override
	public String reviewGetFile(int num) {
		return sqlSession.selectOne("review.reviewGetFile",num);
	}

}
