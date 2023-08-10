package review.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import easyusers.dto.EasyusersDTO;

//import easyusers.dto.EasyusersDTO;

public class ReviewDTO {
	private int num, review_count;
	private String email, info_title, review_title, review_content;
	private Date write_date;
	
	
	// easyuser DTO 추가
	private EasyusersDTO easyusersDTO;
	

	
	// reivew 테이블의 파일 첨부를 처리하는 멤버변수
	private String route_name; //board테이블의 upload

	// form 페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile reviewFilename; //filename // 멀티파일로 내보냄
	
	
	// 생성자
	public ReviewDTO() {
		
	}



	// getter, setter
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}
 

	public int getReview_count() {
		return review_count;
	}


	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getInfo_title() {
		return info_title;
	}


	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}


	public String getRoute_name() {
		return route_name;
	}


	// users s가 안 붙어져있어서 붙여봄
	public EasyusersDTO getEasyusersDTO() {
		return easyusersDTO;
	}



	public void setEasyusersDTO(EasyusersDTO easyusersDTO) {
		this.easyusersDTO = easyusersDTO;
	}



	public void setRoute_name(String route_name) {
		this.route_name = route_name;
	}


	public MultipartFile getReviewFilename() {
		return reviewFilename;
	}


	public void setReviewFilename(MultipartFile reviewFilename) {
		this.reviewFilename = reviewFilename;
	}
	
	
	

}
