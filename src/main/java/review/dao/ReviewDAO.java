package review.dao;

import java.util.List;

import review.dto.PageDTO;
import review.dto.ReviewDTO;

public interface ReviewDAO {
	
	public int reviewCount(); // 
	public List<ReviewDTO> reviewList(PageDTO pv);
	public void reviewReadCount(int num);
	public ReviewDTO reviewContent(int num);
	public void reviewSave(ReviewDTO dto); // 리뷰 저장
	public void reviewUpdate(ReviewDTO dto); // 리뷰 수정
	public void reviewDelete(int num); // 리뷰 삭제
	
	// 해당하는 파일을 가지고 온다.
	public String reviewGetFile(int num);
}












