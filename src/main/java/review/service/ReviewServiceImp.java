package review.service;

import java.io.File;
import java.util.List;

import review.dao.ReviewDAO;
import review.dto.PageDTO;
import review.dto.ReviewDTO;

public class ReviewServiceImp implements ReviewService{
	
	private ReviewDAO reviewDao;
	
	public ReviewServiceImp() {
		
	}
	
	public void setReviewDao(ReviewDAO reviewDao)
	{
		this.reviewDao=reviewDao;
	}

	@Override
	public int reviewCountProcess() {
		return reviewDao.reviewCount();
	}

	@Override
	public List<ReviewDTO> reviewListProcess(PageDTO pv) {
		return reviewDao.reviewList(pv);
	}

	@Override
	public void reviewInsertProcess(ReviewDTO dto) {
		
		// 답변글은 안 넣고 리뷰 저장만 넣기
		reviewDao.reviewSave(dto);
		
	}

	// 넘에 따른 내용 출력
	@Override
	public ReviewDTO reviewContentProcess(int num) {
		reviewDao.reviewReadCount(num);
		return reviewDao.reviewContent(num);
	}

	@Override
	public ReviewDTO reviewUpdateSelectProcess(int num) {
		return reviewDao.reviewContent(num);
	}

	// 수정
	@Override
	public void reviewUpdateProcess(ReviewDTO dto, String reviewUrlpath) {
		String reviewFilename = dto.getRoute_name(); // upload
		
		// 수정할 첨부파일이 없으면
		if(reviewFilename != null) {
			
			String path = reviewDao.reviewGetFile(dto.getNum());
			
			// 기존 첨부파일이 있으면
			if(path!=null) {
				File reviewFile = new File(reviewUrlpath, path);
				reviewFile.delete();
			}
		}
		
		reviewDao.reviewUpdate(dto);
		
	}

	@Override
	public void reviewDeleteProcess(int num, String reviewUrlpath) {
		String path = reviewDao.reviewGetFile(num);
		if(path!=null) {
			File file = new File(reviewUrlpath, path);
			file.delete();
		}
		reviewDao.reviewDelete(num);
		
	}

	@Override
	public String fileSelectProcess(int num) {
		// TODO Auto-generated method stub
		return null;
	}

}
