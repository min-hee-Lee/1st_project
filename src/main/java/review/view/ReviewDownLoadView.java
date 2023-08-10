package review.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import common.file.FileUpload;
import review.dao.ReviewDAO;

public class ReviewDownLoadView extends AbstractView {
	
	private ReviewDAO reviewDao;
	
	private ReviewDownLoadView() {

	}
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		int num= Integer.parseInt(request.getParameter("num"));
		String saveDirectory = FileUpload.urlPath(request); // 파일이 저장되어 있는 웹 서버 위치를 가져온다.
		
		String upload = reviewDao.reviewGetFile(num);
		
		// 난수_실제 파일명. 난수 제거해서 가져오기
		String fileName = upload.substring(upload.indexOf("_")+1);
		
		//파일명이 한글일때 인코딩 작업을 한다.
		String str = URLEncoder.encode(fileName,"UTF-8");
		
		//원본파일명에서 공백이 있을 때, +표시가 되므로 공백으로 처리해줌. %20은 공백을 의미
		str = str.replaceAll("\\+", "%20");  
		
		// 타입이 정확하지 않고 다양할 때 아래처럼 선언한다.
		// 컨텐츠 타입
		response.setContentType("application/octet-stream");
		
		// 다운로드 창에 보여줄 파일명을 지정한다.
		response.setHeader("Content-Disposition", "attachment;filename=" + str +";");
		
		// 서버에 저장된 파일을 읽어와 클라이언트에 출력해 준다.                  완전한 파일명을 넣어야 한다.
		FileCopyUtils.copy(new FileInputStream(new File(saveDirectory, upload)), response.getOutputStream());
		
	}

}
