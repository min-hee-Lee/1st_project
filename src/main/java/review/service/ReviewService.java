package review.service;

import java.util.List;

import review.dto.PageDTO;
import review.dto.ReviewDTO;

public interface ReviewService {
	
	public int reviewCountProcess();
	public List<ReviewDTO> reviewListProcess(PageDTO pv);
	public void reviewInsertProcess(ReviewDTO dto);
	public ReviewDTO reviewContentProcess(int num);
	public ReviewDTO reviewUpdateSelectProcess(int num);
	public void reviewUpdateProcess(ReviewDTO dto, String reviewUrlpath);
	public void reviewDeleteProcess(int num, String reviewUrlpath);
	public String fileSelectProcess(int num);

}
