package information.dto;

import java.util.Date;

public class InformationDTO {
	private int num, info_count;
	private String email, info_title, info_theme, info_content, info_date, info_address, 
	entrance_fee, serviced_time, closed_day, info_tel, info_homepage;
	private Date write_date;
	private String pic_name;
   
   public InformationDTO() {
	
}

public InformationDTO(int num, int info_count, String email, String info_title, String info_theme, String info_content,
		String info_date, String info_address, String entrance_fee, String serviced_time, String closed_day,
		String info_tel, String info_homepage, Date write_date, String pic_name) {
	this.num = num;
	this.info_count = info_count;
	this.email = email;
	this.info_title = info_title;
	this.info_theme = info_theme;
	this.info_content = info_content;
	this.info_date = info_date;
	this.info_address = info_address;
	this.entrance_fee = entrance_fee;
	this.serviced_time = serviced_time;
	this.closed_day = closed_day;
	this.info_tel = info_tel;
	this.info_homepage = info_homepage;
	this.write_date = write_date;
	this.pic_name = pic_name;
}

public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public int getInfo_count() {
	return info_count;
}

public void setInfo_count(int info_count) {
	this.info_count = info_count;
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

public String getInfo_theme() {
	return info_theme;
}

public void setInfo_theme(String info_theme) {
	this.info_theme = info_theme;
}

public String getInfo_content() {
	return info_content;
}

public void setInfo_content(String info_content) {
	this.info_content = info_content;
}

public String getInfo_date() {
	return info_date;
}

public void setInfo_date(String info_date) {
	this.info_date = info_date;
}

public String getInfo_address() {
	return info_address;
}

public void setInfo_address(String info_address) {
	this.info_address = info_address;
}

public String getEntrance_fee() {
	return entrance_fee;
}

public void setEntrance_fee(String entrance_fee) {
	this.entrance_fee = entrance_fee;
}

public String getServiced_time() {
	return serviced_time;
}

public void setServiced_time(String serviced_time) {
	this.serviced_time = serviced_time;
}

public String getClosed_day() {
	return closed_day;
}

public void setClosed_day(String closed_day) {
	this.closed_day = closed_day;
}

public String getInfo_tel() {
	return info_tel;
}

public void setInfo_tel(String info_tel) {
	this.info_tel = info_tel;
}

public String getInfo_homepage() {
	return info_homepage;
}

public void setInfo_homepage(String info_homepage) {
	this.info_homepage = info_homepage;
}

public Date getWrite_date() {
	return write_date;
}

public void setWrite_date(Date write_date) {
	this.write_date = write_date;
}

public String getPic_name() {
	return pic_name;
}

public void setPic_name(String pic_name) {
	this.pic_name = pic_name;
}
   
   


   
}
