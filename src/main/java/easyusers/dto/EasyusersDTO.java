package easyusers.dto;

import common.exception.WrongEmailPasswordException;

public class EasyusersDTO {

	// 테이블 변수명과 일치해야함
	private String email;
	private String easyuser_pass;
	private String easyuser_name; 
	private String nick_name;
	private String phone_num;
	private String sex;
	private int birth;
	private int easyuser_type; // 회원구분
	private int easyuser_num; // 회원번호

	public EasyusersDTO() {

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEasyuser_pass() {
		return easyuser_pass;
	}

	public void setEasyuser_pass(String easyuser_pass) {
		//System.out.println(this.easyuser_pass);
		this.easyuser_pass = easyuser_pass;
	}

	public String getEasyuser_name() {
		return easyuser_name;
	}

	public void setEasyuser_name(String easyuser_name) {
		this.easyuser_name = easyuser_name;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public int getEasyuser_type() {
		return easyuser_type;
	}

	public void setEasyuser_type(int easyuser_type) {
		this.easyuser_type = easyuser_type;
	}

	public int getEasyuser_num() {
		return easyuser_num;
	}

	public void setEasyuser_num(int easyuser_num) {
		this.easyuser_num = easyuser_num;
	}


	// 로그인시 입력한 비번과 DB상 비번이 맞는지 확인(EasyuserServiceImp에서 예외처리 후 넘어옴)
	public boolean matchPassword(String easyuser_pass) {
		return this.easyuser_pass.equals(easyuser_pass);
	}

	// 비밀번호 변경 처리(기존에 입력한 비번과 새로 입력한 비번을 비교)
	public void changePassword(String oldPassword, String newPassword) {
		if (!easyuser_pass.equals(oldPassword))
			throw new WrongEmailPasswordException();
		this.easyuser_pass = newPassword;

	}
}
