package dao;

import java.util.List;

import model.NoticeDTO;
import model.PageDTO;

public interface NoticeDAO {
	public List<NoticeDTO> list();
	   
	   public void insertMethod(NoticeDTO dto);
	   
	   public NoticeDTO updateMethod(int num);
	   
	   public void updateMethod(NoticeDTO dto);
	   
	   public void deleteMethod(int num);
	   
	   public NoticeDTO one(int num);
	   
	   public int countMethod();
//
	   public NoticeDTO showMethod(int num);
	   public void showMethod(NoticeDTO dto);
//
	   public int count();
//

	   public List<NoticeDTO> list(PageDTO pv);

	

       public void notice_count(int num);	     
	 

	
	   


	   
	   
	   
	  
}
