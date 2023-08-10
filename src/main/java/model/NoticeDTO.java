package model;

import easyusers.dto.EasyusersDTO;

public class NoticeDTO {
	private int num;
	private String email;
	private String notice_title;
	private String notice_content;
	private String write_date;
	private int notice_count;

	private EasyusersDTO easyusersDTO;

	public NoticeDTO() {

	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	// users s가 안 붙어져있어서 붙여봄
	public EasyusersDTO getEasyusersDTO() {
		return easyusersDTO;
	}

	public void setEasyusersDTO(EasyusersDTO easyusersDTO) {
		this.easyusersDTO = easyusersDTO;
	}



}
