package picture.dto;

public class PictureDTO {
    private String pic_name;
    private String info_title;
    private String info_theme;
    private String info_content;
    private String info_type;
    
    public PictureDTO() {
		
	}

	public PictureDTO(String pic_name, String info_title, String info_theme, String info_content, String info_type) {
		this.pic_name = pic_name;
		this.info_title = info_title;
		this.info_theme = info_theme;
		this.info_content = info_content;
		this.info_type = info_type;
	}



	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
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


	public String getInfo_type() {
		return info_type;
	}

	public void setInfo_type(String info_type) {
		this.info_type = info_type;
	}
    
    
}
